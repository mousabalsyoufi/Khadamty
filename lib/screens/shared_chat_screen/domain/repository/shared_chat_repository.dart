import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/screens/shared_chat_screen/data/model/ticket_model.dart';

import '../../../../core/api_handler/response_handler.dart';

// abstract class for shared chat Repository
abstract class SharedChatRepository {
  Future<Either<dynamic, ApiResponse<List<TicketModel>>>> getTickets(
      {required String userId, required String easerId});
  Future<Either<dynamic, ApiResponse<String>>> sendTicket(
      {required String ticketId, required String trackId, required String message});
}
