
import 'package:faciltateur_de_vies/screens/registeration_screen/data/model/register_request_model.dart';

import '../../../../../core/api_handler/response_handler.dart';
import '../../model/register_model.dart';

// abstract register  api call
abstract class RegisterApi {
  Future<ApiResponse<RegisterModel>> register(
      {required RegisterRequestModel registerRequestModel});
}
