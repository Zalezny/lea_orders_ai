// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_item_ai_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrderItemAiDto {

 String get name; int get quantity;
/// Create a copy of OrderItemAiDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderItemAiDtoCopyWith<OrderItemAiDto> get copyWith => _$OrderItemAiDtoCopyWithImpl<OrderItemAiDto>(this as OrderItemAiDto, _$identity);

  /// Serializes this OrderItemAiDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderItemAiDto&&(identical(other.name, name) || other.name == name)&&(identical(other.quantity, quantity) || other.quantity == quantity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,quantity);

@override
String toString() {
  return 'OrderItemAiDto(name: $name, quantity: $quantity)';
}


}

/// @nodoc
abstract mixin class $OrderItemAiDtoCopyWith<$Res>  {
  factory $OrderItemAiDtoCopyWith(OrderItemAiDto value, $Res Function(OrderItemAiDto) _then) = _$OrderItemAiDtoCopyWithImpl;
@useResult
$Res call({
 String name, int quantity
});




}
/// @nodoc
class _$OrderItemAiDtoCopyWithImpl<$Res>
    implements $OrderItemAiDtoCopyWith<$Res> {
  _$OrderItemAiDtoCopyWithImpl(this._self, this._then);

  final OrderItemAiDto _self;
  final $Res Function(OrderItemAiDto) _then;

/// Create a copy of OrderItemAiDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? quantity = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderItemAiDto].
extension OrderItemAiDtoPatterns on OrderItemAiDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderItemAiDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderItemAiDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderItemAiDto value)  $default,){
final _that = this;
switch (_that) {
case _OrderItemAiDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderItemAiDto value)?  $default,){
final _that = this;
switch (_that) {
case _OrderItemAiDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  int quantity)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderItemAiDto() when $default != null:
return $default(_that.name,_that.quantity);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  int quantity)  $default,) {final _that = this;
switch (_that) {
case _OrderItemAiDto():
return $default(_that.name,_that.quantity);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  int quantity)?  $default,) {final _that = this;
switch (_that) {
case _OrderItemAiDto() when $default != null:
return $default(_that.name,_that.quantity);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderItemAiDto implements OrderItemAiDto {
  const _OrderItemAiDto({required this.name, required this.quantity});
  factory _OrderItemAiDto.fromJson(Map<String, dynamic> json) => _$OrderItemAiDtoFromJson(json);

@override final  String name;
@override final  int quantity;

/// Create a copy of OrderItemAiDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderItemAiDtoCopyWith<_OrderItemAiDto> get copyWith => __$OrderItemAiDtoCopyWithImpl<_OrderItemAiDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderItemAiDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderItemAiDto&&(identical(other.name, name) || other.name == name)&&(identical(other.quantity, quantity) || other.quantity == quantity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,quantity);

@override
String toString() {
  return 'OrderItemAiDto(name: $name, quantity: $quantity)';
}


}

/// @nodoc
abstract mixin class _$OrderItemAiDtoCopyWith<$Res> implements $OrderItemAiDtoCopyWith<$Res> {
  factory _$OrderItemAiDtoCopyWith(_OrderItemAiDto value, $Res Function(_OrderItemAiDto) _then) = __$OrderItemAiDtoCopyWithImpl;
@override @useResult
$Res call({
 String name, int quantity
});




}
/// @nodoc
class __$OrderItemAiDtoCopyWithImpl<$Res>
    implements _$OrderItemAiDtoCopyWith<$Res> {
  __$OrderItemAiDtoCopyWithImpl(this._self, this._then);

  final _OrderItemAiDto _self;
  final $Res Function(_OrderItemAiDto) _then;

/// Create a copy of OrderItemAiDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? quantity = null,}) {
  return _then(_OrderItemAiDto(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
