class HttpClientException implements Exception {
  final String label;
  final String messageError;
  final String? logMessage;
  final int? statusCode;
  final StackTrace? stackTrace;

  HttpClientException(
      {required this.label,
      this.logMessage,
      required this.messageError,
      this.statusCode,
      this.stackTrace});
}
