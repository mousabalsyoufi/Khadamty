import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/shared_models/shared_help_ticket_request_model.dart';

import '../../../../core/api_handler/response_handler.dart';
import '../../../../core/generic_usecase/usecase.dart';
import '../repository/shared_help_form_repository.dart';

// help ticket usecase to link with instance from repository
class HelpTicketUseCase
    extends UseCase<ApiResponse<int>, HelpTicketUseCaseParams> {
  final SharedHelpFormRepository? _sharedHelpFormRepository;

  HelpTicketUseCase(this._sharedHelpFormRepository);

  @override
  Future<Either<dynamic, ApiResponse<int>>> call(
      HelpTicketUseCaseParams params) {
    return _sharedHelpFormRepository!.sendHelpTicket(
      requestModel: params.requestModel,
    );
  }
}

class HelpTicketUseCaseParams {
  final SharedHelpTicketRequestModel requestModel;
  HelpTicketUseCaseParams({
    required this.requestModel,
  });
}
