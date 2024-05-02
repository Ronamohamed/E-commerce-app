abstract class Errors {
  String? errorMessage;
  Errors({required this.errorMessage});
}

class ServerError extends Errors {
  ServerError({required super.errorMessage});
}

class NetworkError extends Errors {
  NetworkError({required super.errorMessage});
}
