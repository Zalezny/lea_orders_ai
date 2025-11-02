import 'matched_order_item.dart';

class OrderAnalysisResult {
  final List<MatchedOrderItem> items;
  final double total;

  const OrderAnalysisResult({required this.items, required this.total});
}
