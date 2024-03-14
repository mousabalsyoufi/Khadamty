import 'package:faciltateur_de_vies/core/api_handler/response_handler.dart';
import 'package:faciltateur_de_vies/screens/user_bookings_screen/data/model/history_orders_model.dart';

abstract class HistoryOrdersApi {
  Future<ApiResponse<List<HistoryOrdersModel>?>> historyOrders({int? page,int? limit,DateTime? date});
}
