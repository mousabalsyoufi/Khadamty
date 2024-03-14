import 'package:dio/dio.dart';
import 'package:faciltateur_de_vies/constants/api_keys/api_keys.dart';
import 'package:faciltateur_de_vies/shared_models/shared_faq_model.dart';
import '../../../../../core/api_handler/base_api_provider.dart';
import '../../../../../core/api_handler/generic_exceptions.dart';
import '../../../../../core/api_handler/response_handler.dart';
import '../../../../../core/api_handler/urls.dart';
import 'easer_faqs_api.dart';

// easer faqs api call implementation
class EaserFaqsApiImp extends BaseApiProvider implements EaserFaqsApi {
  @override
  Future<ApiResponse<List<SharedFaqModel>>> getEaserFaqs() async {
    ApiResponse<List<SharedFaqModel>>? result;
    Response? response;
    try {
      response = await client.get(
        Urls.easerFaqs,
        options: await getRequestWithoutToken(),
      );
      List<SharedFaqModel> faqs =
          (response.data[ApiKeys.data][ApiKeys.result] as List)
              .map<SharedFaqModel>((json) => SharedFaqModel.fromMap(json))
              .toList();

      result = ApiResponse.completed(faqs);
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
