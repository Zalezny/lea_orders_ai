import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/core/failures.dart';
import '../../../domain/entities/product.dart';

part 'products_state.freezed.dart';

@freezed
sealed class ProductsState with _$ProductsState {
  const factory ProductsState({@Default(false) bool isLoading, @Default(<Product>[]) List<Product> items, Failure? failure}) = _ProductsState;
}
