// abstract become an employee api call

import 'package:faciltateur_de_vies/shared_models/shared_help_ticket_request_model.dart';

import '../../../../../core/api_handler/response_handler.dart';

abstract class BecomeAnEmployeeApi {
  Future<ApiResponse<int>> becomeAnEmployee({
    required SharedHelpTicketRequestModel requestModel,
  });
}
