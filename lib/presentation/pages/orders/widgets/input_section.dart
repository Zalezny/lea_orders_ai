import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubits/orders/order_cubit.dart';
import 'alert_banner.dart';
import 'empty_placeholder.dart';

class InputSection extends StatefulWidget {
  final bool showNoKeyBanner;
  final String inputText;
  const InputSection({super.key, required this.showNoKeyBanner, required this.inputText});

  @override
  State<InputSection> createState() => _InputSectionState();
}

class _InputSectionState extends State<InputSection> {
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
            const AlertBanner(text: 'Brak klucza AI — dodaj w pliku konfiguracyjnym. Analiza niedostępna.', margin: EdgeInsets.only(bottom: 12)),
          const Text('Wklej tekst zamówienia', style: TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          TextField(
            controller: _controller,
            minLines: 8,
            maxLines: null, // auto-rozszerzanie wraz z treścią
            keyboardType: TextInputType.multiline,
            textInputAction: TextInputAction.newline,
            maxLength: 1000,
            maxLengthEnforcement: MaxLengthEnforcement.enforced,
            decoration: InputDecoration(
              hintText: 'Tutaj wklej treść maila z zamówieniem...',
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
              counterText: '${_controller.text.length}/1000',
              counterStyle: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
            onChanged: (v) {
              cubit.setInput(v);
              setState(() {});
            },
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
          if (!widget.showNoKeyBanner && _controller.text.trim().isEmpty) Column(children: const [SizedBox(height: 32), EmptyPlaceholder()]),
        ],
      ),
    );
  }
}
