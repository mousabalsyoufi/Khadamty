import 'package:faciltateur_de_vies/core/api_handler/response_handler.dart';
import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/shared_models/shared_help_ticket_request_model.dart';

import '../../../../constants/enums/response_enum.dart';
import '../../domain/repository/become_an_employee_repository.dart';
import '../data_source/become_an_employee_provider/become_an_employee_api_imp.dart';

// implementation Become An Employee repository
class BecomeAnEmployeeRepositoryImp implements BecomeAnEmployeeRepository {
  final BecomeAnEmployeeApiImp _becomeAnEmployeeApiImp;

  BecomeAnEmployeeRepositoryImp(this._becomeAnEmployeeApiImp);

  @override
  Future<Either<dynamic, ApiResponse<int>>> becomeAnEmployee(
      {required SharedHelpTicketRequestModel requestModel}) async {
    ApiResponse<int> result;
    try {
      result = await _becomeAnEmployeeApiImp.becomeAnEmployee(
          requestModel: requestModel);
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
