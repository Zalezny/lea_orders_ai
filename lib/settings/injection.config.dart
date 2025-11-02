// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:lea_orders_ai/cubits/products/products_cubit.dart' as _i92;
import 'package:lea_orders_ai/data/datasources/remote/ai_api.dart' as _i882;
import 'package:lea_orders_ai/data/datasources/remote/products_api.dart'
    as _i427;
import 'package:lea_orders_ai/data/repositories/ai_repository_impl.dart'
    as _i102;
import 'package:lea_orders_ai/data/repositories/product_repository_impl.dart'
    as _i61;
import 'package:lea_orders_ai/domain/repositories/ai_repository.dart' as _i988;
import 'package:lea_orders_ai/domain/repositories/product_repository.dart'
    as _i691;
import 'package:lea_orders_ai/domain/usecases/fetch_products.dart' as _i312;
import 'package:lea_orders_ai/domain/usecases/match_order_items.dart' as _i394;
import 'package:lea_orders_ai/domain/usecases/parse_order_text.dart' as _i881;
import 'package:lea_orders_ai/domain/usecases/search_products.dart' as _i465;
import 'package:lea_orders_ai/services/config_service.dart' as _i132;
import 'package:lea_orders_ai/settings/app_module.dart' as _i645;
import 'package:logger/logger.dart' as _i974;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final appModule = _$AppModule();
    gh.lazySingleton<_i394.MatchOrderItemsUseCase>(
      () => _i394.MatchOrderItemsUseCase(),
    );
    gh.lazySingleton<_i132.ConfigService>(() => _i132.ConfigService());
    gh.lazySingleton<_i974.Logger>(() => appModule.logger());
    gh.lazySingleton<_i361.Dio>(() => appModule.dio(gh<_i974.Logger>()));
    gh.lazySingleton<_i427.ProductsApi>(
      () => appModule.productsApi(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i882.AiApi>(() => appModule.aiApi(gh<_i361.Dio>()));
    gh.lazySingleton<_i988.AiRepository>(
      () =>
          _i102.AiRepositoryImpl(gh<_i882.AiApi>(), gh<_i132.ConfigService>()),
    );
    gh.lazySingleton<_i881.ParseOrderTextUseCase>(
      () => _i881.ParseOrderTextUseCase(gh<_i988.AiRepository>()),
    );
    gh.lazySingleton<_i691.ProductRepository>(
      () => _i61.ProductRepositoryImpl(gh<_i427.ProductsApi>()),
    );
    gh.lazySingleton<_i312.FetchProductsUseCase>(
      () => _i312.FetchProductsUseCase(gh<_i691.ProductRepository>()),
    );
    gh.lazySingleton<_i465.SearchProductsUseCase>(
      () => _i465.SearchProductsUseCase(gh<_i691.ProductRepository>()),
    );
    gh.factory<_i92.ProductsCubit>(
      () => _i92.ProductsCubit(
        gh<_i312.FetchProductsUseCase>(),
        gh<_i465.SearchProductsUseCase>(),
      ),
    );
    return this;
  }
}

class _$AppModule extends _i645.AppModule {}
