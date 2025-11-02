// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ai_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AiResponseDto {

 List<AiOutputMessageDto> get output;
/// Create a copy of AiResponseDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AiResponseDtoCopyWith<AiResponseDto> get copyWith => _$AiResponseDtoCopyWithImpl<AiResponseDto>(this as AiResponseDto, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AiResponseDto&&const DeepCollectionEquality().equals(other.output, output));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(output));

@override
String toString() {
  return 'AiResponseDto(output: $output)';
}


}

/// @nodoc
abstract mixin class $AiResponseDtoCopyWith<$Res>  {
  factory $AiResponseDtoCopyWith(AiResponseDto value, $Res Function(AiResponseDto) _then) = _$AiResponseDtoCopyWithImpl;
@useResult
$Res call({
 List<AiOutputMessageDto> output
});




}
/// @nodoc
class _$AiResponseDtoCopyWithImpl<$Res>
    implements $AiResponseDtoCopyWith<$Res> {
  _$AiResponseDtoCopyWithImpl(this._self, this._then);

  final AiResponseDto _self;
  final $Res Function(AiResponseDto) _then;

/// Create a copy of AiResponseDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? output = null,}) {
  return _then(_self.copyWith(
output: null == output ? _self.output : output // ignore: cast_nullable_to_non_nullable
as List<AiOutputMessageDto>,
  ));
}

}


/// Adds pattern-matching-related methods to [AiResponseDto].
extension AiResponseDtoPatterns on AiResponseDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AiResponseDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AiResponseDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AiResponseDto value)  $default,){
final _that = this;
switch (_that) {
case _AiResponseDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AiResponseDto value)?  $default,){
final _that = this;
switch (_that) {
case _AiResponseDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<AiOutputMessageDto> output)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AiResponseDto() when $default != null:
return $default(_that.output);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<AiOutputMessageDto> output)  $default,) {final _that = this;
switch (_that) {
case _AiResponseDto():
return $default(_that.output);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<AiOutputMessageDto> output)?  $default,) {final _that = this;
switch (_that) {
case _AiResponseDto() when $default != null:
return $default(_that.output);case _:
  return null;

}
}

}

/// @nodoc


class _AiResponseDto implements AiResponseDto {
  const _AiResponseDto({required final  List<AiOutputMessageDto> output}): _output = output;
  

 final  List<AiOutputMessageDto> _output;
@override List<AiOutputMessageDto> get output {
  if (_output is EqualUnmodifiableListView) return _output;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_output);
}


/// Create a copy of AiResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AiResponseDtoCopyWith<_AiResponseDto> get copyWith => __$AiResponseDtoCopyWithImpl<_AiResponseDto>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AiResponseDto&&const DeepCollectionEquality().equals(other._output, _output));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_output));

@override
String toString() {
  return 'AiResponseDto(output: $output)';
}


}

/// @nodoc
abstract mixin class _$AiResponseDtoCopyWith<$Res> implements $AiResponseDtoCopyWith<$Res> {
  factory _$AiResponseDtoCopyWith(_AiResponseDto value, $Res Function(_AiResponseDto) _then) = __$AiResponseDtoCopyWithImpl;
@override @useResult
$Res call({
 List<AiOutputMessageDto> output
});




}
/// @nodoc
class __$AiResponseDtoCopyWithImpl<$Res>
    implements _$AiResponseDtoCopyWith<$Res> {
  __$AiResponseDtoCopyWithImpl(this._self, this._then);

  final _AiResponseDto _self;
  final $Res Function(_AiResponseDto) _then;

/// Create a copy of AiResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? output = null,}) {
  return _then(_AiResponseDto(
output: null == output ? _self._output : output // ignore: cast_nullable_to_non_nullable
as List<AiOutputMessageDto>,
  ));
}


}

// dart format on
