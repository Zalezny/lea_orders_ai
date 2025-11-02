import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../core/failures.dart';
import '../entities/matched_order_item.dart';
import '../repositories/file_export_repository.dart';

@lazySingleton
class ExportOrderResultUseCase {
  final FileExportRepository _repository;

  ExportOrderResultUseCase(this._repository);

  Future<Either<Failure, String>> call({required List<MatchedOrderItem> items, required double total}) {
    return _repository.exportOrderResult(items: items, total: total);
  }
}
