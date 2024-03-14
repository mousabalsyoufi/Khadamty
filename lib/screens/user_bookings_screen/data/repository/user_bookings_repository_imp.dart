import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/constants/enums/response_enum.dart';
import 'package:faciltateur_de_vies/screens/user_bookings_screen/data/data_source/history_orders_provider/history_orders_api_imp.dart';
import 'package:faciltateur_de_vies/screens/user_bookings_screen/data/data_source/upcoming_orders_provider/upcoming_orders_api_imp.dart';
import 'package:faciltateur_de_vies/screens/user_bookings_screen/data/model/history_orders_model.dart';
import 'package:faciltateur_de_vies/screens/user_bookings_screen/data/model/upcoming_orders_model.dart';
import 'package:faciltateur_de_vies/screens/user_bookings_screen/domain/repository/user_bookings_repository.dart';
import '../../../../core/api_handler/response_handler.dart';

// implementation User Bookings repository
class UserBookingsRepositoryImp implements UserBookingsRepository {

  final HistoryOrdersApiImp _historyOrdersApiImp;
  final UpcomingOrdersApiImp _upcomingOrdersApiImp;

  UserBookingsRepositoryImp(this._historyOrdersApiImp,this._upcomingOrdersApiImp);


  @override
  Future<Either<dynamic, ApiResponse<List<HistoryOrdersModel>?>>> historyOrders({int? page, int? limit, DateTime? date}) async {
    ApiResponse<List<HistoryOrdersModel>?> result;
    try {
      result = await _historyOrdersApiImp.historyOrders(date: date,page: page,limit: limit);
      if (result.status == Status.completed) {
        return Right(result);
      } else {
        return Left(result);
      }
    } catch (error) {
      return Left(error);
    }
  }

  @override
  Future<Either<dynamic, ApiResponse<List<UpcomingOrdersModel>?>>> upcomingOrders({int? page, int? limit, DateTime? date}) async {
    ApiResponse<List<UpcomingOrdersModel>?> result;
    try {
      result = await _upcomingOrdersApiImp.upcomingOrders(date: date,page: page,limit: limit);
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
