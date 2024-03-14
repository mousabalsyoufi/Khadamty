import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/shared_models/shared_help_ticket_request_model.dart';
import '../../../../core/api_handler/response_handler.dart';

// abstract class for shared help form Repository
abstract class SharedHelpFormRepository {
  Future<Either<dynamic, ApiResponse<int>>> sendHelpTicket({
    required SharedHelpTicketRequestModel requestModel,
  });
}
