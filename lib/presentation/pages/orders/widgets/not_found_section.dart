import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubits/orders/order_cubit.dart';

class NotFoundSection extends StatelessWidget {
  const NotFoundSection({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<OrderCubit>();
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 32),
          const Icon(Icons.search_off, size: 72, color: Colors.grey),
          const SizedBox(height: 12),
          const Text('Nic nie znaleziono', style: TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 6),
          const Text(
            'AI nie rozpoznało żadnych pozycji. Zmień lub doprecyzuj treść i spróbuj ponownie.',
            style: TextStyle(color: Colors.grey),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton.icon(
                onPressed: cubit.backToEdit,
                icon: const Icon(Icons.edit),
                label: const Text('Wróć i edytuj'),
                style: OutlinedButton.styleFrom(shape: const StadiumBorder()),
              ),
              const SizedBox(width: 12),
              ElevatedButton.icon(
                onPressed: cubit.analyze,
                icon: const Icon(Icons.refresh),
                label: const Text('Spróbuj ponownie'),
                style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
