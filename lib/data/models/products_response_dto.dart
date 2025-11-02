import 'package:freezed_annotation/freezed_annotation.dart';

import 'product_dto.dart';

part 'products_response_dto.freezed.dart';
part 'products_response_dto.g.dart';

@freezed
sealed class ProductsResponseDto with _$ProductsResponseDto {
  const factory ProductsResponseDto({required List<ProductDto> products, int? total, int? skip, int? limit}) = _ProductsResponseDto;

  factory ProductsResponseDto.fromJson(Map<String, dynamic> json) => _$ProductsResponseDtoFromJson(json);
}
