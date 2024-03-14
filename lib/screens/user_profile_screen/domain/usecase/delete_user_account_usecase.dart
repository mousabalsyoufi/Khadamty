import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/screens/user_profile_screen/domain/repository/user_profile_repository.dart';

import '../../../../core/api_handler/response_handler.dart';
import '../../../../core/generic_usecase/usecase.dart';

// Delete User Account useCase to link with instance from repository
class DeleteUserAccountUseCase extends UseCase<ApiResponse<String>, DeleteUserAccountUseCaseParams> {
  final UserProfileRepository? _userProfileRepository;

  DeleteUserAccountUseCase(this._userProfileRepository);

  @override
  Future<Either<dynamic, ApiResponse<String>>> call(
      DeleteUserAccountUseCaseParams params) {
    return _userProfileRepository!.deleteAccount(
      id: params.id,
    );
  }
}

class DeleteUserAccountUseCaseParams {
  final String id;
  DeleteUserAccountUseCaseParams({
    required this.id,
  });
}
