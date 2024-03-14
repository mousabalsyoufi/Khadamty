// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:faciltateur_de_vies/shared_models/address_model.dart';

// Login Model
class LoginModel {
  String token;
  String socid;
  String userId;
  String email;
  String fullName;
  int subscriptionType;
  bool urssafMember;
  String clientId;
  String photo;
  List<AddressModel> addresses;
  LoginModel({
    required this.token,
    required this.socid,
    required this.userId,
    required this.email,
    required this.fullName,
    required this.subscriptionType,
    required this.urssafMember,
    required this.clientId,
    required this.photo,
    required this.addresses,
  });

  LoginModel copyWith({
    String? token,
    String? socid,
    String? userId,
    String? email,
    String? fullName,
    int? subscriptionType,
    bool? urssafMember,
    String? clientId,
    String? photo,
    List<AddressModel>? addresses,
  }) {
    return LoginModel(
      token: token ?? this.token,
      socid: socid ?? this.socid,
      userId: userId ?? this.userId,
      email: email ?? this.email,
      fullName: fullName ?? this.fullName,
      subscriptionType: subscriptionType ?? this.subscriptionType,
      urssafMember: urssafMember ?? this.urssafMember,
      clientId: clientId ?? this.clientId,
      photo: photo ?? this.photo,
      addresses: addresses ?? this.addresses,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'token': token,
      'socid': socid,
      'userId': userId,
      'email': email,
      'fullName': fullName,
      'urssafMember': urssafMember,
      'clientId': clientId,
      'photo': photo,
      'contacts': addresses.map((x) => x.toMap()).toList(),
    };
  }

  factory LoginModel.fromMap(Map<String, dynamic> map) {
    return LoginModel(
      token: map['token'] as String,
      socid: map['socid'] ?? '0',
      userId: map['userId'] as String,
      email: map['email'] as String,
      fullName: map['fullName'] as String,
      subscriptionType: map['subscriptionType'] as int,
      urssafMember: map['urssafMember'] as bool,
      clientId: map['clientId'] as String,
      photo: map['photo'] ?? '',
      addresses: map['contacts'] != null
          ? (map['contacts'] as List)
              .map<AddressModel>((json) => AddressModel.fromMap(json))
              .toList()
          : [],
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginModel.fromJson(String source) =>
      LoginModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'LoginModel(token: $token, socid: $socid, userId: $userId, email: $email, fullName: $fullName, addresses: $addresses)';
  }

  @override
  bool operator ==(covariant LoginModel other) {
    if (identical(this, other)) return true;

    return other.token == token &&
        other.socid == socid &&
        other.userId == userId &&
        other.email == email &&
        other.fullName == fullName &&
        listEquals(other.addresses, addresses);
  }

  @override
  int get hashCode {
    return token.hashCode ^
        socid.hashCode ^
        userId.hashCode ^
        email.hashCode ^
        fullName.hashCode ^
        addresses.hashCode;
  }
}
