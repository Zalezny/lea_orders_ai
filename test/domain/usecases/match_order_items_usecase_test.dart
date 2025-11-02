import 'package:flutter_test/flutter_test.dart';

import 'package:lea_orders_ai/domain/entities/order_item_parsed.dart';
import 'package:lea_orders_ai/domain/entities/product.dart';
import 'package:lea_orders_ai/domain/usecases/match_order_items.dart';

void main() {
  test('matches iPhone 6S to Apple iPhone 6S with decent score', () {
    final usecase = MatchOrderItemsUseCase();
    final parsed = [OrderItemParsed(name: 'iPhone 6S', quantity: 2)];
    final products = [const Product(id: 1, title: 'Apple iPhone 6S', price: 1000), const Product(id: 2, title: 'Samsung Galaxy S21', price: 2000)];

    final result = usecase(parsed: parsed, products: products);
    expect(result.items.length, 1);
    final item = result.items.first;
    expect(item.matched, true);
    expect(item.product?.id, 1);
    expect(item.quantity, 2);
    expect(item.unitPrice, 1000);
    expect(item.lineTotal, 2000);
    expect(item.score, greaterThan(0.5));
  });

  test('marks unmatched when far string', () {
    final usecase = MatchOrderItemsUseCase();
    final parsed = [OrderItemParsed(name: 'Some unknown product', quantity: 1)];
    final products = [const Product(id: 1, title: 'Apple iPhone 6S', price: 1000)];

    final result = usecase(parsed: parsed, products: products);
    final item = result.items.first;
    expect(item.matched, false);
    expect(item.lineTotal, 0);
  });
}
