import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/order_item_parsed.dart';

part 'order_item_ai_dto.freezed.dart';
part 'order_item_ai_dto.g.dart';

@freezed
sealed class OrderItemAiDto with _$OrderItemAiDto {
  const factory OrderItemAiDto({required String name, required int quantity}) = _OrderItemAiDto;

  factory OrderItemAiDto.fromJson(Map<String, dynamic> json) => _$OrderItemAiDtoFromJson(json);
}

extension OrderItemAiDtoX on OrderItemAiDto {
  OrderItemParsed toEntity() => OrderItemParsed(name: name, quantity: quantity);
}
