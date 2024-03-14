import 'package:faciltateur_de_vies/core/utility/utility.dart';
import 'package:faciltateur_de_vies/screens/shared_chat_screen/data/model/ticket_model.dart';
import 'package:faciltateur_de_vies/screens/shared_chat_screen/domain/usecase/get_tickets_usecase.dart';
import 'package:faciltateur_de_vies/screens/shared_chat_screen/domain/usecase/send_chat_ticket_usecase.dart';

import '../../../../core/base_provider/base_provider.dart';

class SharedChatProvider extends BaseProvider {
  final GetTicketsUseCase _getTicketsUseCase;
  final SendChatTicketUseCase _sendChatTicketUseCase;
  SharedChatProvider(this._getTicketsUseCase, this._sendChatTicketUseCase);

  String _userId = '';
  String _easerId = '';

  List<TicketModel> _tickets = [];
  List<TicketModel> get tickets => _tickets;

  // get tickets function to handle tickets and change state depended on return
  getTickets(
      {required String userId,
      required String easerId,
      bool reload = false}) async {
    _userId = userId;
    _easerId = easerId;
    if (reload) {
      setLoading = true;
    }
    _tickets = [];
    updateUi();
    var servicesResult = await _getTicketsUseCase(
        GetTicketsUseCaseParams(userId: userId, easerId: easerId));
    servicesResult.fold((error) {
      setError = true;
      setLoading = false;
      Utility.showToast(message: error.message);
      updateUi();
    }, (response) {
      setLoading = false;
      _tickets = response.data!;
      updateUi();
    });
  }

  // send ticket function to handle send ticket and change state depended on return
  sendTicket(
      {required String ticketId,
      required String trackId,
      required String message}) async {
    setLoading = true;
    _tickets = [];
    updateUi();
    var servicesResult = await _sendChatTicketUseCase(
        SendChatTicketUseCaseParams(
            ticketId: ticketId, trackId: trackId, message: message));
    servicesResult.fold((error) {
      setError = true;
      setLoading = false;
      Utility.showToast(message: error.message);
      updateUi();
    }, (response) {
      setLoading = false;
      if (response.data! == ticketId) {
        getTickets(userId: _userId, easerId: _easerId, reload: true);
      }
      updateUi();
    });
  }
}
