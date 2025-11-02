import 'package:dartz/dartz.dart';

import '../core/failures.dart';
import '../entities/product.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<Product>>> fetchProducts({int limit = 50});
}
