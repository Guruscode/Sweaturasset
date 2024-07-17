class AppFailure {
  final String message;
  final Map<String, dynamic>? errors;

  AppFailure([this.message = 'Sorry, an unexpected error occurred!', this.errors]);

  @override
  String toString() => 'AppFailure(message: $message, errors: $errors)';
}
