// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AddressRequestModel {
  String socId;
  String addressName;
  String address;
  String zipcode;
  String town;
  String mobileNumber;
  String addressOwnerName;
  ArrayOptions arrayOptions;
  AddressRequestModel({
    required this.socId,
    required this.addressName,
    required this.address,
    required this.zipcode,
    required this.town,
    required this.mobileNumber,
    required this.addressOwnerName,
    required this.arrayOptions,
  });

  AddressRequestModel copyWith({
    String? socId,
    String? addressName,
    String? address,
    String? zipcode,
    String? town,
    String? mobileNumber,
    String? addressOwnerName,
    ArrayOptions? arrayOptions,
  }) {
    return AddressRequestModel(
      socId: socId ?? this.socId,
      addressName: addressName ?? this.addressName,
      address: address ?? this.address,
      zipcode: zipcode ?? this.zipcode,
      town: town ?? this.town,
      mobileNumber: mobileNumber ?? this.mobileNumber,
      addressOwnerName: addressOwnerName ?? this.addressOwnerName,
      arrayOptions: arrayOptions ?? this.arrayOptions,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'socid': socId,
      'addressName': addressName,
      'address': address,
      'zip': zipcode,
      'town': town,
      'phone': mobileNumber,
      'lastname': addressOwnerName,
      'arrayOptions': arrayOptions.toMap(),
    };
  }

  factory AddressRequestModel.fromMap(Map<String, dynamic> map) {
    return AddressRequestModel(
      socId: map['socid'] as String,
      addressName: map['addressName'] as String,
      address: map['address'] as String,
      zipcode: map['zip'] as String,
      town: map['town'] as String,
      mobileNumber: map['phone'] as String,
      addressOwnerName: map['lastname'] as String,
      arrayOptions:
          ArrayOptions.fromMap(map['arrayOptions'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory AddressRequestModel.fromJson(String source) =>
      AddressRequestModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AddressRequestModel(addressName: $addressName, address: $address, zipcode: $zipcode, town: $town, mobileNumber: $mobileNumber, addressOwnerName: $addressOwnerName, arrayOptions: $arrayOptions)';
  }

  @override
  bool operator ==(covariant AddressRequestModel other) {
    if (identical(this, other)) return true;

    return other.addressName == addressName &&
        other.address == address &&
        other.zipcode == zipcode &&
        other.town == town &&
        other.mobileNumber == mobileNumber &&
        other.addressOwnerName == addressOwnerName &&
        other.arrayOptions == arrayOptions;
  }

  @override
  int get hashCode {
    return addressName.hashCode ^
        address.hashCode ^
        zipcode.hashCode ^
        town.hashCode ^
        mobileNumber.hashCode ^
        addressOwnerName.hashCode ^
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
      surface: map['optionsSurfacem2'] as String,
      lat: map['optionsLatitude'] as String,
      long: map['optionsLongitude'] as String,
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
