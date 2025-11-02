import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../domain/core/failures.dart';
import '../../domain/entities/order_item_parsed.dart';
import '../../domain/repositories/ai_repository.dart';
import '../datasources/remote/ai_api.dart';
import '../models/ai/ai_response_dto.dart';
import '../models/order_item_ai_dto.dart';
import '../network/dio_error_mapper.dart';
import '../../services/config_service.dart';

@LazySingleton(as: AiRepository)
class AiRepositoryImpl implements AiRepository {
  final AiApi _api;
  final ConfigService _config;

  AiRepositoryImpl(this._api, this._config);

  @override
  Future<Either<Failure, List<OrderItemParsed>>> parseOrderText({required String text}) async {
    try {
      final key = await _config.openAIApiKey;
      if (key == null) {
        return left(const ConfigFailure('Brak klucza API AI. Uzupełnij plik assets/config/app_config.json.'));
      }
      AiSettings ai;
      try {
        ai = await _config.aiSettings;
      } on ConfigException catch (e) {
        return left(ConfigFailure(e.message));
      }

      final body = <String, dynamic>{
        'model': ai.model,
        'input': '${ai.inputPrompt}\n\n$text',
        'store': ai.store,
        'temperature': ai.temperature,
        'top_p': ai.topP,
      };

      final AiResponseDto resp = await _api.createResponse(body, authorization: 'Bearer $key');

      final String? outText = _extractText(resp);
      if (outText == null || outText.trim().isEmpty) {
        return left(const ParsingFailure('AI nie zwróciło poprawnego wyniku.'));
      }

      final dynamic decoded = jsonDecode(outText);
      if (decoded is! List) {
        return left(const ParsingFailure('Oczekiwano tablicy JSON z pozycjami.'));
      }

      final items = <OrderItemParsed>[];
      for (final e in decoded) {
        if (e is Map<String, dynamic>) {
          try {
            final dto = OrderItemAiDto.fromJson(e);
            items.add(dto.toEntity());
          } catch (_) {
            // ignore malformed entry, we will fail if none parsed
          }
        }
      }
      if (items.isEmpty) {
        return left(const ParsingFailure('Nie udało się sparsować żadnej pozycji z JSON.'));
      }
      return right(items);
    } on DioException catch (e) {
      final status = e.response?.statusCode;
      if (status == 401) {
        return left(const ConfigFailure('Nieprawidłowy klucz API AI (401).'));
      }
      return left(DioErrorMapper.map(e));
    } on ConfigException catch (e) {
      return left(ConfigFailure(e.message));
    } catch (_) {
      return left(const UnknownFailure('Coś poszło nie tak podczas analizy AI'));
    }
  }

  String? _extractText(AiResponseDto resp) {
    if (resp.output.isEmpty) return null;
    for (final msg in resp.output) {
      for (final c in msg.content) {
        if (c.type == 'output_text' && (c.text?.isNotEmpty ?? false)) {
          return c.text;
        }
      }
    }
    return null;
  }
}
