import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/constants/enums/response_enum.dart';
import 'package:faciltateur_de_vies/screens/user_profile_screen/data/models/account_model.dart';
import '../../../../core/api_handler/response_handler.dart';
import '../../domain/repository/easer_personal_data_repository.dart';
import '../datasource/get_account_provider/get_easer_account_api_imp.dart';

// implementation User personal data repository
class EaserPersonalDataRepositoryImp implements EaserPersonalDataRepository {
  final GetEaserAccountApiImp _getAccountApiImp;

  EaserPersonalDataRepositoryImp(
    this._getAccountApiImp,
  );

  @override
  Future<Either<dynamic, ApiResponse<AccountModel>>> getAccount() async {
    ApiResponse<AccountModel> result;
    try {
      result = await _getAccountApiImp.getAccount();
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
