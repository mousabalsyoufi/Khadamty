import 'package:faciltateur_de_vies/core/api_handler/response_handler.dart';
import 'package:faciltateur_de_vies/screens/user_bookings_screen/data/model/upcoming_orders_model.dart';

abstract class UpcomingOrdersApi {
  Future<ApiResponse<List<UpcomingOrdersModel>?>> upcomingOrders({int? page,int? limit,DateTime? date});
}
