import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/screens/registeration_screen/data/model/register_comany_model.dart';
import '../../../../core/api_handler/response_handler.dart';
import '../../data/model/register_request_model.dart';
import '../../data/model/register_model.dart';
import '../../data/model/verify_otp_response_model.dart';

// abstract class for register Repository
abstract class RegisterRepository {

  Future<Either<dynamic, ApiResponse<RegisterModel>>> registerCompany(
      {required RegisterRequestCompanyModel registerRequestModel});

  Future<Either<dynamic, ApiResponse<RegisterModel>>> register(
      {required RegisterRequestModel registerRequestModel});
  Future<Either<dynamic, ApiResponse<VerifyOtpResponseModel>>> verifyOtp({
    required String otpCode,
    required String verificationId,
  });
  Future<Either<dynamic, ApiResponse<String>>> sendOtp({
    required String phoneNumber,
  });

  Future<Either<dynamic, ApiResponse<String>>> checkUserExist({
    required String email,
  });
}
