import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/product.dart';
import '../../domain/usecases/fetch_products.dart';
import '../../domain/usecases/match_order_items.dart';
import '../../domain/usecases/parse_order_text.dart';
import '../../domain/usecases/export_order_result.dart';
import '../../services/config_service.dart';
import 'order_state.dart';

@injectable
class OrderCubit extends Cubit<OrderState> {
  final ParseOrderTextUseCase _parse;
  final FetchProductsUseCase _fetchProducts;
  final MatchOrderItemsUseCase _match;
  final ExportOrderResultUseCase _export;
  final ConfigService _config;

  OrderCubit(this._parse, this._fetchProducts, this._match, this._export, this._config) : super(const OrderState());

  Future<void> init() async {
    final key = await _config.openAIApiKey;
    if (key == null || key.isEmpty) {
      emit(state.copyWith(status: OrderUiStatus.noApiKey));
    } else {
      emit(state.copyWith(status: OrderUiStatus.empty));
    }
  }

  void setInput(String text) {
    emit(state.copyWith(inputText: text));
  }

  Future<void> analyze() async {
    // Check API key first
    final key = await _config.openAIApiKey;
    if (key == null || key.isEmpty) {
      emit(state.copyWith(status: OrderUiStatus.noApiKey));
      return;
    }

    final text = state.inputText.trim();
    if (text.isEmpty) return;

    emit(state.copyWith(status: OrderUiStatus.loading, errorMessage: null));

    // Step 1: parse order text with AI
    final parsedRes = await _parse(text: text);
    if (parsedRes.isLeft()) {
      final failure = parsedRes.fold((l) => l, (r) => throw StateError('unreachable'));
      emit(state.copyWith(status: OrderUiStatus.error, errorMessage: failure.message));
      return;
    }
    final parsed = parsedRes.getOrElse(() => const []);

    // Step 2: fetch products
    final prodsRes = await _fetchProducts(limit: 999);
    if (prodsRes.isLeft()) {
      final failure = prodsRes.fold((l) => l, (r) => throw StateError('unreachable'));
      emit(state.copyWith(status: OrderUiStatus.error, errorMessage: failure.message));
      return;
    }
    final products = prodsRes.getOrElse(() => const <Product>[]);

    // Step 3: match
    double threshold;
    try {
      threshold = await _config.matchingThreshold;
    } on ConfigException catch (e) {
      emit(state.copyWith(status: OrderUiStatus.error, errorMessage: e.message));
      return;
    }

    final result = _match(parsed: parsed.cast(), products: products, threshold: threshold);

    // Determine final status
    final items = result.items;
    final partialCutoff = 0.7; // caution threshold
    bool hasUnmatched = items.any((i) => i.product == null);
    bool hasPartial = items.any((i) => i.product != null && i.score < partialCutoff);
    final uiStatus = (hasUnmatched || hasPartial) ? OrderUiStatus.partialSuccess : OrderUiStatus.success;

    emit(state.copyWith(status: uiStatus, items: items, total: result.total));
  }

  void reset() {
    emit(const OrderState(status: OrderUiStatus.empty));
  }

  Future<String> exportJson() async {
    final items = state.items;

    final encoded = jsonEncode(
      items
          .map(
            (i) => {
              'productName': i.product?.title ?? i.originalName,
              'quantity': i.quantity,
              'unitPrice': i.unitPrice,
              'total': i.lineTotal,
              'status': i.product == null ? 'unmatched' : (i.score < 0.7 ? 'partial' : 'matched'),
            },
          )
          .toList(),
    );
    return encoded;
  }

  /// Exports current result to a JSON file via domain use case. Returns file path or null on failure.
  Future<String?> exportToFile() async {
    if (state.items.isEmpty) return null;
    final res = await _export(items: state.items, total: state.total);
    return res.fold((_) => null, (path) => path);
  }
}
