// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'package:dartz/dartz.dart';

import '../../../../core/api_handler/response_handler.dart';
import '../../../../core/generic_usecase/usecase.dart';
import '../../data/model/login_model.dart';
import '../repository/login_repository.dart';

// login useCase to link with instance from repository
class LoginUseCase extends UseCase<ApiResponse<LoginModel>, LoginUseCaseParams> {
  final LoginRepository? _loginRepository;

  LoginUseCase(this._loginRepository);

  @override
  Future<Either<dynamic, ApiResponse<LoginModel>>> call(LoginUseCaseParams params) {
    return _loginRepository!.login(username: params.username, password: params.password);
  }
}

class LoginUseCaseParams {
  final String username;
  final String password;
  LoginUseCaseParams({required this.username,required this.password});

  @override
  bool operator ==(covariant LoginUseCaseParams other) {
    if (identical(this, other)) return true;
  
    return 
      other.username == username &&
      other.password == password;
  }

  @override
  int get hashCode => username.hashCode ^ password.hashCode;
}

