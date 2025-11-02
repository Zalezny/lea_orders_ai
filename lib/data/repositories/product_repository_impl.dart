import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/product.dart';
import '../../domain/repositories/product_repository.dart';
import '../datasources/remote/products_api.dart';
import '../models/product_dto.dart';
import '../network/dio_error_mapper.dart';
import '../../domain/core/failures.dart';

@LazySingleton(as: ProductRepository)
class ProductRepositoryImpl implements ProductRepository {
  final ProductsApi _api;

  ProductRepositoryImpl(this._api);

  @override
  Future<Either<Failure, List<Product>>> fetchProducts({int limit = 50}) async {
    try {
      final response = await _api.getProducts(limit: limit);
      final products = response.products.map((e) => e.toEntity()).toList();
      return right(products);
    } on DioException catch (e) {
      return left(DioErrorMapper.map(e));
    } catch (_) {
      return left(const UnknownFailure('Coś poszło nie tak'));
    }
  }

  @override
  Future<Either<Failure, List<Product>>> searchProducts({required String query, int limit = 50}) async {
    try {
      final response = await _api.searchProducts(query: query, limit: limit);
      final products = response.products.map((e) => e.toEntity()).toList();
      return right(products);
    } on DioException catch (e) {
      return left(DioErrorMapper.map(e));
    } catch (_) {
      return left(const UnknownFailure('Coś poszło nie tak'));
    }
  }
}
