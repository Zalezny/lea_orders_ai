// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parsed_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ParsedItemDto _$ParsedItemDtoFromJson(Map<String, dynamic> json) =>
    _ParsedItemDto(
      name: json['name'] as String,
      quantity: (json['quantity'] as num).toInt(),
    );

Map<String, dynamic> _$ParsedItemDtoToJson(_ParsedItemDto instance) =>
    <String, dynamic>{'name': instance.name, 'quantity': instance.quantity};
