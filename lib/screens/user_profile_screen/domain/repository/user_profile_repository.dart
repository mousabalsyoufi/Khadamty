import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/core/models/response.model.dart';
import 'package:faciltateur_de_vies/screens/user_profile_screen/data/models/account_model.dart';
import 'package:faciltateur_de_vies/screens/user_profile_screen/data/models/upload_photo_model.dart';

import '../../../../core/api_handler/response_handler.dart';

// abstract class for User Profile Repository
abstract class UserProfileRepository {
  Future<Either<dynamic, ApiResponse<String>>> deleteAccount({
    required String id,
  });

  Future<Either<dynamic, ApiResponse<String>>> uploadPhoto({
    required UploadPhotoModel requestModel,
  });

  Future<Either<dynamic, ApiResponse<AccountModel>>> getAccount();

  Future<Either<dynamic, ApiResponse<SuccessResponseModel>>> updateAccount(
      {required AccountModel accountModel, required int id});
}
