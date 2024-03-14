// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class VerifyOtpResponseModel {
  // verification Id
  String sid;
  // status of the code if it is verified
  String status;
  VerifyOtpResponseModel({
    required this.sid,
    required this.status,
  });

  VerifyOtpResponseModel copyWith({
    String? sid,
    String? status,
  }) {
    return VerifyOtpResponseModel(
      sid: sid ?? this.sid,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'sid': sid,
      'status': status,
    };
  }

  factory VerifyOtpResponseModel.fromMap(Map<String, dynamic> map) {
    return VerifyOtpResponseModel(
      sid: map['sid'] as String,
      status: map['status'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory VerifyOtpResponseModel.fromJson(String source) => VerifyOtpResponseModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'VerifyOtpResponseModel(sid: $sid, status: $status)';

  @override
  bool operator ==(covariant VerifyOtpResponseModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.sid == sid &&
      other.status == status;
  }

  @override
  int get hashCode => sid.hashCode ^ status.hashCode;
}
