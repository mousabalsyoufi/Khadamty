import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/screens/user_add_address_screen/data/model/address_request_model.dart';
import '../../../../core/api_handler/response_handler.dart';

// abstract class for Subscribe To add address Repository
abstract class AddAddressRepository {
  Future<Either<dynamic, ApiResponse<int>>> addAddress({
    required AddressRequestModel addressModel,
  });
}
