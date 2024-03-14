import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/shared_models/shared_help_ticket_request_model.dart';

import '../../../../core/api_handler/response_handler.dart';
import '../../../../core/generic_usecase/usecase.dart';
import '../repository/become_an_employee_repository.dart';

// become an employee to link with instance from repository
class BecomeAnEmployeeUseCase
    extends UseCase<ApiResponse<int>, BecomeEmployeeUseCaseParams> {
  final BecomeAnEmployeeRepository? _becomeAnEmployeeRepository;

  BecomeAnEmployeeUseCase(this._becomeAnEmployeeRepository);

  @override
  Future<Either<dynamic, ApiResponse<int>>> call(
      BecomeEmployeeUseCaseParams params) {
    return _becomeAnEmployeeRepository!.becomeAnEmployee(
      requestModel: params.requestModel,
    );
  }
}

class BecomeEmployeeUseCaseParams {
  final SharedHelpTicketRequestModel requestModel;
  BecomeEmployeeUseCaseParams({
    required this.requestModel,
  });
}
