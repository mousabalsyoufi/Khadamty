
class SuccessResponseModel {
  final int? statusCode;
  final String? message;
  final dynamic data;
  SuccessResponseModel({this.statusCode, this.message, this.data});

  factory SuccessResponseModel.fromJson(Map<String,dynamic> json){
    return SuccessResponseModel(
      statusCode: json['statusCode'],
      message: json['message'],
      data: json['data'],
    );
  }


}

