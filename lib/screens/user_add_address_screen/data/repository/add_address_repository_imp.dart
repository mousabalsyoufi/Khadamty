import 'package:faciltateur_de_vies/screens/user_add_address_screen/data/model/address_request_model.dart';
import 'package:faciltateur_de_vies/core/api_handler/response_handler.dart';
import 'package:dartz/dartz.dart';

import '../../../../constants/enums/response_enum.dart';
import '../../domain/repository/add_address_repository.dart';
import '../data_source/add_address_provider/add_address_api_imp.dart';

// implementation Add Address repository
class AddAddressRepositoryImp implements AddAddressRepository {
  final AddAddressApiImp _addAddressApiImp;

  AddAddressRepositoryImp(this._addAddressApiImp);

  @override
  Future<Either<dynamic, ApiResponse<int>>> addAddress(
      {required AddressRequestModel addressModel}) async {
    ApiResponse<int> result;
    try {
      result = await _addAddressApiImp.addAddress(addressModel: addressModel);
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
