import 'package:freezed_annotation/freezed_annotation.dart';

import 'ai_output_message_dto.dart';

part 'ai_response_dto.freezed.dart';

@freezed
sealed class AiResponseDto with _$AiResponseDto {
  const factory AiResponseDto({required List<AiOutputMessageDto> output}) = _AiResponseDto;

  /// Custom fromJson to be resilient to non-message items in `output` (e.g. "reasoning").
  /// The OpenAI Responses API may include entries like `{ type: "reasoning", summary: [] }`.
  /// We filter to items with `type == "message"` and a list `content` before deserializing.
  factory AiResponseDto.fromJson(Map<String, dynamic> json) {
    final raw = json['output'];
    final List<dynamic> list = raw is List ? raw : const [];
    final messages = <AiOutputMessageDto>[];
    for (final e in list) {
      if (e is Map<String, dynamic>) {
        final type = e['type'];
        final content = e['content'];
        if (type == 'message' && content is List) {
          try {
            messages.add(AiOutputMessageDto.fromJson(e));
          } catch (_) {
            // ignore malformed message entries, continue
          }
        }
      }
    }
    return AiResponseDto(output: messages);
  }
}
