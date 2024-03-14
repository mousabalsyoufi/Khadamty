import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/shared_models/address_model.dart';

import '../../../../core/api_handler/response_handler.dart';

// abstract class for User Addresses Repository
abstract class UserAddressesRepository {

  Future<Either<dynamic,ApiResponse<List<AddressModel>>>> getAddresses();
  Future<Either<dynamic,ApiResponse<String>>> deleteAddress({required String id});
}