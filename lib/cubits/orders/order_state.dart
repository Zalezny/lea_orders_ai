import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/matched_order_item.dart';

part 'order_state.freezed.dart';

enum OrderUiStatus { empty, noApiKey, loading, success, partialSuccess, error }

@freezed
sealed class OrderState with _$OrderState {
  const factory OrderState({
    @Default(OrderUiStatus.empty) OrderUiStatus status,
    @Default('') String inputText,
    @Default(<MatchedOrderItem>[]) List<MatchedOrderItem> items,
    @Default(0.0) double total,
    String? errorMessage,
  }) = _OrderState;
}
