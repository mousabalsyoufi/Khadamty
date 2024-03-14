import 'package:dartz/dartz.dart';

import '../../../../core/api_handler/response_handler.dart';
import '../../../../core/generic_usecase/usecase.dart';
import '../repository/user_addresses_repository.dart';

// Delete Address useCase to link with instance from repository
class DeleteAddressUseCase
    extends UseCase<ApiResponse<String>, DeleteAddressUseCaseParams> {
  final UserAddressesRepository? _userAddressesRepository;

  DeleteAddressUseCase(this._userAddressesRepository);

  @override
  Future<Either<dynamic, ApiResponse<String>>> call(
      DeleteAddressUseCaseParams params) {
    return _userAddressesRepository!.deleteAddress(
      id: params.id,
    );
  }
}

class DeleteAddressUseCaseParams {
  final String id;
  DeleteAddressUseCaseParams({
    required this.id,
  });
}
