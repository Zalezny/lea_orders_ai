import 'package:flutter/material.dart';

class InfoKV extends StatelessWidget {
  final String label;
  final String value;
  final bool highlight;

  const InfoKV(this.label, this.value, {super.key, this.highlight = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
        const SizedBox(height: 4),
        Text(value, style: TextStyle(color: highlight ? Colors.teal : null)),
      ],
    );
  }
}
