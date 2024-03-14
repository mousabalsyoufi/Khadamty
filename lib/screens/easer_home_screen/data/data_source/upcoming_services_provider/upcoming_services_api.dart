import 'package:faciltateur_de_vies/core/api_handler/response_handler.dart';
import 'package:faciltateur_de_vies/screens/user_bookings_screen/data/model/upcoming_orders_model.dart';
/// This abstract class for Easer upcoming service API
abstract class EaserUpcomingServicesApi {
  Future<ApiResponse<List<UpcomingOrdersModel>?>> getUpcomingServices(
      {required DateTime date});
}
