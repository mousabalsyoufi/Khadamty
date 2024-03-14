// abstract help ticket api call

import 'package:faciltateur_de_vies/shared_models/shared_help_ticket_request_model.dart';

import '../../../../../core/api_handler/response_handler.dart';

abstract class HelpTicketApi {
  Future<ApiResponse<int>> sendHelpTicket({
    required SharedHelpTicketRequestModel requestModel,
  });
}
