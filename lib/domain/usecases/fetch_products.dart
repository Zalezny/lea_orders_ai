import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../core/failures.dart';
import '../entities/product.dart';
import '../repositories/product_repository.dart';

@lazySingleton
class FetchProductsUseCase {
  final ProductRepository _repository;

  FetchProductsUseCase(this._repository);

  Future<Either<Failure, List<Product>>> call({int limit = 50}) {
    return _repository.fetchProducts(limit: limit);
  }
}
