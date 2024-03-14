class RegisterRequestCompanyModel {
  final String fullName;
  final String email;
  final String phoneNumber;
  final String password;
  final String groupId;
  final int type;
  final String? default_rib;
  final String? frstrecur;
  final String? label;
  final String? code_banque;
  final String? code_guichet;
  final String? account_number;
  final String? cle_rib;
  final String? bank;
  final String? bic;
  final String? iban;


  RegisterRequestCompanyModel({
     required this.fullName,
     required this.email,
     required this.phoneNumber,
     required this.password,
     required this.groupId,
     required this.type,
      this.default_rib,
      this.frstrecur,
      this.label,
      this.code_banque,
      this.code_guichet,
      this.account_number,
      this.cle_rib,
      this.bank,
      this.bic,
      this.iban});

  Map<String,dynamic>  toJson(){
    return {
      "name":fullName,
      "lastname":fullName,
      "email":email,
      "phone":phoneNumber,
      "password":password,
      "groupId":groupId,
      "type":type,
      "login":email,
      "default_rib":default_rib,
      "frstrecur":frstrecur,
      "label":label,
      "code_banque":code_banque,
      "code_guichet":code_guichet,
      "account_number":account_number,
      "cle_rib":cle_rib,
      "bank":bank,
      "bic":bic,
      "iban":iban
    };
  }

  RegisterRequestCompanyModel copyWith({
    String? fullName,
    String? email,
    String? phoneNumber,
    String? password,
    String? groupId,
    int? type,
    String? default_rib,
    String? frstrecur,
    String? label,
    String? code_banque,
    String? code_guichet,
    String? account_number,
    String? cle_rib,
    String? bank,
    String? bic,
    String? iban,
  }) {
    return RegisterRequestCompanyModel(
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      password: password ?? this.password,
      groupId: groupId ?? this.groupId,
      type: type ?? this.type,
      default_rib: default_rib ?? this.default_rib,
      frstrecur: frstrecur ?? this.frstrecur,
      label: label ?? this.label,
      code_banque: code_banque ?? this.code_banque,
      code_guichet: code_guichet ?? this.code_guichet,
      account_number: account_number ?? this.account_number,
      cle_rib: cle_rib ?? this.cle_rib,
      bank: bank ?? this.bank,
      bic: bic ?? this.bic,
      iban: iban ?? this.iban,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RegisterRequestCompanyModel &&
          runtimeType == other.runtimeType &&
          fullName == other.fullName &&
          email == other.email &&
          phoneNumber == other.phoneNumber &&
          password == other.password &&
          groupId == other.groupId &&
          type == other.type &&
          default_rib == other.default_rib &&
          frstrecur == other.frstrecur &&
          label == other.label &&
          code_banque == other.code_banque &&
          code_guichet == other.code_guichet &&
          account_number == other.account_number &&
          cle_rib == other.cle_rib &&
          bank == other.bank &&
          bic == other.bic &&
          iban == other.iban;

  @override
  int get hashCode =>
      fullName.hashCode ^
      email.hashCode ^
      phoneNumber.hashCode ^
      password.hashCode ^
      groupId.hashCode ^
      type.hashCode ^
      default_rib.hashCode ^
      frstrecur.hashCode ^
      label.hashCode ^
      code_banque.hashCode ^
      code_guichet.hashCode ^
      account_number.hashCode ^
      cle_rib.hashCode ^
      bank.hashCode ^
      bic.hashCode ^
      iban.hashCode;


  factory RegisterRequestCompanyModel.fromMap(Map<String, dynamic> map) {
    return RegisterRequestCompanyModel(
      fullName: map['lastname'] as String,
      email: map['email'] as String,
      phoneNumber: map['phoneNumber'] as String,
      password: map['password'] as String,
      groupId: map['groupId'] as String,
      type: map['type'] as int,
      default_rib: map['default_rib'] as String,
      frstrecur: map['frstrecur'] as String,
      label: map['label'] as String,
      code_banque: map['code_banque'] as String,
      code_guichet: map['code_guichet'] as String,
      account_number: map['account_number'] as String,
      cle_rib: map['cle_rib'] as String,
      bank: map['bank'] as String,
      bic: map['bic'] as String,
      iban: map['iban'] as String,
    );
  }
}