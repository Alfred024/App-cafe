class CustomError implements Exception {
  final String message;
  final int? errorCode;

  CustomError({required this.message, required this.errorCode});
}
