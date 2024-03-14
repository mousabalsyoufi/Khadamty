import 'dart:convert';

class VerifyOtpModel {
  bool status;
  VerifyOtpModel({
    required this.status,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
    };
  }

  factory VerifyOtpModel.fromMap(Map<String, dynamic> map) {
    return VerifyOtpModel(
      status: map['status'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory VerifyOtpModel.fromJson(String source) => VerifyOtpModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
