import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/screens/user_bookings_screen/data/model/upcoming_orders_model.dart';

import '../../../../core/api_handler/response_handler.dart';

// abstract class for Easer Home Repository
abstract class EaserHomeRepository {
  Future<Either<dynamic, ApiResponse<List<UpcomingOrdersModel>?>>>
      getUpcomingOrders({required DateTime date});
}
