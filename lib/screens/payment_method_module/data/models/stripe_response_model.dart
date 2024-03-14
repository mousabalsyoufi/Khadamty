

class StripeResponseModel {
  final String? clientSecret;
  final String? status;
  final bool? requiresAction;
  final String? message;

  StripeResponseModel({this.clientSecret, this.status, this.requiresAction,this.message});

  factory StripeResponseModel.fromJson(Map<String,dynamic> json){
    return StripeResponseModel(
        clientSecret: json['clientSecret'],
        status: json['status'],
        requiresAction: json['requiresAction'],
        message :json['message']
    );
  }

}