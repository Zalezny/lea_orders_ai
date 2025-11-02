import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../models/ai/ai_response_dto.dart';

part 'ai_api.g.dart';

@RestApi(baseUrl: 'https://api.openai.com')
abstract class AiApi {
  factory AiApi(Dio dio, {String baseUrl}) = _AiApi;

  @POST('/v1/responses')
  Future<AiResponseDto> createResponse(
    @Body() Map<String, dynamic> body, {
    @Header('Authorization') required String authorization,
    @Header('Content-Type') String contentType = 'application/json',
  });
}
