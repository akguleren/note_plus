class InternalException extends Error {
  final String message;
  @override
  final StackTrace? stackTrace;

  InternalException(this.message, [this.stackTrace]);

  @override
  String toString() {
    return 'InternalException: $message';
  }
}
