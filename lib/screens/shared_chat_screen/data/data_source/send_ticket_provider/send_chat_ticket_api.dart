
import '../../../../../core/api_handler/response_handler.dart';

// abstract Send Chat Ticket api call
abstract class SendChatTicketApi {
  Future<ApiResponse<String>> sendTicket(
      {required String ticketId,
      required String trackId,
      required String message});
}
