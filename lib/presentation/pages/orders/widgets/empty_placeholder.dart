import 'package:flutter/material.dart';

class EmptyPlaceholder extends StatelessWidget {
  const EmptyPlaceholder({super.key});

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
