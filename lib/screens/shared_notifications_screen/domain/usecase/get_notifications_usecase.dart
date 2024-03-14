// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/screens/shared_notifications_screen/data/model/notifications_respnse_model.dart';

import '../../../../core/api_handler/response_handler.dart';
import '../../../../core/generic_usecase/usecase.dart';
import '../repository/notifications_repository.dart';

// get Notifications useCase to link with instance from repository
class GetNotificationsUseCase
    extends UseCase<ApiResponse<List<NotificationsResponseModel>>, NoParams> {
  final NotificationsRepository? _notificationsRepository;

  GetNotificationsUseCase(this._notificationsRepository);

  @override
  Future<Either<dynamic, ApiResponse<List<NotificationsResponseModel>>>> call(
      NoParams params) {
    return _notificationsRepository!.getNotifications();
  }
}
