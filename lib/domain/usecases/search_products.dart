import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../core/failures.dart';
import '../entities/product.dart';
import '../repositories/product_repository.dart';

@lazySingleton
class SearchProductsUseCase {
  final ProductRepository _repository;

  SearchProductsUseCase(this._repository);

  Future<Either<Failure, List<Product>>> call({required String query, int limit = 50}) {
    return _repository.searchProducts(query: query, limit: limit);
  }
}
