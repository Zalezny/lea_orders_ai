import 'package:freezed_annotation/freezed_annotation.dart';

import 'ai_output_message_dto.dart';

part 'ai_response_dto.freezed.dart';
part 'ai_response_dto.g.dart';

@freezed
sealed class AiResponseDto with _$AiResponseDto {
  const factory AiResponseDto({required List<AiOutputMessageDto> output}) = _AiResponseDto;

  factory AiResponseDto.fromJson(Map<String, dynamic> json) => _$AiResponseDtoFromJson(json);
}
