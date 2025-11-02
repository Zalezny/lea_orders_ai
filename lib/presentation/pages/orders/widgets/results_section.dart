import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../domain/entities/matched_order_item.dart';
import '../../../cubits/orders/order_cubit.dart';
import 'order_card.dart';
import 'items_table.dart';

class ResultsSection extends StatefulWidget {
  final List<MatchedOrderItem> items;
  final double total;
  const ResultsSection({super.key, required this.items, required this.total});

  @override
  State<ResultsSection> createState() => _ResultsSectionState();
}

class _ResultsSectionState extends State<ResultsSection> {
  bool _tableView = false;

  @override
  Widget build(BuildContext context) {
    final hasIssues = widget.items.any((i) => i.product == null || i.score < 0.7);
    final fmt = NumberFormat.currency(locale: 'pl_PL', symbol: 'zł');
    final cubit = context.read<OrderCubit>();
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Wynik analizy', style: TextStyle(fontWeight: FontWeight.w600)),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('tabela', style: TextStyle(fontSize: 12, color: Colors.black54)),
                  Transform.scale(
                    scale: 0.9,
                    child: Switch(
                      value: _tableView,
                      onChanged: (v) => setState(() => _tableView = v),
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                  ),
                  if (!hasIssues)
                    const CircleAvatar(
                      radius: 16,
                      backgroundColor: Color(0xFFD1FAE5),
                      child: Icon(Icons.check_circle, color: Colors.green),
                    ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          if (_tableView) ItemsTable(items: widget.items) else ...widget.items.map((e) => OrderCard(item: e)),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [Color(0xFFE6FFFB), Color(0xFFEFF6FF)]),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.teal.shade200, width: 2),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Suma całkowita:', style: TextStyle(color: Colors.black54)),
                Text(
                  fmt.format(widget.total),
                  style: const TextStyle(color: Colors.teal, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: cubit.reset,
                  style: OutlinedButton.styleFrom(shape: const StadiumBorder()),
                  child: const Text('Resetuj'),
                ),
              ),
              const SizedBox(width: 8),
              OutlinedButton.icon(
                onPressed: () async {
                  await cubit.shareResultJson();
                },
                icon: const Icon(Icons.ios_share),
                label: const Text('Udostępnij'),
                style: OutlinedButton.styleFrom(shape: const StadiumBorder()),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
