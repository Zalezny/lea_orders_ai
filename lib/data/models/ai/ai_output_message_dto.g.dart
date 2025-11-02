// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_output_message_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AiOutputMessageDto _$AiOutputMessageDtoFromJson(Map<String, dynamic> json) =>
    _AiOutputMessageDto(
      type: json['type'] as String?,
      id: json['id'] as String?,
      status: json['status'] as String?,
      role: json['role'] as String?,
      content: (json['content'] as List<dynamic>)
          .map((e) => AiContentItemDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AiOutputMessageDtoToJson(_AiOutputMessageDto instance) =>
    <String, dynamic>{
      'type': instance.type,
      'id': instance.id,
      'status': instance.status,
      'role': instance.role,
      'content': instance.content,
    };
