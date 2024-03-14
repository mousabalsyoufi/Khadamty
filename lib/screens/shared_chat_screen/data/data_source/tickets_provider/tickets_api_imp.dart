import 'package:dio/dio.dart';
import 'package:faciltateur_de_vies/constants/api_keys/api_keys.dart';
import 'package:faciltateur_de_vies/screens/shared_chat_screen/data/data_source/tickets_provider/tickets_api.dart';
import 'package:faciltateur_de_vies/screens/shared_chat_screen/data/model/ticket_model.dart';
import '../../../../../core/api_handler/base_api_provider.dart';
import '../../../../../core/api_handler/generic_exceptions.dart';
import '../../../../../core/api_handler/response_handler.dart';
import '../../../../../core/api_handler/urls.dart';

// Tickets api call implementation
class TicketsApiImp extends BaseApiProvider implements TicketsApi {
  @override
  Future<ApiResponse<List<TicketModel>>> getTickets(
      {required String userId, required String easerId}) async {
    ApiResponse<List<TicketModel>>? result;
    Response? response;
    try {
      response = await client.get(
        Urls.tickets,
        options: await getRequestWithToken(),
      );
      List<TicketModel> tickets =
          (response.data[ApiKeys.data][ApiKeys.result] as List)
              .map<TicketModel>((json) => TicketModel.fromMap(json))
              .toList();

      result = ApiResponse.completed(tickets);
      result.message = response.data[ApiKeys.message];
      result.code = response.data[ApiKeys.code];
    } catch (error) {
      try {
        error is DioError
            ? customExceptionHandler(error, -1)
            : customExceptionHandler(error, response);
      } catch (forcedException) {
        result = ApiResponse.error(forcedException.toString());
      }
    }
    return result!;
  }
}
