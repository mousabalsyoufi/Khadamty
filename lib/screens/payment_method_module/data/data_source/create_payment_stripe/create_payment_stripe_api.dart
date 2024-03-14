import 'package:faciltateur_de_vies/screens/payment_method_module/data/models/stripe_response_model.dart';
import 'package:faciltateur_de_vies/screens/payment_method_module/data/models/stripe_request_model.dart';
import '../../../../../core/api_handler/response_handler.dart';

// abstract Create payment method Stripe api
abstract class CreatePaymentStripeApi {
  Future<ApiResponse<StripeResponseModel>> createPaymentStripe(
      {required StripeRequestModel stripeRequestModel});
}
