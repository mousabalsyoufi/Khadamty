import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/screens/user_add_address_screen/data/model/address_request_model.dart';
import 'package:faciltateur_de_vies/screens/user_add_address_screen/domain/repository/add_address_repository.dart';

import '../../../../core/api_handler/response_handler.dart';
import '../../../../core/generic_usecase/usecase.dart';

// Add Address useCase to link with instance from repository
class AddAddressUseCase
    extends UseCase<ApiResponse<int>, AddAddressUseCaseParams> {
  final AddAddressRepository? _addAddressRepository;

  AddAddressUseCase(this._addAddressRepository);

  @override
  Future<Either<dynamic, ApiResponse<int>>> call(
      AddAddressUseCaseParams params) {
    return _addAddressRepository!.addAddress(
      addressModel: params.addressModel,
    );
  }
}

class AddAddressUseCaseParams {
  final AddressRequestModel addressModel;
  AddAddressUseCaseParams({
    required this.addressModel,
  });
}
