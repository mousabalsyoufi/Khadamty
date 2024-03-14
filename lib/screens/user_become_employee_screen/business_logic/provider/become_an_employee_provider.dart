import 'package:faciltateur_de_vies/shared_models/shared_help_ticket_request_model.dart';

import '../../../../core/base_provider/base_provider.dart';
import '../../../../core/utility/utility.dart';
import '../../domain/usecase/become_an_employee_usecase.dart';

class BecomeAnEmployeeProvider extends BaseProvider {
  final BecomeAnEmployeeUseCase _becomeAnEmployeeUseCase;

  BecomeAnEmployeeProvider(this._becomeAnEmployeeUseCase);

  Future<int> becomeAnEmployee(
      {required SharedHelpTicketRequestModel requestModel}) async {
    setLoading = true;
    updateUi();
    var becomeEmployeeResult = await _becomeAnEmployeeUseCase(
        BecomeEmployeeUseCaseParams(requestModel: requestModel));
    return becomeEmployeeResult.fold((error) {
      setError = true;
      setLoading = false;
      Utility.showToast(message: error.message);
      updateUi();
      return 0;
    }, (response) {
      setLoading = false;
      updateUi();
      Utility.showToast(
          message:
              'Your request has been sent successfuly our team will contact you');
      return response.data!;
    });
  }
}
