import 'package:dartz/dartz.dart';

import '../core/failures.dart';
import '../entities/matched_order_item.dart';

abstract class FileExportRepository {
  Future<Either<Failure, String>> exportOrderResult({required List<MatchedOrderItem> items, required double total});
}
