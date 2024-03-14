import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/shared_models/shared_help_ticket_request_model.dart';
import '../../../../core/api_handler/response_handler.dart';

// abstract class for become an employee Repository
abstract class BecomeAnEmployeeRepository {
  Future<Either<dynamic, ApiResponse<int>>> becomeAnEmployee({
    required SharedHelpTicketRequestModel requestModel,
  });
}
