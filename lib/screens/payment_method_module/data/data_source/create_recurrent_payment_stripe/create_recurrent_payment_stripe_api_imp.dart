import 'package:dio/dio.dart';
import 'package:faciltateur_de_vies/core/api_handler/error_message.dart';
import 'package:faciltateur_de_vies/screens/payment_method_module/data/data_source/create_recurrent_payment_stripe/create_recurrent_payment_stripe_api.dart';
import 'package:faciltateur_de_vies/screens/payment_method_module/data/models/stripe_recurrent_model.dart';
import '../../../../../core/api_handler/app_exceptions.dart';
import '../../../../../core/api_handler/base_api_provider.dart';
import '../../../../../core/api_handler/generic_exceptions.dart';
import '../../../../../core/api_handler/response_handler.dart';
import '../../../../../core/api_handler/urls.dart';

// This class to handle create payment Stripe method
class CreateRecurrentPaymentStripeApiImp extends BaseApiProvider
    implements CreateRecurrentPaymentStripeApi {

  // Create Recurrent Payment Stripe for billing and return token to use it ...
  @override
  Future<ApiResponse<bool>> createRecurrentPaymentStripe({required StripeRequestRecurrentModel stripeRecurrentModel}) async {
    ApiResponse<bool>? result;
    Response? response;
    try {

      final data = stripeRecurrentModel.toJson();

      response = await client.post(
        Urls.createRecurrentStripe,
        data: data,
      );

      if(response.statusCode == 201) {
        result = ApiResponse.completed(true);
      } else{
        throw DefaultException(ErrorMessages.nDefault);
      }
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
