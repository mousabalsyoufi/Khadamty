import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/screens/registeration_screen/data/data_source/check_user_exist_provider/check_user_exist_api_imp.dart';
import 'package:faciltateur_de_vies/screens/registeration_screen/data/data_source/otp_sending_provider/send_otp_api_imp.dart';
import 'package:faciltateur_de_vies/screens/registeration_screen/data/data_source/register_company_provider/register_company_api_imp.dart';
import 'package:faciltateur_de_vies/screens/registeration_screen/data/model/register_comany_model.dart';
import '../../../../constants/enums/response_enum.dart';
import '../data_source/otp_verification_provider/verify_otp_api_imp.dart';
import '../model/register_request_model.dart';
import '../model/register_model.dart';
import '../../../../core/api_handler/response_handler.dart';
import '../../domain/repository/register_repository.dart';
import '../data_source/register_provider/register_api_imp.dart';
import '../model/verify_otp_response_model.dart';

// implementation Register repository
class RegisterRepositoryImp implements RegisterRepository {
  final RegisterApiImp registerImp;
  final VerifyOtpApiImp verifyOtpImp;
  final SendOtpApiImp sendOtpApiImp;
  final CheckUserExistApiImp checkUserExistApiImp;
  final RegisterCompanyApiImp registerCompanyImp;

  RegisterRepositoryImp({
    required this.registerImp,
    required this.verifyOtpImp,
    required this.sendOtpApiImp,
    required this.checkUserExistApiImp,
    required this.registerCompanyImp,
  });

  @override
  Future<Either<dynamic, ApiResponse<RegisterModel>>> register(
      {required RegisterRequestModel registerRequestModel}) async {
    ApiResponse<RegisterModel> result;
    try {
      result = await registerImp.register(
          registerRequestModel: registerRequestModel);
      if (result.status == Status.completed) {
        return Right(result);
      } else {
        return Left(result);
      }
    } catch (error) {
      return Left(error);
    }
  }

  @override
  Future<Either<dynamic, ApiResponse<VerifyOtpResponseModel>>> verifyOtp({
    required String otpCode,
    required String verificationId,
  }) async {
    ApiResponse<VerifyOtpResponseModel> result;
    try {
      result = await verifyOtpImp.verifyOtp(
        otpCode: otpCode,
        verificationId: verificationId,
      );
      if (result.status == Status.completed) {
        return Right(result);
      } else {
        return Left(result);
      }
    } catch (error) {
      return Left(error);
    }
  }

  @override
  Future<Either<dynamic, ApiResponse<String>>> sendOtp(
      {required String phoneNumber}) async {
    ApiResponse<String> result;
    try {
      result = await sendOtpApiImp.sendOtp(phoneNumber: phoneNumber);
      if (result.status == Status.completed) {
        return Right(result);
      } else {
        return Left(result);
      }
    } catch (error) {
      return Left(error);
    }
  }

  @override
  Future<Either<dynamic, ApiResponse<String>>> checkUserExist(
      {required String email}) async {
    ApiResponse<String> result;
    try {
      result = await checkUserExistApiImp.checkUserExist(email: email);
      if (result.status == Status.completed) {
        return Right(result);
      } else {
        return Left(result);
      }
    } catch (error) {
      return Left(error);
    }
  }

  @override
  Future<Either<dynamic, ApiResponse<RegisterModel>>> registerCompany({required RegisterRequestCompanyModel registerRequestModel}) async {
    ApiResponse<RegisterModel> result;
    try {
      result = await registerCompanyImp.register(
          registerRequestModel: registerRequestModel);
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
