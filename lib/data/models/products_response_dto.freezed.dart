// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'products_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProductsResponseDto {

 List<ProductDto> get products; int? get total; int? get skip; int? get limit;
/// Create a copy of ProductsResponseDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductsResponseDtoCopyWith<ProductsResponseDto> get copyWith => _$ProductsResponseDtoCopyWithImpl<ProductsResponseDto>(this as ProductsResponseDto, _$identity);

  /// Serializes this ProductsResponseDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductsResponseDto&&const DeepCollectionEquality().equals(other.products, products)&&(identical(other.total, total) || other.total == total)&&(identical(other.skip, skip) || other.skip == skip)&&(identical(other.limit, limit) || other.limit == limit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(products),total,skip,limit);

@override
String toString() {
  return 'ProductsResponseDto(products: $products, total: $total, skip: $skip, limit: $limit)';
}


}

/// @nodoc
abstract mixin class $ProductsResponseDtoCopyWith<$Res>  {
  factory $ProductsResponseDtoCopyWith(ProductsResponseDto value, $Res Function(ProductsResponseDto) _then) = _$ProductsResponseDtoCopyWithImpl;
@useResult
$Res call({
 List<ProductDto> products, int? total, int? skip, int? limit
});




}
/// @nodoc
class _$ProductsResponseDtoCopyWithImpl<$Res>
    implements $ProductsResponseDtoCopyWith<$Res> {
  _$ProductsResponseDtoCopyWithImpl(this._self, this._then);

  final ProductsResponseDto _self;
  final $Res Function(ProductsResponseDto) _then;

/// Create a copy of ProductsResponseDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? products = null,Object? total = freezed,Object? skip = freezed,Object? limit = freezed,}) {
  return _then(_self.copyWith(
products: null == products ? _self.products : products // ignore: cast_nullable_to_non_nullable
as List<ProductDto>,total: freezed == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int?,skip: freezed == skip ? _self.skip : skip // ignore: cast_nullable_to_non_nullable
as int?,limit: freezed == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductsResponseDto].
extension ProductsResponseDtoPatterns on ProductsResponseDto {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductsResponseDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductsResponseDto() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductsResponseDto value)  $default,){
final _that = this;
switch (_that) {
case _ProductsResponseDto():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductsResponseDto value)?  $default,){
final _that = this;
switch (_that) {
case _ProductsResponseDto() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ProductDto> products,  int? total,  int? skip,  int? limit)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductsResponseDto() when $default != null:
return $default(_that.products,_that.total,_that.skip,_that.limit);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ProductDto> products,  int? total,  int? skip,  int? limit)  $default,) {final _that = this;
switch (_that) {
case _ProductsResponseDto():
return $default(_that.products,_that.total,_that.skip,_that.limit);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ProductDto> products,  int? total,  int? skip,  int? limit)?  $default,) {final _that = this;
switch (_that) {
case _ProductsResponseDto() when $default != null:
return $default(_that.products,_that.total,_that.skip,_that.limit);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductsResponseDto implements ProductsResponseDto {
  const _ProductsResponseDto({required final  List<ProductDto> products, this.total, this.skip, this.limit}): _products = products;
  factory _ProductsResponseDto.fromJson(Map<String, dynamic> json) => _$ProductsResponseDtoFromJson(json);

 final  List<ProductDto> _products;
@override List<ProductDto> get products {
  if (_products is EqualUnmodifiableListView) return _products;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_products);
}

@override final  int? total;
@override final  int? skip;
@override final  int? limit;

/// Create a copy of ProductsResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductsResponseDtoCopyWith<_ProductsResponseDto> get copyWith => __$ProductsResponseDtoCopyWithImpl<_ProductsResponseDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductsResponseDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductsResponseDto&&const DeepCollectionEquality().equals(other._products, _products)&&(identical(other.total, total) || other.total == total)&&(identical(other.skip, skip) || other.skip == skip)&&(identical(other.limit, limit) || other.limit == limit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_products),total,skip,limit);

@override
String toString() {
  return 'ProductsResponseDto(products: $products, total: $total, skip: $skip, limit: $limit)';
}


}

/// @nodoc
abstract mixin class _$ProductsResponseDtoCopyWith<$Res> implements $ProductsResponseDtoCopyWith<$Res> {
  factory _$ProductsResponseDtoCopyWith(_ProductsResponseDto value, $Res Function(_ProductsResponseDto) _then) = __$ProductsResponseDtoCopyWithImpl;
@override @useResult
$Res call({
 List<ProductDto> products, int? total, int? skip, int? limit
});




}
/// @nodoc
class __$ProductsResponseDtoCopyWithImpl<$Res>
    implements _$ProductsResponseDtoCopyWith<$Res> {
  __$ProductsResponseDtoCopyWithImpl(this._self, this._then);

  final _ProductsResponseDto _self;
  final $Res Function(_ProductsResponseDto) _then;

/// Create a copy of ProductsResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? products = null,Object? total = freezed,Object? skip = freezed,Object? limit = freezed,}) {
  return _then(_ProductsResponseDto(
products: null == products ? _self._products : products // ignore: cast_nullable_to_non_nullable
as List<ProductDto>,total: freezed == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int?,skip: freezed == skip ? _self.skip : skip // ignore: cast_nullable_to_non_nullable
as int?,limit: freezed == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
