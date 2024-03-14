import '../../../../../core/api_handler/response_handler.dart';
import '../../models/stripe_response_model.dart';

// This is abstract class to confirm payment method on stripe
abstract class ConfirmPaymentStripeApi {
  Future<ApiResponse<StripeResponseModel>> confirmPaymentStripe(
      {required String paymentIntentId});
}
