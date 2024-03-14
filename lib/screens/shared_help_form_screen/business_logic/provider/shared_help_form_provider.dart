import 'package:faciltateur_de_vies/shared_models/shared_help_ticket_request_model.dart';

import '../../../../core/base_provider/base_provider.dart';
import '../../../../core/utility/utility.dart';
import '../../domain/usecase/help_ticket_usecase.dart';

class SharedHelpFormProvider extends BaseProvider {
  final HelpTicketUseCase _helpTicketUseCase;

  SharedHelpFormProvider(this._helpTicketUseCase);

  String _helpTicketType = '';
  String get helpTicketType => _helpTicketType;

  int _selectedTypeIndex = 0;
  int get selectedTypeIndex => _selectedTypeIndex;

  setTicketType(int index, String ticketType) {
    _selectedTypeIndex = index;
    _helpTicketType = ticketType;
    updateUi();
  }

  Future<int> sendHelpTicket(
      {required SharedHelpTicketRequestModel requestModel}) async {
    setLoading = true;
    updateUi();
    var sendHelpTicketResult = await _helpTicketUseCase(
        HelpTicketUseCaseParams(requestModel: requestModel));
    return sendHelpTicketResult.fold((error) {
      setError = true;
      setLoading = false;
      Utility.showToast(message: error.message);
      updateUi();
      return 0;
    }, (response) {
      setLoading = false;
      Utility.showToast(
          message:
              'Your request has been sent successfuly our team will contact you');
      _selectedTypeIndex = 0;
      _helpTicketType = '';
      updateUi();
      return response.data!;
    });
  }
}
