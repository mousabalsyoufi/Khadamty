import 'package:faciltateur_de_vies/shared_models/address_model.dart';

import '../../../../../core/api_handler/response_handler.dart';

// abstract get user addresses  api call
abstract class UserAddressesApi {
  Future<ApiResponse<List<AddressModel>>> getAddresses();
}
