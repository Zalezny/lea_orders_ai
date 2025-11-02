import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../domain/entities/matched_order_item.dart';
import 'info_kv.dart';

class OrderCard extends StatelessWidget {
  final MatchedOrderItem item;
  const OrderCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final fmt = NumberFormat.currency(locale: 'pl_PL', symbol: 'zł');
    final status = _statusOf(item);
    final color = status.color;
    final bg = status.bg;
    final label = status.label;
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 2)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(item.product?.title ?? item.originalName, style: const TextStyle(fontWeight: FontWeight.w600)),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: bg,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: color.withValues(alpha: 0.5)),
                ),
                child: Text(label, style: TextStyle(color: color, fontSize: 12)),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(child: InfoKV('Ilość', '${item.quantity} szt.')),
              Expanded(child: InfoKV('Cena jedn.', item.unitPrice > 0 ? fmt.format(item.unitPrice) : '-')),
              Expanded(child: InfoKV('Suma', item.lineTotal > 0 ? fmt.format(item.lineTotal) : '-', highlight: true)),
            ],
          ),
        ],
      ),
    );
  }

  _Status _statusOf(MatchedOrderItem i) {
    if (i.product == null) return const _Status('Niedopasowane', Colors.red, Color(0xFFFFEBEE));
    if (i.score < 0.7) return const _Status('Częściowe', Colors.orange, Color(0xFFFFF8E1));
    return const _Status('Dopasowane', Colors.green, Color(0xFFE8F5E9));
  }
}

class _Status {
  final String label;
  final Color color;
  final Color bg;
  const _Status(this.label, this.color, this.bg);
}
