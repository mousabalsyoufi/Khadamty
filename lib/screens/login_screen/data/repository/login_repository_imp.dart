import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/constants/enums/response_enum.dart';
import '../../../../core/api_handler/response_handler.dart';
import '../data_source/login_provider/login_api_imp.dart';
import '../model/login_model.dart';
import '../../domain/repository/login_repository.dart';

// implementation login repository
class LoginRepositoryImp implements LoginRepository {
  final LoginApiImp _loginImp;

  LoginRepositoryImp(this._loginImp);

  @override
  Future<Either<dynamic, ApiResponse<LoginModel>>> login(
      {required String username, required String password}) async {
    ApiResponse<LoginModel> result;
    try {
      result = await _loginImp.login(username: username, password: password);
      if (result.status == Status.completed) {
        return Right(result);
      } else {
        return Left(result);
      }
    } catch (error) {
      return Left(error);
    }
  }
}
