import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../domain/entities/matched_order_item.dart';

class ItemsTable extends StatelessWidget {
  final List<MatchedOrderItem> items;
  const ItemsTable({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    final fmt = NumberFormat.currency(locale: 'pl_PL', symbol: 'zł');
    final headerStyle = Theme.of(context).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w600, color: Colors.black87);
    final cellStyle = Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.black87);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Row(
              children: [
                Expanded(flex: 2, child: Text('Nazwa produktu', style: headerStyle)),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text('Ilość', style: headerStyle),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text('Cena jedn.', style: headerStyle),
                  ),
                ),
              ],
            ),
          ),
          Divider(height: 1, color: Colors.grey.shade200),
          ...items.map((e) {
            final name = e.product?.title ?? e.originalName;
            final qty = '${e.quantity}';
            final unit = e.unitPrice > 0 ? fmt.format(e.unitPrice) : '-';
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(name, maxLines: 1, overflow: TextOverflow.ellipsis, style: cellStyle),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(qty, style: cellStyle),
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(unit, style: cellStyle),
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
