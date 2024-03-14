// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SharedHelpTicketRequestModel {
  String fkSoc;
  String subject;
  String message;
  String typeCode;
  String categoryCode;
  String severityCode;
  SharedHelpTicketRequestModel({
    required this.fkSoc,
    required this.subject,
    required this.message,
    required this.typeCode,
    required this.categoryCode,
    required this.severityCode,
  });

  SharedHelpTicketRequestModel copyWith({
    String? fkSoc,
    String? subject,
    String? message,
    String? typeCode,
    String? categoryCode,
    String? severityCode,
  }) {
    return SharedHelpTicketRequestModel(
      fkSoc: fkSoc ?? this.fkSoc,
      subject: subject ?? this.subject,
      message: message ?? this.message,
      typeCode: typeCode ?? this.typeCode,
      categoryCode: categoryCode ?? this.categoryCode,
      severityCode: severityCode ?? this.severityCode,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'fkSoc': fkSoc,
      'subject': subject,
      'message': message,
      'typeCode': typeCode,
      'categoryCode': categoryCode,
      'severityCode': severityCode,
    };
  }

  factory SharedHelpTicketRequestModel.fromMap(Map<String, dynamic> map) {
    return SharedHelpTicketRequestModel(
      fkSoc: map['fkSoc'] as String,
      subject: map['subject'] as String,
      message: map['message'] as String,
      typeCode: map['typeCode'] as String,
      categoryCode: map['categoryCode'] as String,
      severityCode: map['severityCode'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SharedHelpTicketRequestModel.fromJson(String source) =>
      SharedHelpTicketRequestModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'BecomeEmployeeRequestModel(fkSoc: $fkSoc, subject: $subject, message: $message, typeCode: $typeCode, categoryCode: $categoryCode, severityCode: $severityCode)';
  }

  @override
  bool operator ==(covariant SharedHelpTicketRequestModel other) {
    if (identical(this, other)) return true;

    return other.fkSoc == fkSoc &&
        other.subject == subject &&
        other.message == message &&
        other.typeCode == typeCode &&
        other.categoryCode == categoryCode &&
        other.severityCode == severityCode;
  }

  @override
  int get hashCode {
    return fkSoc.hashCode ^
        subject.hashCode ^
        message.hashCode ^
        typeCode.hashCode ^
        categoryCode.hashCode ^
        severityCode.hashCode;
  }
}
