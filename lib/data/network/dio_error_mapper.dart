import 'dart:io';

import 'package:dio/dio.dart';

import '../../domain/core/failures.dart';

class DioErrorMapper {
  static const Map<int, String> _httpMessages = {
    400: 'Błędne żądanie (400)',
    401: 'Nieautoryzowany (401)',
    403: 'Zakaz dostępu (403)',
    404: 'Nie znaleziono (404)',
    408: 'Przekroczono czas oczekiwania (408)',
    429: 'Zbyt wiele żądań (429)',
    500: 'Błąd serwera (500)',
    502: 'Błąd bramy (502)',
    503: 'Serwis niedostępny (503)',
    504: 'Przekroczono czas bramy (504)',
  };

  static Failure map(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const TimeoutFailure('Przekroczono czas oczekiwania na odpowiedź');
      case DioExceptionType.badResponse:
        final status = e.response?.statusCode;
        final msg = _httpMessages[status ?? 0] ?? 'Błąd API produktów${status != null ? ' ($status)' : ''}';
        // 5xx traktujemy jako ServerFailure, reszta jako ApiFailure
        if (status != null && status >= 500) {
          return ServerFailure(msg, statusCode: status);
        }
        return ApiFailure(msg, statusCode: status);
      case DioExceptionType.cancel:
        return const CancelledFailure('Żądanie zostało anulowane');
      case DioExceptionType.badCertificate:
        return const ServerFailure('Problem z certyfikatem serwera');
      case DioExceptionType.connectionError:
        return const NetworkFailure('Brak internetu lub problem z połączeniem');
      case DioExceptionType.unknown:
        final err = e.error;
        if (err is SocketException) {
          return const NetworkFailure('Brak internetu lub problem z połączeniem');
        }
        return const UnknownFailure('Coś poszło nie tak');
    }
  }
}
