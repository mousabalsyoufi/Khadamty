import 'package:dartz/dartz.dart';

import '../../../../core/api_handler/response_handler.dart';
import '../../data/model/login_model.dart';

// abstract class for Login Repository
abstract class LoginRepository {

  Future<Either<dynamic,ApiResponse<LoginModel>>> login({required String username,required String password});
}