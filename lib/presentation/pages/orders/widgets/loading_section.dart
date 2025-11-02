import 'package:flutter/material.dart';

class LoadingSection extends StatelessWidget {
  const LoadingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
      child: Column(
        children: const [
          SizedBox(height: 12),
          Center(child: CircularProgressIndicator()),
          SizedBox(height: 16),
          Text('Analizuję zamówienie...'),
          SizedBox(height: 16),
          _SkeletonCard(),
          _SkeletonCard(),
          _SkeletonCard(),
        ],
      ),
    );
  }
}

class _SkeletonCard extends StatelessWidget {
  const _SkeletonCard();

  @override
  Widget build(BuildContext context) {
    return Container(
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
}
