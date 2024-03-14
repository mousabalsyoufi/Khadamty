import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/constants/enums/response_enum.dart';
import 'package:faciltateur_de_vies/core/models/response.model.dart';
import 'package:faciltateur_de_vies/screens/user_profile_screen/data/data_source/delete_account_provider/delete_account_api_imp.dart';
import 'package:faciltateur_de_vies/screens/user_profile_screen/data/data_source/get_account_provider/get_account_api_imp.dart';
import 'package:faciltateur_de_vies/screens/user_profile_screen/data/data_source/update_account_provider/update_account_api_imp.dart';
import 'package:faciltateur_de_vies/screens/user_profile_screen/data/data_source/upload_photo_provider/upload_photo_api_imp.dart';
import 'package:faciltateur_de_vies/screens/user_profile_screen/data/models/account_model.dart';
import 'package:faciltateur_de_vies/screens/user_profile_screen/data/models/upload_photo_model.dart';
import 'package:faciltateur_de_vies/screens/user_profile_screen/domain/repository/user_profile_repository.dart';
import '../../../../core/api_handler/response_handler.dart';

// implementation User Profile repository
class UserProfileRepositoryImp implements UserProfileRepository {
  final DeleteAccountApiImp _deleteAccountApiImp;
  final GetAccountApiImp _getAccountApiImp;
  final UploadPhotoApiImp _uploadPhotoApiImp;

  final UpdateAccountApiImp _updateAccountApiImp;

  UserProfileRepositoryImp(this._deleteAccountApiImp, this._getAccountApiImp,
      this._updateAccountApiImp, this._uploadPhotoApiImp);

  @override
  Future<Either<dynamic, ApiResponse<String>>> deleteAccount(
      {required String id}) async {
    ApiResponse<String> result;
    try {
      result = await _deleteAccountApiImp.deleteAccount(
        id: id,
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

  @override
  Future<Either<dynamic, ApiResponse<SuccessResponseModel>>> updateAccount(
      {required AccountModel accountModel, required int id}) async {
    ApiResponse<SuccessResponseModel> result;
    try {
      result = await _updateAccountApiImp.updateAccount(
          accountModel: accountModel, id: id);
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
  Future<Either<dynamic, ApiResponse<String>>> uploadPhoto(
      {required UploadPhotoModel requestModel}) async {
    ApiResponse<String> result;
    try {
      result = await _uploadPhotoApiImp.uploadPhoto(
        requestModel: requestModel,
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
}
