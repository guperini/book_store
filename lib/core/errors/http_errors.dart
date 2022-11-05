class HttpError implements Exception {
  String error;
  StackTrace? stackTrace;

  HttpError(this.error, [this.stackTrace]);
}
