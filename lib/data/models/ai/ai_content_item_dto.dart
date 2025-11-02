import 'package:freezed_annotation/freezed_annotation.dart';

part 'ai_content_item_dto.freezed.dart';
part 'ai_content_item_dto.g.dart';

@freezed
sealed class AiContentItemDto with _$AiContentItemDto {
  const factory AiContentItemDto({required String type, String? text}) = _AiContentItemDto;

  factory AiContentItemDto.fromJson(Map<String, dynamic> json) => _$AiContentItemDtoFromJson(json);
}
