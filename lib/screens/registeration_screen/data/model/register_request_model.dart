class RegisterRequestModel {
  final String fullName;
  final String email;
  final String phoneNumber;
  final String password;
  final String groupId;
  final int type;

  RegisterRequestModel({required this.fullName,required this.email, required this.phoneNumber, required this.password,required this.groupId, required this.type});



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

    };
  }
}