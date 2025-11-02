import 'package:flutter/material.dart';

class AlertBanner extends StatelessWidget {
  final String text;
  final EdgeInsetsGeometry? margin;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? textColor;

  const AlertBanner({super.key, required this.text, this.margin, this.backgroundColor, this.borderColor, this.textColor});

  @override
  Widget build(BuildContext context) {
    final bg = backgroundColor ?? Colors.red.shade50;
    final border = borderColor ?? Colors.red.shade200;
    final tColor = textColor ?? Colors.red;
    return Container(
      padding: const EdgeInsets.all(12),
      margin: margin ?? const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: border),
      ),
      child: Text(text, style: TextStyle(color: tColor)),
    );
  }
}
