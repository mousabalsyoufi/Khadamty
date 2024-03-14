import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/constants/enums/response_enum.dart';
import '../../../../core/api_handler/response_handler.dart';
import '../../domain/repository/notifications_repository.dart';
import '../data_source/notifications_provider/notifications_api_imp.dart';
import '../model/notifications_respnse_model.dart';

// implementation Notifications repository
class NotificationsRepositoryImp implements NotificationsRepository {
  final NotificationsApiImp notificationsApiImp;

  NotificationsRepositoryImp({
    required this.notificationsApiImp,
  });


  @override
  Future<Either<dynamic, ApiResponse<List<NotificationsResponseModel>>>> getNotifications() async {
   ApiResponse<List<NotificationsResponseModel>> result;
    try {
      result = await notificationsApiImp.getNotifications();
      if (result.status == Status.completed) {
        return Right(result);
      } else {
        return Left(result);
      }
    } catch (error) {
      return Left(error);
    }
  }
}
