import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../models/products_response_dto.dart';

part 'products_api.g.dart';

@RestApi(baseUrl: 'https://dummyjson.com')
abstract class ProductsApi {
  factory ProductsApi(Dio dio, {String baseUrl}) = _ProductsApi;

  @GET('/products')
  Future<ProductsResponseDto> getProducts({@Query('limit') int limit = 50});
}
