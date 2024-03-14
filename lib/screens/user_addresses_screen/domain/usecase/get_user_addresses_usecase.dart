// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/shared_models/address_model.dart';

import '../../../../core/api_handler/response_handler.dart';
import '../../../../core/generic_usecase/usecase.dart';
import '../repository/user_addresses_repository.dart';

// get Addresses useCase to link with instance from repository
class GetUserAddressesUseCase
    extends UseCase<ApiResponse<List<AddressModel>>, NoParams> {
  final UserAddressesRepository? _userAddressesRepository;

  GetUserAddressesUseCase(this._userAddressesRepository);

  @override
  Future<Either<dynamic, ApiResponse<List<AddressModel>>>> call(
      NoParams params) {
    return _userAddressesRepository!.getAddresses();
  }
}
