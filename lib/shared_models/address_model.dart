// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AddressModel {
  String id;
  String email;
  String lastname;
  String address;
  String zip;
  String town;
  ArrayOptions arrayOptions;
  AddressModel({
    required this.id,
    required this.email,
    required this.lastname,
    required this.address,
    required this.zip,
    required this.town,
    required this.arrayOptions,
  });

  AddressModel copyWith({
    String? id,
    String? email,
    String? lastname,
    String? address,
    String? zip,
    String? town,
    ArrayOptions? arrayOptions,
  }) {
    return AddressModel(
      id: id ?? this.id,
      email: email ?? this.email,
      lastname: lastname ?? this.lastname,
      address: address ?? this.address,
      zip: zip ?? this.zip,
      town: town ?? this.town,
      arrayOptions: arrayOptions ?? this.arrayOptions,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'email': email,
      'lastname': lastname,
      'address': address,
      'zip': zip,
      'town': town,
      'array_options': arrayOptions.toMap(),
    };
  }

  factory AddressModel.fromMap(Map<String, dynamic> map) {
    return AddressModel(
      id: map['id'] as String,
      email: map['email'] as String,
      lastname: map['lastname'] as String,
      address: map['address'] as String,
      zip: map['zip'] as String,
      town: map['town'] as String,
      arrayOptions: map['array_options'] is List
          ? ArrayOptions(surface: '', lat: '', long: '')
          : ArrayOptions.fromMap(map['array_options'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory AddressModel.fromJson(String source) =>
      AddressModel.fromMap(json.decode(source) as Map<String, dynamic>);

  static String toJsonList(List<AddressModel> addresses) => json.encode(
        addresses
            .map<Map<String, dynamic>>((address) => address.toMap())
            .toList(),
      );

  static List<AddressModel> fromJsonList(String addresses) =>
      (json.decode(addresses) as List<dynamic>)
          .map<AddressModel>((item) => AddressModel.fromMap(item))
          .toList();

  @override
  String toString() {
    return 'AddressModel(id: $id, email: $email, lastname: $lastname, address: $address, zip: $zip, town: $town, arrayOptions: $arrayOptions)';
  }

  @override
  bool operator ==(covariant AddressModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.email == email &&
        other.lastname == lastname &&
        other.address == address &&
        other.zip == zip &&
        other.town == town &&
        other.arrayOptions == arrayOptions;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        email.hashCode ^
        lastname.hashCode ^
        address.hashCode ^
        zip.hashCode ^
        town.hashCode ^
        arrayOptions.hashCode;
  }
}

class ArrayOptions {
  String surface;
  String lat;
  String long;
  ArrayOptions({
    required this.surface,
    required this.lat,
    required this.long,
  });

  ArrayOptions copyWith({
    String? surface,
    String? lat,
    String? long,
  }) {
    return ArrayOptions(
      surface: surface ?? this.surface,
      lat: lat ?? this.lat,
      long: long ?? this.long,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'optionsSurfacem2': surface,
      'optionsLatitude': lat,
      'optionsLongitude': long,
    };
  }

  factory ArrayOptions.fromMap(Map<String, dynamic> map) {
    return ArrayOptions(
      surface: map['optionsSurfacem2'] ?? '',
      lat: map['optionsLatitude'] ?? '',
      long: map['optionsLongitude'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ArrayOptions.fromJson(String source) =>
      ArrayOptions.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ArayOptions(surface: $surface, lat: $lat, long: $long)';

  @override
  bool operator ==(covariant ArrayOptions other) {
    if (identical(this, other)) return true;

    return other.surface == surface && other.lat == lat && other.long == long;
  }

  @override
  int get hashCode => surface.hashCode ^ lat.hashCode ^ long.hashCode;
}
