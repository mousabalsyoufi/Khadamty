import 'package:faciltateur_de_vies/core/helpers/date_helper.dart';

/// This class for handle account model


class AccountModel{
  final String? id;

  final String? civility_code;
  final String? gender;
  final String? birth;
  final String? email;
  final String? personal_email;
  final String? address;
  final String? zip;
  final String? town;
  final String? state_id;
  final String? office_phone;
  final String? office_fax;
  final String? user_mobile;
  final String? login;
  final int? datec;
  final int?  datem;
  final String? socid;
  final String? user;
  final String? country_id;
  final String? country_code;
  final String? name;
  final String? lastname;
  final String? firstname;

  AccountModel({this.id, this.civility_code, this.gender, this.birth, this.email,
    this.personal_email, this.address, this.zip, this.town, this.state_id, this.office_phone,
    this.office_fax, this.user_mobile, this.login, this.datec,
    this.datem, this.socid, this.user, this.country_id, this.country_code, this.name="", this.lastname, this.firstname});


  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AccountModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          civility_code == other.civility_code &&
          gender == other.gender &&
          birth == other.birth &&
          email == other.email &&
          personal_email == other.personal_email &&
          address == other.address &&
          zip == other.zip &&
          town == other.town &&
          state_id == other.state_id &&
          office_phone == other.office_phone &&
          office_fax == other.office_fax &&
          user_mobile == other.user_mobile &&
          login == other.login &&
          datec == other.datec &&
          datem == other.datem &&
          socid == other.socid &&
          user == other.user &&
          country_id == other.country_id &&
          country_code == other.country_code &&
          name == other.name &&
          lastname == other.lastname &&
          firstname == other.firstname;

  @override
  int get hashCode =>
      id.hashCode ^
      civility_code.hashCode ^
      gender.hashCode ^
      birth.hashCode ^
      email.hashCode ^
      personal_email.hashCode ^
      address.hashCode ^
      zip.hashCode ^
      town.hashCode ^
      state_id.hashCode ^
      office_phone.hashCode ^
      office_fax.hashCode ^
      user_mobile.hashCode ^
      login.hashCode ^
      datec.hashCode ^
      datem.hashCode ^
      socid.hashCode ^
      user.hashCode ^
      country_id.hashCode ^
      country_code.hashCode ^
      name.hashCode ^
      lastname.hashCode ^
      firstname.hashCode;

  bool equals(AccountModel other) {
    return lastname == other.lastname &&
        email == other.email &&
        user_mobile == other.user_mobile &&
        DateHelper.yyyyMMdd(birth.toString()) == DateHelper.yyyyMMdd(other.birth.toString()) ;
  }

  bool isEmpty() {
    return (lastname == "" || lastname ==null) &&
          (email == "" || email ==null) &&
          (user_mobile == "" ||user_mobile ==null ) &&
          (birth == ""|| birth== null) ;
  }


  @override
  String toString() {
    return 'AccountModel{birth: $birth, email: $email, user_mobile: $user_mobile, lastname: $lastname}';
  }

  factory AccountModel.fromJson(Map<String,dynamic> json){
    return AccountModel(
        id:json['id'],
        civility_code: json['civility_code'],
        gender: json['gender'],
        birth: json['birth'].toString(),
        email: json['email'],
        personal_email: json['personal_email'],
        address: json['address'],
        zip: json['zip'],
        town: json['town'],
        state_id: json['state_id'],
        office_phone: json['office_phone'],
        office_fax: json['office_fax'],
        user_mobile: json['user_mobile'],
        login: json['login'],
        datec: json['datec'],
        datem: json['datem'],
        socid: json['socid'],
        user: json['user'],
        country_id:json['country_id'] ,
        country_code:json['country_code'],
        name:json['name'],
        lastname:json['lastname'],
        firstname: json['firstname']

    );
  }

  Map<String,dynamic >  toMap(){
    return
      {
        "lastname": lastname,
        "email": email,
        "phone": user_mobile,
        "birth": int.parse(birth.toString()),
    };
  }


}