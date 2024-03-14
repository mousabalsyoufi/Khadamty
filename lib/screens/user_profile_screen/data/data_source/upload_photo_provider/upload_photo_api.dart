
// abstract upload photo call
import 'package:faciltateur_de_vies/screens/user_profile_screen/data/models/upload_photo_model.dart';

import '../../../../../core/api_handler/response_handler.dart';

abstract class UploadPhotoApi {
  Future<ApiResponse<String>> uploadPhoto({
    required UploadPhotoModel requestModel,
  });
}
