// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ai_output_message_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AiOutputMessageDto {

 String? get type; String? get id; String? get status; String? get role; List<AiContentItemDto> get content;
/// Create a copy of AiOutputMessageDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AiOutputMessageDtoCopyWith<AiOutputMessageDto> get copyWith => _$AiOutputMessageDtoCopyWithImpl<AiOutputMessageDto>(this as AiOutputMessageDto, _$identity);

  /// Serializes this AiOutputMessageDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AiOutputMessageDto&&(identical(other.type, type) || other.type == type)&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.role, role) || other.role == role)&&const DeepCollectionEquality().equals(other.content, content));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,id,status,role,const DeepCollectionEquality().hash(content));

@override
String toString() {
  return 'AiOutputMessageDto(type: $type, id: $id, status: $status, role: $role, content: $content)';
}


}

/// @nodoc
abstract mixin class $AiOutputMessageDtoCopyWith<$Res>  {
  factory $AiOutputMessageDtoCopyWith(AiOutputMessageDto value, $Res Function(AiOutputMessageDto) _then) = _$AiOutputMessageDtoCopyWithImpl;
@useResult
$Res call({
 String? type, String? id, String? status, String? role, List<AiContentItemDto> content
});




}
/// @nodoc
class _$AiOutputMessageDtoCopyWithImpl<$Res>
    implements $AiOutputMessageDtoCopyWith<$Res> {
  _$AiOutputMessageDtoCopyWithImpl(this._self, this._then);

  final AiOutputMessageDto _self;
  final $Res Function(AiOutputMessageDto) _then;

/// Create a copy of AiOutputMessageDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = freezed,Object? id = freezed,Object? status = freezed,Object? role = freezed,Object? content = null,}) {
  return _then(_self.copyWith(
type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,role: freezed == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String?,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as List<AiContentItemDto>,
  ));
}

}


/// Adds pattern-matching-related methods to [AiOutputMessageDto].
extension AiOutputMessageDtoPatterns on AiOutputMessageDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AiOutputMessageDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AiOutputMessageDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AiOutputMessageDto value)  $default,){
final _that = this;
switch (_that) {
case _AiOutputMessageDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AiOutputMessageDto value)?  $default,){
final _that = this;
switch (_that) {
case _AiOutputMessageDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? type,  String? id,  String? status,  String? role,  List<AiContentItemDto> content)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AiOutputMessageDto() when $default != null:
return $default(_that.type,_that.id,_that.status,_that.role,_that.content);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? type,  String? id,  String? status,  String? role,  List<AiContentItemDto> content)  $default,) {final _that = this;
switch (_that) {
case _AiOutputMessageDto():
return $default(_that.type,_that.id,_that.status,_that.role,_that.content);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? type,  String? id,  String? status,  String? role,  List<AiContentItemDto> content)?  $default,) {final _that = this;
switch (_that) {
case _AiOutputMessageDto() when $default != null:
return $default(_that.type,_that.id,_that.status,_that.role,_that.content);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AiOutputMessageDto implements AiOutputMessageDto {
  const _AiOutputMessageDto({this.type, this.id, this.status, this.role, required final  List<AiContentItemDto> content}): _content = content;
  factory _AiOutputMessageDto.fromJson(Map<String, dynamic> json) => _$AiOutputMessageDtoFromJson(json);

@override final  String? type;
@override final  String? id;
@override final  String? status;
@override final  String? role;
 final  List<AiContentItemDto> _content;
@override List<AiContentItemDto> get content {
  if (_content is EqualUnmodifiableListView) return _content;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_content);
}


/// Create a copy of AiOutputMessageDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AiOutputMessageDtoCopyWith<_AiOutputMessageDto> get copyWith => __$AiOutputMessageDtoCopyWithImpl<_AiOutputMessageDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AiOutputMessageDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AiOutputMessageDto&&(identical(other.type, type) || other.type == type)&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.role, role) || other.role == role)&&const DeepCollectionEquality().equals(other._content, _content));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,id,status,role,const DeepCollectionEquality().hash(_content));

@override
String toString() {
  return 'AiOutputMessageDto(type: $type, id: $id, status: $status, role: $role, content: $content)';
}


}

/// @nodoc
abstract mixin class _$AiOutputMessageDtoCopyWith<$Res> implements $AiOutputMessageDtoCopyWith<$Res> {
  factory _$AiOutputMessageDtoCopyWith(_AiOutputMessageDto value, $Res Function(_AiOutputMessageDto) _then) = __$AiOutputMessageDtoCopyWithImpl;
@override @useResult
$Res call({
 String? type, String? id, String? status, String? role, List<AiContentItemDto> content
});




}
/// @nodoc
class __$AiOutputMessageDtoCopyWithImpl<$Res>
    implements _$AiOutputMessageDtoCopyWith<$Res> {
  __$AiOutputMessageDtoCopyWithImpl(this._self, this._then);

  final _AiOutputMessageDto _self;
  final $Res Function(_AiOutputMessageDto) _then;

/// Create a copy of AiOutputMessageDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = freezed,Object? id = freezed,Object? status = freezed,Object? role = freezed,Object? content = null,}) {
  return _then(_AiOutputMessageDto(
type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,role: freezed == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String?,content: null == content ? _self._content : content // ignore: cast_nullable_to_non_nullable
as List<AiContentItemDto>,
  ));
}


}

// dart format on
