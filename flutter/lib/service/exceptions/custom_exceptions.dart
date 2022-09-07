import 'dart:io';

class CustomException implements Exception {
  const CustomException(this.code, this.message, this.data);

  const CustomException.simpleConstructor(this.code, this.message)
      : data = null;

  final int code;
  final String message;
  final List<String>? data;
}

class BadRequestException extends CustomException {
  BadRequestException(String message, [List<String>? data])
      : super(HttpStatus.badRequest, message, data);
}

class UnauthorizedException extends CustomException {
  UnauthorizedException(String message, [List<String>? data])
      : super(HttpStatus.unauthorized, message, data);
}

class SessionExpiredException extends CustomException {
  SessionExpiredException(String message, [List<String>? data])
      : super(HttpStatus.unauthorized, message, data);
}

class NotFoundException extends CustomException {
  NotFoundException(String message, [List<String>? data])
      : super(HttpStatus.notFound, message, data);
}

class ConnectionException extends CustomException {
  ConnectionException(String message, [List<String>? data])
      : super(HttpStatus.networkConnectTimeoutError, message, data);
}

class ConnectivityException extends CustomException {
  ConnectivityException(String message, [List<String>? data])
      : super(HttpStatus.networkConnectTimeoutError, message, data);
}
