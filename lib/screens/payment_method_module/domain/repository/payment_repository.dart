import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/screens/payment_method_module/data/models/stripe_recurrent_model.dart';
import 'package:faciltateur_de_vies/screens/payment_method_module/data/models/stripe_response_model.dart';
import 'package:faciltateur_de_vies/screens/payment_method_module/data/models/stripe_request_model.dart';

import '../../../../../core/api_handler/response_handler.dart';

// abstract class for Payment  Repository
abstract class PaymentMethodRepository {

  // This is function for confirm stripe payment method
  Future<Either<dynamic,ApiResponse<StripeResponseModel>>> confirmStripePaymentMethod({required String paymentIntentId});
  // This is function for create stripe payment method
  Future<Either<dynamic,ApiResponse<StripeResponseModel>>> createStripePaymentMethod({required StripeRequestModel stripeRequestModel});

  // This is function for create Recurrent stripe payment method
  Future<Either<dynamic,ApiResponse<bool>>> createRecurrentStripePaymentMethod({required StripeRequestRecurrentModel stripeRequestRecurrentModel});


}