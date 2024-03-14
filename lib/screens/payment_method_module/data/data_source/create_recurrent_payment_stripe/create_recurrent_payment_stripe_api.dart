import 'package:faciltateur_de_vies/screens/payment_method_module/data/models/stripe_recurrent_model.dart';
import '../../../../../core/api_handler/response_handler.dart';

// abstract Create Recurrent payment method Stripe api
abstract class CreateRecurrentPaymentStripeApi {
  Future<ApiResponse<bool>> createRecurrentPaymentStripe(
      {required StripeRequestRecurrentModel stripeRecurrentModel});
}
