import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubits/orders/order_cubit.dart';
import 'alert_banner.dart';

class ErrorSection extends StatelessWidget {
  final String message;
  const ErrorSection({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<OrderCubit>();
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          AlertBanner(text: message),
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
