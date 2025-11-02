import 'package:freezed_annotation/freezed_annotation.dart';

import 'ai_content_item_dto.dart';

part 'ai_output_message_dto.freezed.dart';
part 'ai_output_message_dto.g.dart';

@freezed
sealed class AiOutputMessageDto with _$AiOutputMessageDto {
  const factory AiOutputMessageDto({String? type, String? id, String? status, String? role, required List<AiContentItemDto> content}) =
      _AiOutputMessageDto;

  factory AiOutputMessageDto.fromJson(Map<String, dynamic> json) => _$AiOutputMessageDtoFromJson(json);
}
