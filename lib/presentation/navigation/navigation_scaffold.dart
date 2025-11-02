import 'package:flutter/material.dart';

import '../pages/orders/orders_page.dart';
import '../pages/products/products_page.dart';

class NavigationScaffold extends StatefulWidget {
  const NavigationScaffold({super.key});

  @override
  State<NavigationScaffold> createState() => _NavigationScaffoldState();
}

class _NavigationScaffoldState extends State<NavigationScaffold> {
  int _index = 0;

  final _pages = const [ProductsPage(), OrdersPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (i) => setState(() => _index = i),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Produkty'),
          BottomNavigationBarItem(icon: Icon(Icons.assignment_outlined), label: 'Zamówienie'),
        ],
      ),
    );
  }
}
