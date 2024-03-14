
// abstract delete address api call


import '../../../../../core/api_handler/response_handler.dart';

abstract class DeleteAddressApi {
  Future<ApiResponse<String>> deleteAddress({
    required String id,
  });
}
