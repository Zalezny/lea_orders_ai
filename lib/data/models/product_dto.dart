import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/product.dart';

part 'product_dto.freezed.dart';
part 'product_dto.g.dart';

@freezed
@freezed
sealed class ProductDto with _$ProductDto {
  const factory ProductDto({required int id, required String title, required num price, String? thumbnail}) = _ProductDto;

  factory ProductDto.fromJson(Map<String, dynamic> json) => _$ProductDtoFromJson(json);
}

extension ProductDtoX on ProductDto {
  Product toEntity() => Product(id: id, title: title, price: price.toDouble(), thumbnail: thumbnail);
}
