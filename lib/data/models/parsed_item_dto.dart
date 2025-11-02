import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/order_item_parsed.dart';

part 'parsed_item_dto.freezed.dart';
part 'parsed_item_dto.g.dart';

@freezed
sealed class ParsedItemDto with _$ParsedItemDto {
  const factory ParsedItemDto({required String name, required int quantity}) = _ParsedItemDto;

  factory ParsedItemDto.fromJson(Map<String, dynamic> json) => _$ParsedItemDtoFromJson(json);
}

extension ParsedItemDtoX on ParsedItemDto {
  OrderItemParsed toEntity() => OrderItemParsed(name: name, quantity: quantity);
}
