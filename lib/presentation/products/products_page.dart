import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/products/products_cubit.dart';
import '../../cubits/products/products_state.dart';
import '../../settings/injection.dart';
import 'widgets/product_card.dart';
import 'widgets/product_skeleton.dart';
import '../common/error_state.dart';
import '../common/empty_search_state.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_) => getIt<ProductsCubit>()..load(), child: const _ProductsView());
  }
}

class _ProductsView extends StatefulWidget {
  const _ProductsView();

  @override
  State<_ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<_ProductsView> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Produkty',
          style: TextStyle(fontWeight: FontWeight.w700, color: Theme.of(context).brightness == Brightness.light ? Colors.black : Colors.white),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    textInputAction: TextInputAction.search,
                    decoration: InputDecoration(
                      hintText: 'Szukaj produktów…',
                      prefixIcon: Icon(Icons.search, color: Colors.grey.shade500),
                      suffixIcon: _controller.text.isNotEmpty
                          ? IconButton(
                              icon: const Icon(Icons.close),
                              color: Colors.grey.shade600,
                              onPressed: () {
                                setState(() => _controller.clear());
                                context.read<ProductsCubit>().load();
                              },
                            )
                          : null,
                      filled: true,
                      fillColor: const Color(0xFFF7F9FC),
                      contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(28),
                        borderSide: BorderSide(color: Colors.grey.shade200),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(28),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                    ),
                    onSubmitted: (value) {
                      context.read<ProductsCubit>().search(value);
                    },
                    onChanged: (value) => setState(() {}),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: BlocBuilder<ProductsCubit, ProductsState>(
              builder: (context, state) {
                if (state.isLoading) {
                  return ListView.separated(
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    itemBuilder: (_, __) => const ProductSkeleton(),
                    separatorBuilder: (_, __) => const SizedBox(height: 12),
                    itemCount: 6,
                  );
                }
                if (state.failure != null) {
                  return ErrorState(
                    onRetry: () {
                      final q = _controller.text.trim();
                      if (q.isEmpty) {
                        context.read<ProductsCubit>().load();
                      } else {
                        context.read<ProductsCubit>().search(q);
                      }
                    },
                  );
                }
                final items = state.items;
                if (items.isEmpty) {
                  if (_controller.text.trim().isNotEmpty) {
                    return const EmptySearchState();
                  }
                  return const Center(child: Text('Brak produktów'));
                }
                return RefreshIndicator(
                  onRefresh: () => context.read<ProductsCubit>().refresh(),
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    itemCount: items.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      final p = items[index];
                      return ProductCard(product: p);
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
