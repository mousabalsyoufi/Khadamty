
// abstract add address api call

import 'package:faciltateur_de_vies/screens/user_add_address_screen/data/model/address_request_model.dart';

import '../../../../../core/api_handler/response_handler.dart';

abstract class AddAddressApi {
  Future<ApiResponse<int>> addAddress({
    required AddressRequestModel addressModel,
  });
}
