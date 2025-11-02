abstract class Failure {
  final String message;
  const Failure(this.message);
  @override
  String toString() => message;
}

class NetworkFailure extends Failure {
  const NetworkFailure(super.message);
}

class TimeoutFailure extends Failure {
  const TimeoutFailure(super.message);
}

class CancelledFailure extends Failure {
  const CancelledFailure(super.message);
}

class ApiFailure extends Failure {
  final int? statusCode;
  const ApiFailure(super.message, {this.statusCode});
}

class ServerFailure extends Failure {
  final int? statusCode;
  const ServerFailure(super.message, {this.statusCode});
}

class UnknownFailure extends Failure {
  const UnknownFailure(super.message);
}

class ConfigFailure extends Failure {
  const ConfigFailure(super.message);
}

class ParsingFailure extends Failure {
  const ParsingFailure(super.message);
}
