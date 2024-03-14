import 'package:dartz/dartz.dart';
import '../../data/model/forget_password_model.dart';

import '../../../../core/api_handler/response_handler.dart';

// abstract class for forget password  Repository
abstract class ForgetPasswordRepository {

  Future<Either<dynamic,ApiResponse<ForgetPasswordModel>>> forgetPassword({required String email});
}