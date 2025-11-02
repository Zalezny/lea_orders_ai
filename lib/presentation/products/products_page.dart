import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/products/products_cubit.dart';
import '../../cubits/products/products_state.dart';
import '../../settings/injection.dart';

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
      appBar: AppBar(title: const Text('Products')),
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
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _controller.clear();
                          context.read<ProductsCubit>().load();
                        },
                      ),
                      border: const OutlineInputBorder(),
                    ),
                    onSubmitted: (value) {
                      context.read<ProductsCubit>().search(value);
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: BlocBuilder<ProductsCubit, ProductsState>(
              builder: (context, state) {
                if (state.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state.failure != null) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(state.failure!.message, textAlign: TextAlign.center),
                    ),
                  );
                }
                final items = state.items;
                if (items.isEmpty) {
                  return const Center(child: Text('Brak produktów'));
                }
                return RefreshIndicator(
                  onRefresh: () => context.read<ProductsCubit>().refresh(),
                  child: ListView.separated(
                    itemCount: items.length,
                    separatorBuilder: (_, __) => const Divider(height: 1),
                    itemBuilder: (context, index) {
                      final p = items[index];
                      return ListTile(
                        leading: p.thumbnail != null
                            ? Image.network(p.thumbnail!, width: 48, height: 48, fit: BoxFit.cover)
                            : const Icon(Icons.image_not_supported),
                        title: Text(p.title),
                        subtitle: Text(p.price.toStringAsFixed(2)),
                      );
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
