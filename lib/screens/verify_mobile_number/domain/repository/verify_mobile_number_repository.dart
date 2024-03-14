import 'package:dartz/dartz.dart';

import '../../../../core/api_handler/response_handler.dart';
import '../../data/model/verify_mobile_number_model.dart';

// abstract class for verify Mobile Number Repository
abstract class VerifyMobileNumberRepository {

  Future<Either<dynamic,ApiResponse<VerifyMobileNumberModel>>> verifyMobileNumber({required String mobileNumber});
}