import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/constants/enums/response_enum.dart';
import 'package:faciltateur_de_vies/screens/payment_method_module/data/data_source/confirm_payment_stripe/confrim_payment_stripe_api_imp.dart';
import 'package:faciltateur_de_vies/screens/payment_method_module/data/data_source/create_payment_stripe/create_payment_stripe_api_imp.dart';
import 'package:faciltateur_de_vies/screens/payment_method_module/data/models/stripe_recurrent_model.dart';
import 'package:faciltateur_de_vies/screens/payment_method_module/data/models/stripe_response_model.dart';
import 'package:faciltateur_de_vies/screens/payment_method_module/data/models/stripe_request_model.dart';
import '../../../../core/api_handler/response_handler.dart';
import '../../domain/repository/payment_repository.dart';
import '../data_source/create_recurrent_payment_stripe/create_recurrent_payment_stripe_api_imp.dart';

// This is class for implementation Payment  repository Imp
class PaymentMethodRepositoryImp implements PaymentMethodRepository {
  final ConfirmPaymentStripeApiImp _confirmPaymentStripeApiImp;
  final CreatePaymentStripeApiImp _createPaymentStripeApiImp;
  final CreateRecurrentPaymentStripeApiImp _createRecurrentPaymentStripeApiImp;

  PaymentMethodRepositoryImp(this._createPaymentStripeApiImp,this._confirmPaymentStripeApiImp,this._createRecurrentPaymentStripeApiImp);


  // This is function to confirm stripe
  @override
  Future<Either<dynamic, ApiResponse<StripeResponseModel>>> confirmStripePaymentMethod({required String paymentIntentId}) async {
    ApiResponse<StripeResponseModel> result;
    try {
      result = await _confirmPaymentStripeApiImp.confirmPaymentStripe(
        paymentIntentId: paymentIntentId,
      );
      if (result.status == Status.completed) {
        return Right(result);
      } else {
        return Left(result);
      }
    } catch (error) {
      return Left(error);
    }
  }


  // This is function to create stripe
  @override
  Future<Either<dynamic, ApiResponse<StripeResponseModel>>> createStripePaymentMethod({required StripeRequestModel stripeRequestModel}) async{
    ApiResponse<StripeResponseModel> result;
    try {

      result = await _createPaymentStripeApiImp.createPaymentStripe(
        stripeRequestModel: stripeRequestModel,
      );
      if (result.status == Status.completed) {
        return Right(result);
      } else {
        return Left(result);
      }
    } catch (error) {
      return Left(error);
    }
  }



  // This function to manage the recurrent payment on stripe payment method
  @override
  Future<Either<dynamic, ApiResponse<bool>>> createRecurrentStripePaymentMethod({required StripeRequestRecurrentModel stripeRequestRecurrentModel}) async {
    ApiResponse<bool> result;
    try {
      result = await _createRecurrentPaymentStripeApiImp.createRecurrentPaymentStripe(
        stripeRecurrentModel: stripeRequestRecurrentModel,
      );
      if (result.status == Status.completed) {
        return Right(result);
      } else {
        return Left(result);
      }
    } catch (error) {
      return Left(error);
    }
  }


}
