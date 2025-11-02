import 'package:injectable/injectable.dart';
import 'package:string_similarity/string_similarity.dart';

import '../entities/matched_order_item.dart';
import '../entities/order_analysis_result.dart';
import '../entities/order_item_parsed.dart';
import '../entities/product.dart';

@lazySingleton
class MatchOrderItemsUseCase {
  // default similarity threshold (can be overridden per call)
  final double threshold = 0.5;

  OrderAnalysisResult call({required List<OrderItemParsed> parsed, required List<Product> products, double? threshold}) {
    final items = <MatchedOrderItem>[];
    double total = 0;
    final th = threshold ?? this.threshold;

    for (final p in parsed) {
      final best = _bestMatch(p.name, products);
      if (best == null || best.$2 < th) {
        items.add(MatchedOrderItem(originalName: p.name, quantity: p.quantity, product: null, unitPrice: 0, lineTotal: 0, score: best?.$2 ?? 0));
        continue;
      }

      final product = best.$1;
      final price = product.price;
      final line = price * p.quantity;
      total += line;
      items.add(MatchedOrderItem(originalName: p.name, quantity: p.quantity, product: product, unitPrice: price, lineTotal: line, score: best.$2));
    }

    return OrderAnalysisResult(items: items, total: total);
  }

  (Product, double)? _bestMatch(String name, List<Product> products) {
    Product? best;
    double bestScore = 0;
    for (final prod in products) {
      final s = _similarity(name, prod.title);
      if (s > bestScore) {
        best = prod;
        bestScore = s;
      }
    }
    if (best == null) return null;
    return (best, bestScore);
  }

  // Simple token-based similarity with bonus for common prefixes and numbers
  double _similarity(String a, String b) {
    final na = _normalize(a);
    final nb = _normalize(b);
    if (na.isEmpty || nb.isEmpty) return 0;

    // Use Sørensen–Dice similarity from package
    final dice = StringSimilarity.compareTwoStrings(na, nb);

    // Small numeric token overlap bonus (helps with model numbers)
    final numsA = RegExp(r"[0-9]+[a-zA-Z]*").allMatches(na).map((m) => m.group(0)!).toSet();
    final numsB = RegExp(r"[0-9]+[a-zA-Z]*").allMatches(nb).map((m) => m.group(0)!).toSet();
    final numBonus = numsA.isEmpty && numsB.isEmpty ? 0 : numsA.intersection(numsB).length / (numsA.union(numsB).length);

    return (dice * 0.9) + (numBonus * 0.1);
  }

  String _normalize(String s) {
    final lower = s.toLowerCase();
    final noPunct = lower.replaceAll(RegExp(r"[^a-z0-9\s]"), ' ');
    // collapse multiple spaces
    return noPunct.replaceAll(RegExp(r"\s+"), ' ').trim();
  }
}
