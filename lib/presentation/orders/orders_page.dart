import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../cubits/orders/order_cubit.dart';
import '../../cubits/orders/order_state.dart';
import '../../domain/entities/matched_order_item.dart';
import '../../settings/injection.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_) => getIt<OrderCubit>()..init(), child: const _OrdersView());
  }
}

class _OrdersView extends StatelessWidget {
  const _OrdersView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Zamówienie'), centerTitle: true),
      body: BlocBuilder<OrderCubit, OrderState>(
        builder: (context, state) {
          switch (state.status) {
            case OrderUiStatus.noApiKey:
            case OrderUiStatus.empty:
              return _InputSection(showNoKeyBanner: state.status == OrderUiStatus.noApiKey, inputText: state.inputText);
            case OrderUiStatus.loading:
              return const _LoadingSection();
            case OrderUiStatus.error:
              return _ErrorSection(message: state.errorMessage ?? 'Wystąpił błąd podczas analizy.');
            case OrderUiStatus.success:
            case OrderUiStatus.partialSuccess:
              return _ResultsSection(items: state.items, total: state.total);
          }
        },
      ),
    );
  }
}

class _InputSection extends StatefulWidget {
  final bool showNoKeyBanner;
  final String inputText;
  const _InputSection({required this.showNoKeyBanner, required this.inputText});

  @override
  State<_InputSection> createState() => _InputSectionState();
}

class _InputSectionState extends State<_InputSection> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.inputText);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<OrderCubit>();
    final disabled = widget.showNoKeyBanner || _controller.text.trim().isEmpty;
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.showNoKeyBanner)
            Container(
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.only(bottom: 12),
              decoration: BoxDecoration(
                color: Colors.red.shade50,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.red.shade200),
              ),
              child: const Text('Brak klucza AI — dodaj w pliku konfiguracyjnym. Analiza niedostępna.', style: TextStyle(color: Colors.red)),
            ),
          const Text('Wklej tekst zamówienia', style: TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          TextField(
            controller: _controller,
            maxLines: 10,
            minLines: 8,
            decoration: InputDecoration(
              hintText: 'Tutaj wklej treść maila z zamówieniem...',
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
            ),
            onChanged: cubit.setInput,
          ),
          const SizedBox(height: 12),
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: disabled ? null : () => cubit.analyze(),
                  style: ElevatedButton.styleFrom(shape: const StadiumBorder(), padding: const EdgeInsets.symmetric(vertical: 16)),
                  icon: const Icon(Icons.auto_awesome),
                  label: const Text('Analizuj zamówienie'),
                ),
              ),
              if (widget.showNoKeyBanner)
                const Positioned(
                  bottom: -24,
                  child: Text('Dodaj klucz aby uruchomić analizę', style: TextStyle(fontSize: 12, color: Colors.grey)),
                ),
            ],
          ),
          const SizedBox(height: 24),
          if (!widget.showNoKeyBanner && _controller.text.trim().isEmpty) Column(children: const [SizedBox(height: 32), _EmptyPlaceholder()]),
        ],
      ),
    );
  }
}

class _EmptyPlaceholder extends StatelessWidget {
  const _EmptyPlaceholder();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        CircleAvatar(
          radius: 40,
          backgroundColor: Color(0xFFE6F7F4),
          child: Icon(Icons.smart_toy, size: 40, color: Colors.teal),
        ),
        SizedBox(height: 12),
        Text('Analiza AI zamówienia', style: TextStyle(fontWeight: FontWeight.w600)),
        SizedBox(height: 6),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            'Wklej treść maila z zamówieniem i kliknij Analizuj, aby automatycznie rozpoznać produkty i ceny',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey),
          ),
        ),
      ],
    );
  }
}

class _LoadingSection extends StatelessWidget {
  const _LoadingSection();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
      child: Column(
        children: [
          const SizedBox(height: 12),
          const Center(child: CircularProgressIndicator()),
          const SizedBox(height: 16),
          const Text('Analizuję zamówienie...'),
          const SizedBox(height: 16),
          ...List.generate(3, (i) => _skeletonCard()),
        ],
      ),
    );
  }

  Widget _skeletonCard() => Container(
    margin: const EdgeInsets.only(bottom: 12),
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: Colors.grey.shade200),
    ),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(height: 16, width: 160, color: Colors.grey.shade200),
            Container(
              height: 22,
              width: 60,
              decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.circular(12)),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(child: Container(height: 12, color: Colors.grey.shade200)),
            const SizedBox(width: 8),
            Expanded(child: Container(height: 12, color: Colors.grey.shade200)),
            const SizedBox(width: 8),
            Expanded(child: Container(height: 12, color: Colors.grey.shade200)),
          ],
        ),
      ],
    ),
  );
}

class _ErrorSection extends StatelessWidget {
  final String message;
  const _ErrorSection({required this.message});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<OrderCubit>();
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              color: Colors.red.shade50,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.red.shade200),
            ),
            child: Text(message, style: const TextStyle(color: Colors.red)),
          ),
          const SizedBox(height: 24),
          const Icon(Icons.error_outline, size: 64, color: Colors.red),
          const SizedBox(height: 12),
          const Text('Błąd analizy AI', style: TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 6),
          const Text('Nie udało się przetworzyć zamówienia', style: TextStyle(color: Colors.grey)),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: cubit.reset,
            icon: const Icon(Icons.refresh),
            label: const Text('Spróbuj ponownie'),
            style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
          ),
        ],
      ),
    );
  }
}

class _ResultsSection extends StatelessWidget {
  final List<MatchedOrderItem> items;
  final double total;
  const _ResultsSection({required this.items, required this.total});

  @override
  Widget build(BuildContext context) {
    final hasIssues = items.any((i) => i.product == null || i.score < 0.7);
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
              if (!hasIssues)
                const CircleAvatar(
                  radius: 16,
                  backgroundColor: Color(0xFFD1FAE5),
                  child: Icon(Icons.check_circle, color: Colors.green),
                ),
            ],
          ),
          const SizedBox(height: 8),
          ...items.map((e) => _OrderCard(item: e)),
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
                  fmt.format(total),
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
                  final path = await cubit.exportToFile();
                  if (!context.mounted) return;
                  if (path != null) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Zapisano plik: $path')));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Błąd zapisu pliku')));
                  }
                },
                icon: const Icon(Icons.download),
                label: const Text('Eksportuj'),
                style: OutlinedButton.styleFrom(shape: const StadiumBorder()),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _OrderCard extends StatelessWidget {
  final MatchedOrderItem item;
  const _OrderCard({required this.item});

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
              Expanded(child: _kv('Ilość', '${item.quantity} szt.')),
              Expanded(child: _kv('Cena jedn.', item.unitPrice > 0 ? fmt.format(item.unitPrice) : '-')),
              Expanded(child: _kv('Suma', item.lineTotal > 0 ? fmt.format(item.lineTotal) : '-', highlight: true)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _kv(String k, String v, {bool highlight = false}) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(k, style: const TextStyle(color: Colors.grey, fontSize: 12)),
      const SizedBox(height: 4),
      Text(v, style: TextStyle(color: highlight ? Colors.teal : null)),
    ],
  );

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
