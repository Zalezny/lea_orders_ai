import 'dart:convert';

import 'package:injectable/injectable.dart';

import '../entities/matched_order_item.dart';

@lazySingleton
class BuildOrderResultJsonUseCase {
  String call({required List<MatchedOrderItem> items, required double total}) {
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
    return const JsonEncoder.withIndent('  ').convert(payload);
  }
}
