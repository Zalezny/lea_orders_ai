// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AiResponseDto _$AiResponseDtoFromJson(Map<String, dynamic> json) =>
    _AiResponseDto(
      output: (json['output'] as List<dynamic>)
          .map((e) => AiOutputMessageDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AiResponseDtoToJson(_AiResponseDto instance) =>
    <String, dynamic>{'output': instance.output};
