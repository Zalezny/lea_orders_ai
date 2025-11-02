// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProductsResponseDto _$ProductsResponseDtoFromJson(Map<String, dynamic> json) =>
    _ProductsResponseDto(
      products: (json['products'] as List<dynamic>)
          .map((e) => ProductDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num?)?.toInt(),
      skip: (json['skip'] as num?)?.toInt(),
      limit: (json['limit'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ProductsResponseDtoToJson(
  _ProductsResponseDto instance,
) => <String, dynamic>{
  'products': instance.products,
  'total': instance.total,
  'skip': instance.skip,
  'limit': instance.limit,
};
