import 'package:flutter/material.dart';

class ErrorState extends StatelessWidget {
  final VoidCallback onRetry;
  const ErrorState({super.key, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 64,
              height: 64,
              decoration: const BoxDecoration(color: Color(0xFFFFEBEE), shape: BoxShape.circle),
              child: const Icon(Icons.error_outline, color: Colors.red, size: 32),
            ),
            const SizedBox(height: 16),
            const Text('Nie udało się pobrać produktów', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            const SizedBox(height: 8),
            const Text(
              'Sprawdź połączenie z internetem i spróbuj ponownie',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: onRetry,
              icon: const Icon(Icons.refresh),
              label: const Text('Spróbuj ponownie'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.teal, shape: const StadiumBorder()),
            ),
          ],
        ),
      ),
    );
  }
}
