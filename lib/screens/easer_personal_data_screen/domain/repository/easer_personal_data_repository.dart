import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/screens/user_profile_screen/data/models/account_model.dart';

import '../../../../core/api_handler/response_handler.dart';

// abstract class for User personal data Repository
abstract class EaserPersonalDataRepository {
  Future<Either<dynamic, ApiResponse<AccountModel>>> getAccount();
}
