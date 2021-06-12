class AppException implements Exception {
  final String? message;
  final String? prefix;
  final String? url;

  AppException({this.message, this.prefix, this.url});
}

class BadRequestException extends AppException {
  BadRequestException({String? message, String? url})
      : super(message: message, prefix: 'Bad Request', url: url);
}

class FetchDataException extends AppException {
  FetchDataException({String? message, String? url})
      : super(message: message, prefix: 'Unable to process', url: url);
}

class ApiNotRespondingException extends AppException {
  ApiNotRespondingException({String? message, String? url})
      : super(message: message, prefix: 'Api not responding', url: url);
}

class UnAuthorizedException extends AppException {
  UnAuthorizedException({String? message, String? url})
      : super(message: message, prefix: 'UnAuthorized request', url: url);
}
