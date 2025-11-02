import 'product.dart';

class MatchedOrderItem {
  final String originalName;
  final int quantity;
  final Product? product; // null when unmatched
  final double unitPrice; // 0 when unmatched
  final double lineTotal; // unitPrice * quantity
  final double score; // 0..1 similarity score

  const MatchedOrderItem({
    required this.originalName,
    required this.quantity,
    required this.product,
    required this.unitPrice,
    required this.lineTotal,
    required this.score,
  });

  bool get matched => product != null;
}
