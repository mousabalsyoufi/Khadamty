import 'package:faciltateur_de_vies/screens/shared_chat_screen/data/model/ticket_model.dart';

import '../../../../../core/api_handler/response_handler.dart';

// abstract get tickets api call
abstract class TicketsApi {
  Future<ApiResponse<List<TicketModel>>> getTickets({required String userId, required String easerId});
}
