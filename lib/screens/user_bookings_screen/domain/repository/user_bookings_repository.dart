import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/screens/user_bookings_screen/data/model/history_orders_model.dart';
import 'package:faciltateur_de_vies/screens/user_bookings_screen/data/model/upcoming_orders_model.dart';

import '../../../../core/api_handler/response_handler.dart';

// abstract class for User booking  Repository
abstract class UserBookingsRepository{

  Future<Either<dynamic,ApiResponse<List<UpcomingOrdersModel>?>>> upcomingOrders({int? page, int? limit, DateTime? date});

  Future<Either<dynamic,ApiResponse<List<HistoryOrdersModel>?>>> historyOrders({int? page, int? limit, DateTime? date});

}