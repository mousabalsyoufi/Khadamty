// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class RatingRequestModel {
  String orderId;
  String serviceId;
  String efficacite;
  String ponctualite;
  String presentation;
  String avisgeneral;
  String iseval;
  RatingRequestModel({
    required this.orderId,
    required this.serviceId,
    required this.efficacite,
    required this.ponctualite,
    required this.presentation,
    required this.avisgeneral,
    required this.iseval,
  });

  RatingRequestModel copyWith({
    String? orderId,
    String? serviceId,
    String? efficacite,
    String? ponctualite,
    String? presentation,
    String? avisgeneral,
    String? iseval,
  }) {
    return RatingRequestModel(
      orderId: orderId ?? this.orderId,
      serviceId: serviceId ?? this.serviceId,
      efficacite: efficacite ?? this.efficacite,
      ponctualite: ponctualite ?? this.ponctualite,
      presentation: presentation ?? this.presentation,
      avisgeneral: avisgeneral ?? this.avisgeneral,
      iseval: iseval ?? this.iseval,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'options_efficacite': efficacite,
      'options_ponctualite': ponctualite,
      'options_presentation': presentation,
      'options_avisgeneral': avisgeneral,
      'options_iseval': iseval,
    };
  }

  factory RatingRequestModel.fromMap(Map<String, dynamic> map) {
    return RatingRequestModel(
      orderId: '',
      serviceId: '',
      efficacite: map['options_efficacite'] as String,
      ponctualite: map['options_ponctualite'] as String,
      presentation: map['options_presentation'] as String,
      avisgeneral: map['options_avisgeneral'] as String,
      iseval: map['options_iseval'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory RatingRequestModel.fromJson(String source) =>
      RatingRequestModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'RatinRequestModel(efficacite: $efficacite, ponctualite: $ponctualite, presentation: $presentation, avisgeneral: $avisgeneral, iseval: $iseval)';
  }

  @override
  bool operator ==(covariant RatingRequestModel other) {
    if (identical(this, other)) return true;

    return other.efficacite == efficacite &&
        other.ponctualite == ponctualite &&
        other.presentation == presentation &&
        other.avisgeneral == avisgeneral &&
        other.iseval == iseval;
  }

  @override
  int get hashCode {
    return efficacite.hashCode ^
        ponctualite.hashCode ^
        presentation.hashCode ^
        avisgeneral.hashCode ^
        iseval.hashCode;
  }
}
