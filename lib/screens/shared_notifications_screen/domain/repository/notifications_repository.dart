import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/screens/shared_notifications_screen/data/model/notifications_respnse_model.dart';

import '../../../../core/api_handler/response_handler.dart';

// abstract class for Notifications Repository
abstract class NotificationsRepository {
  Future<Either<dynamic, ApiResponse<List<NotificationsResponseModel>>>>
      getNotifications();
}
