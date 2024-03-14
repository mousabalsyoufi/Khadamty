import 'package:faciltateur_de_vies/core/api_handler/response_handler.dart';
import 'package:faciltateur_de_vies/screens/user_profile_screen/data/models/account_model.dart';

abstract class GetEaserAccountApi {
  Future<ApiResponse<AccountModel>> getAccount();
}
