abstract class RepositoryException implements Exception {
  final String label;
  final String messageError;
  final StackTrace? stackTrace;

  RepositoryException(
      {required this.label, required this.messageError, this.stackTrace});
}

class HomeRepositoryException extends RepositoryException {
  HomeRepositoryException(
      {required super.label, required super.messageError, super.stackTrace});
}
