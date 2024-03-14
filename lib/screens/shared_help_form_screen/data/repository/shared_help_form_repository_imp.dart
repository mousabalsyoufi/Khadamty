import 'package:faciltateur_de_vies/core/api_handler/response_handler.dart';
import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/shared_models/shared_help_ticket_request_model.dart';

import '../../../../constants/enums/response_enum.dart';
import '../../domain/repository/shared_help_form_repository.dart';
import '../data_source/help_ticket_provider/help_ticket_api_imp.dart';

// implementation Shared help ticket repository
class SharedHelpFormRepositoryImp implements SharedHelpFormRepository {
  final HelpTicketApiImp _helpTicketApiImp;

  SharedHelpFormRepositoryImp(this._helpTicketApiImp);

  @override
  Future<Either<dynamic, ApiResponse<int>>> sendHelpTicket(
      {required SharedHelpTicketRequestModel requestModel}) async {
    ApiResponse<int> result;
    try {
      result =
          await _helpTicketApiImp.sendHelpTicket(requestModel: requestModel);
      if (result.status == Status.completed) {
        return Right(result);
      } else {
        return Left(result);
      }
    } catch (error) {
      return Left(error);
    }
  }
}
