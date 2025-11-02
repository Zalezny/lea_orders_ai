// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_item_ai_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrderItemAiDto _$OrderItemAiDtoFromJson(Map<String, dynamic> json) =>
    _OrderItemAiDto(
      name: json['name'] as String,
      quantity: (json['quantity'] as num).toInt(),
    );

Map<String, dynamic> _$OrderItemAiDtoToJson(_OrderItemAiDto instance) =>
    <String, dynamic>{'name': instance.name, 'quantity': instance.quantity};
