class ApiResponse{
  final int status;
  final String message;
  final dynamic result;

  const ApiResponse({required this.status, required this.message, this.result});

}