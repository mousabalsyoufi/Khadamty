import 'package:faciltateur_de_vies/core/api_handler/response_handler.dart';
import 'package:faciltateur_de_vies/core/models/response.model.dart';
import 'package:faciltateur_de_vies/screens/user_profile_screen/data/models/account_model.dart';

abstract class UpdateAccountApi {
  Future<ApiResponse<SuccessResponseModel>> updateAccount({required AccountModel accountModel,required int id});
}
