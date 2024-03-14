import 'package:dio/dio.dart';
import 'package:faciltateur_de_vies/constants/api_keys/api_keys.dart';
import 'package:faciltateur_de_vies/screens/shared_chat_screen/data/data_source/send_ticket_provider/send_chat_ticket_api.dart';
import '../../../../../core/api_handler/base_api_provider.dart';
import '../../../../../core/api_handler/generic_exceptions.dart';
import '../../../../../core/api_handler/response_handler.dart';
import '../../../../../core/api_handler/urls.dart';

// send ticket api call implementation
class SendChatTicketApiImp extends BaseApiProvider
    implements SendChatTicketApi {
  @override
  Future<ApiResponse<String>> sendTicket(
      {required String ticketId,
      required String trackId,
      required String message}) async {
    ApiResponse<String>? result;
    Response? response;
    try {
      final params = {
        'track_id': trackId,
        'message': message,
      };
      response = await client.post(
        '${Urls.tickets}/$ticketId',
        options: await getRequestWithToken(),
        data: params,
      );
      String returnedTicketId = response.data[ApiKeys.data][ApiKeys.result];

      result = ApiResponse.completed(returnedTicketId);
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
