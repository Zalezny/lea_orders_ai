import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/usecases/fetch_products.dart';
import '../../domain/usecases/search_products.dart';
import 'products_state.dart';

@injectable
class ProductsCubit extends Cubit<ProductsState> {
  final FetchProductsUseCase _fetchProducts;
  final SearchProductsUseCase _searchProducts;

  ProductsCubit(this._fetchProducts, this._searchProducts) : super(const ProductsState());

  Future<void> load({int limit = 50}) async {
    emit(state.copyWith(isLoading: true, failure: null));
    final res = await _fetchProducts(limit: limit);
    res.fold((failure) => emit(state.copyWith(isLoading: false, failure: failure)), (items) => emit(state.copyWith(isLoading: false, items: items)));
  }

  Future<void> refresh({int limit = 50}) => load(limit: limit);

  Future<void> search(String query, {int limit = 50}) async {
    if (query.trim().isEmpty) {
      return load(limit: limit);
    }
    emit(state.copyWith(isLoading: true, failure: null));
    final res = await _searchProducts(query: query, limit: limit);
    res.fold((failure) => emit(state.copyWith(isLoading: false, failure: failure)), (items) => emit(state.copyWith(isLoading: false, items: items)));
  }
}
