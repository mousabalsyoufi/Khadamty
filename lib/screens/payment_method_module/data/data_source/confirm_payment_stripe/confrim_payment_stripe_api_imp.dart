import 'package:dio/dio.dart';
import 'package:faciltateur_de_vies/constants/api_keys/api_keys.dart';
import 'package:faciltateur_de_vies/core/api_handler/urls.dart';
import 'package:faciltateur_de_vies/screens/payment_method_module/data/data_source/confirm_payment_stripe/confirm_payment_stripe_api.dart';
import 'package:faciltateur_de_vies/screens/payment_method_module/data/models/stripe_response_model.dart';
import '../../../../../core/api_handler/base_api_provider.dart';
import '../../../../../core/api_handler/generic_exceptions.dart';
import '../../../../../core/api_handler/response_handler.dart';

// This class to confirm payment method
class ConfirmPaymentStripeApiImp extends BaseApiProvider
    implements ConfirmPaymentStripeApi {

  // This is function use to confirm payment
  @override
  Future<ApiResponse<StripeResponseModel>> confirmPaymentStripe({required String paymentIntentId}) async {
    ApiResponse<StripeResponseModel>? result;
    Response? response;
    try {

      final data = {
        'paymentIntentId': paymentIntentId,
      };
      response = await client.post(
        Urls.confirmStripe,
        data: data,
      );

      result = ApiResponse.completed(StripeResponseModel.fromJson(response.data[ApiKeys.data][ApiKeys.result]));
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
