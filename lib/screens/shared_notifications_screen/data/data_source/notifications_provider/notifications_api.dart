import 'package:faciltateur_de_vies/screens/shared_notifications_screen/data/model/notifications_respnse_model.dart';

import '../../../../../core/api_handler/response_handler.dart';

// abstract get notifications  api call
abstract class NotificationsApi {
  Future<ApiResponse<List<NotificationsResponseModel>>> getNotifications();
}
