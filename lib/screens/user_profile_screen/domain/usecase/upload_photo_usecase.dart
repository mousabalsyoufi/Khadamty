import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/screens/user_profile_screen/data/models/upload_photo_model.dart';
import 'package:faciltateur_de_vies/screens/user_profile_screen/domain/repository/user_profile_repository.dart';

import '../../../../core/api_handler/response_handler.dart';
import '../../../../core/generic_usecase/usecase.dart';

// Upload Photo useCase to link with instance from repository
class UploadPhotoUseCase
    extends UseCase<ApiResponse<String>, UploadPhotoUseCaseParams> {
  final UserProfileRepository? _userProfileRepository;

  UploadPhotoUseCase(this._userProfileRepository);

  @override
  Future<Either<dynamic, ApiResponse<String>>> call(
      UploadPhotoUseCaseParams params) {
    return _userProfileRepository!.uploadPhoto(
      requestModel: params.requestModel,
    );
  }
}

class UploadPhotoUseCaseParams {
  UploadPhotoModel requestModel;
  UploadPhotoUseCaseParams({
    required this.requestModel,
  });
}
