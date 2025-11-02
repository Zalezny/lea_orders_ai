// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ai_content_item_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AiContentItemDto {

 String get type; String? get text;
/// Create a copy of AiContentItemDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AiContentItemDtoCopyWith<AiContentItemDto> get copyWith => _$AiContentItemDtoCopyWithImpl<AiContentItemDto>(this as AiContentItemDto, _$identity);

  /// Serializes this AiContentItemDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AiContentItemDto&&(identical(other.type, type) || other.type == type)&&(identical(other.text, text) || other.text == text));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,text);

@override
String toString() {
  return 'AiContentItemDto(type: $type, text: $text)';
}


}

/// @nodoc
abstract mixin class $AiContentItemDtoCopyWith<$Res>  {
  factory $AiContentItemDtoCopyWith(AiContentItemDto value, $Res Function(AiContentItemDto) _then) = _$AiContentItemDtoCopyWithImpl;
@useResult
$Res call({
 String type, String? text
});




}
/// @nodoc
class _$AiContentItemDtoCopyWithImpl<$Res>
    implements $AiContentItemDtoCopyWith<$Res> {
  _$AiContentItemDtoCopyWithImpl(this._self, this._then);

  final AiContentItemDto _self;
  final $Res Function(AiContentItemDto) _then;

/// Create a copy of AiContentItemDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? text = freezed,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,text: freezed == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AiContentItemDto].
extension AiContentItemDtoPatterns on AiContentItemDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AiContentItemDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AiContentItemDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AiContentItemDto value)  $default,){
final _that = this;
switch (_that) {
case _AiContentItemDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AiContentItemDto value)?  $default,){
final _that = this;
switch (_that) {
case _AiContentItemDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String type,  String? text)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AiContentItemDto() when $default != null:
return $default(_that.type,_that.text);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String type,  String? text)  $default,) {final _that = this;
switch (_that) {
case _AiContentItemDto():
return $default(_that.type,_that.text);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String type,  String? text)?  $default,) {final _that = this;
switch (_that) {
case _AiContentItemDto() when $default != null:
return $default(_that.type,_that.text);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AiContentItemDto implements AiContentItemDto {
  const _AiContentItemDto({required this.type, this.text});
  factory _AiContentItemDto.fromJson(Map<String, dynamic> json) => _$AiContentItemDtoFromJson(json);

@override final  String type;
@override final  String? text;

/// Create a copy of AiContentItemDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AiContentItemDtoCopyWith<_AiContentItemDto> get copyWith => __$AiContentItemDtoCopyWithImpl<_AiContentItemDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AiContentItemDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AiContentItemDto&&(identical(other.type, type) || other.type == type)&&(identical(other.text, text) || other.text == text));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,text);

@override
String toString() {
  return 'AiContentItemDto(type: $type, text: $text)';
}


}

/// @nodoc
abstract mixin class _$AiContentItemDtoCopyWith<$Res> implements $AiContentItemDtoCopyWith<$Res> {
  factory _$AiContentItemDtoCopyWith(_AiContentItemDto value, $Res Function(_AiContentItemDto) _then) = __$AiContentItemDtoCopyWithImpl;
@override @useResult
$Res call({
 String type, String? text
});




}
/// @nodoc
class __$AiContentItemDtoCopyWithImpl<$Res>
    implements _$AiContentItemDtoCopyWith<$Res> {
  __$AiContentItemDtoCopyWithImpl(this._self, this._then);

  final _AiContentItemDto _self;
  final $Res Function(_AiContentItemDto) _then;

/// Create a copy of AiContentItemDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? text = freezed,}) {
  return _then(_AiContentItemDto(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,text: freezed == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
