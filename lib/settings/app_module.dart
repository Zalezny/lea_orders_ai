import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

import '../data/datasources/remote/products_api.dart';
import '../data/datasources/remote/ai_api.dart';

@module
abstract class AppModule {
  @lazySingleton
  Logger logger() => Logger();

  @lazySingleton
  Dio dio(Logger logger) {
    final dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 20),
        sendTimeout: const Duration(seconds: 20),
        headers: {'Content-Type': 'application/json', 'Accept': 'application/json'},
      ),
    );
    if (kDebugMode) {
      dio.interceptors.add(
        LogInterceptor(request: true, requestHeader: false, requestBody: true, responseBody: true, error: true, logPrint: (obj) => logger.i(obj)),
      );
    }

    return dio;
  }

  @lazySingleton
  ProductsApi productsApi(Dio dio) => ProductsApi(dio);

  @lazySingleton
  AiApi aiApi(Dio dio) => AiApi(dio, baseUrl: 'https://api.openai.com');
}
