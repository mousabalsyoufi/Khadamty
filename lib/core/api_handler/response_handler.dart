import '../../constants/enums/response_enum.dart';

class ApiResponse<T> {
  Status? status;
  T? data;
  String? message;
  int? code;
  ApiResponse.completed(this.data) : status = Status.completed;
  ApiResponse.error(this.message) : status = Status.error;
}
