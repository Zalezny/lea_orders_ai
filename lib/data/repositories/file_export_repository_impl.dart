import 'dart:convert';
import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:dartz/dartz.dart';

import '../../domain/core/failures.dart';
import '../../domain/entities/matched_order_item.dart';
import '../../domain/repositories/file_export_repository.dart';

@LazySingleton(as: FileExportRepository)
class FileExportRepositoryImpl implements FileExportRepository {
  @override
  Future<Either<Failure, String>> exportOrderResult({required List<MatchedOrderItem> items, required double total}) async {
    try {
      final payload = {
        'items': items
            .map(
              (i) => {
                'productName': i.product?.title ?? i.originalName,
                'quantity': i.quantity,
                'unitPrice': i.unitPrice,
                'lineTotal': i.lineTotal,
                'status': i.product == null ? 'unmatched' : (i.score < 0.7 ? 'partial' : 'matched'),
              },
            )
            .toList(),
        'total': total,
      };

      final content = const JsonEncoder.withIndent('  ').convert(payload);
      final dir = await getApplicationDocumentsDirectory();
      final ts = DateTime.now().toIso8601String().replaceAll(':', '-').replaceAll('.', '-');
      final path = '${dir.path}/order_export_$ts.json';
      final file = File(path);
      await file.writeAsString(content);
      return right(path);
    } catch (e) {
      return left(UnknownFailure('Błąd zapisu pliku: $e'));
    }
  }
}
