import 'package:dartz/dartz.dart';
import '../model/forget_password_model.dart';
import '../../domain/repository/forget_password_repository.dart';
import '../../../../core/api_handler/response_handler.dart';
import '../data_source/forget_password_provider/forget_password_api_imp.dart';

// implementation Forget Password repository
class ForgetPasswordRepositoryImp implements ForgetPasswordRepository {
  final ForgetPasswordApiImp _forgetPasswordImp;

  ForgetPasswordRepositoryImp(this._forgetPasswordImp);

  @override
  Future<Either<dynamic, ApiResponse<ForgetPasswordModel>>> forgetPassword(
      {required String email}) async {
    // TODO Check Left Value here Left(error)
    ApiResponse<ForgetPasswordModel> result;
    try {
      result = await _forgetPasswordImp.forgetPassword(email: email);
      return Right(result);
    } catch (error) {
      return Left(error);
    }
  }
}
