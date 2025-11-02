import 'package:dartz/dartz.dart';

import '../core/failures.dart';
import '../entities/order_item_parsed.dart';

abstract class AiRepository {
  Future<Either<Failure, List<OrderItemParsed>>> parseOrderText({required String text});
}
