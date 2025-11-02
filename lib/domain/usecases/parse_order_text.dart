import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../core/failures.dart';
import '../entities/order_item_parsed.dart';
import '../repositories/ai_repository.dart';

@lazySingleton
class ParseOrderTextUseCase {
  final AiRepository _repository;

  ParseOrderTextUseCase(this._repository);

  Future<Either<Failure, List<OrderItemParsed>>> call({required String text}) {
    return _repository.parseOrderText(text: text);
  }
}
