import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/core/api_handler/response_handler.dart';
import 'package:faciltateur_de_vies/core/utility/utility.dart';
import 'package:faciltateur_de_vies/screens/payment_method_module/data/models/stripe_recurrent_model.dart';
import 'package:faciltateur_de_vies/screens/payment_method_module/data/models/stripe_response_model.dart';
import 'package:faciltateur_de_vies/screens/payment_method_module/data/models/stripe_request_model.dart';
import 'package:faciltateur_de_vies/screens/payment_method_module/domain/usecase/confirm_stripe_method_usecase.dart';
import 'package:faciltateur_de_vies/screens/payment_method_module/domain/usecase/create_recurrent_stripe_method_usecase.dart';
import 'package:faciltateur_de_vies/screens/payment_method_module/domain/usecase/create_stripe_method_usecase.dart';
import 'package:faciltateur_de_vies/screens/payment_method_module/presentaion/widgets/utility.messages.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import '../../../../core/base_provider/base_provider.dart';


// This is class to handle the payment logic
class PaymentMethodProvider extends BaseProvider {
  final ConfirmStripeUseCase _confirmStripeUseCase;
  final CreateStripeUseCase _createStripeUseCase;
  final CreateRecurrentStripeUseCase _createRecurrentStripeUseCase;

  PaymentMethodProvider(this._confirmStripeUseCase,this._createStripeUseCase,this._createRecurrentStripeUseCase);

  // confirm stripe model
  StripeResponseModel? stripeConfirmResponseModel;
  // create stripe model
  StripeResponseModel? stripeCreateResponseModel;

  // create recurrent stripe model
  StripeRequestRecurrentModel? stripeRequestRecurrentModel;

  // success attribute
  bool success = false;

  confirmStripe({required String paymentIntentId}) async {
    setLoading = true;
    updateUi();
    var confirmStripeResult = await _confirmStripeUseCase(ConfirmStripeUseCaseParams(paymentIntentId: paymentIntentId));
    return confirmStripeResult.fold((error) {
      setError = true;
      setLoading = false;
      Utility.showToast(message: error.message);
      updateUi();
    }, (response) {
      setLoading = false;
      stripeConfirmResponseModel = response.data;
      // updateUi();
      return stripeConfirmResponseModel;
    });
  }

  createStripe({required StripeRequestModel stripeRequestModel}) async {
    setLoading = true;
    updateUi();
    var createStripeResult = await _createStripeUseCase(CreateStripeUseCaseParams(stripeRequestModel: stripeRequestModel));
    return createStripeResult.fold((error) {
      setError = true;
      setLoading = false;
      Utility.showToast(message: error.message);
      updateUi();
    }, (response) {
      setLoading = false;
      stripeCreateResponseModel = response.data;
      // updateUi();
      return stripeCreateResponseModel;
    });
  }


  /// This function to check the payment flow we have two main Steps :
  /// 1 - check if client Secret is not null && requires Action false => The payment is passed
  /// 2 - check if client Secret is not null && requires Action true => The payment is need to confirm again
  /// 3 - in case two we need to call confirmation endpoint and check the result of this endpoint again

  triggerOneTimePayment({required StripeRequestModel stripeRequestModel,required BillingDetails billingDetails}) async {
    success = false;
    try {

      ///  Create payment method
      final paymentMethod = await Stripe.instance.createPaymentMethod(
          params: PaymentMethodParams.card(
            paymentMethodData: PaymentMethodData(
              billingDetails: billingDetails,
            ),
          ));

      // set Payment Method id to the object to complete all info of object
      stripeRequestModel.paymentMethod = paymentMethod.id;
      

      final Either<dynamic, ApiResponse<StripeResponseModel>> createStripeResult = await _createStripeUseCase(CreateStripeUseCaseParams(stripeRequestModel: stripeRequestModel));

      // check if the value is correct or return error [isRight]
      if (createStripeResult.isRight()) {
        // get the value of creating the stripe otherwise return null value
        ApiResponse<StripeResponseModel> response = createStripeResult.getOrElse(() => ApiResponse.completed(null));
        // assignee [ null or the object model ]
        stripeCreateResponseModel = response.data;
        // check if the response null return error and end the process

        if (stripeCreateResponseModel == null) {
          // Error during creating or confirming Intent
          PaymentUtility.errorMessage();
          _restAllVariables();
          updateUi();
          return success=false;
        }
        // if not need to confirmation and payment is passed show success message
       else if (stripeCreateResponseModel!.clientSecret != null && stripeCreateResponseModel!.requiresAction == false) {

              final paymentIntent = await Stripe.instance.handleNextAction(stripeCreateResponseModel!.clientSecret!);

              if (paymentIntent.status == PaymentIntentsStatus.RequiresConfirmation) {
                // complete confirmation
               return await _confirmPaymentIfNeeded(paymentIntent);

              } else {
                PaymentUtility.errorMessage();
                _restAllVariables();
                updateUi();
                return success=false;
              }
        }
        // if  need to confirmation call another endpoint and wait until the payment is passed show success message otherwise error message
       else if (stripeCreateResponseModel!.clientSecret != null && stripeCreateResponseModel!.requiresAction == true) {
          // 4. if payment requires action calling handleNextAction
          final paymentIntent = await Stripe.instance.handleNextAction(stripeCreateResponseModel!.clientSecret!);
          if (paymentIntent.status == PaymentIntentsStatus.RequiresConfirmation) {
            // complete confirmation
            await _confirmPaymentIfNeeded(paymentIntent);
          } else {
            PaymentUtility.errorMessage();
            _restAllVariables();
            updateUi();
            return success=false;
          }
        }
      }
      // Show Error message to user
      else {
        PaymentUtility.errorMessage();
        _restAllVariables();
        updateUi();
        return success=false;
      }
    }catch(error){
      PaymentUtility.errorMessage();
      _restAllVariables();
      updateUi();
      return success=false;
    }
  }
  // confirm payment logic
  _confirmPaymentIfNeeded(paymentIntent) async {
    //  Call API to confirm intent
    final Either<dynamic, ApiResponse<StripeResponseModel>> confirmStripeResult = await _confirmStripeUseCase(ConfirmStripeUseCaseParams(paymentIntentId: paymentIntent.id));

    if (confirmStripeResult.isRight()) {
      // get the value of confirm the stripe otherwise return null value
      ApiResponse<StripeResponseModel> response = confirmStripeResult.getOrElse(() => ApiResponse.completed(null));
      // assignee [ null or the object model ]
      stripeConfirmResponseModel = response.data;
      // check if the response return null show error message otherwise show success message
      if (stripeConfirmResponseModel == null) {
        // Error during creating or confirming Intent
        PaymentUtility.errorMessage();
        _restAllVariables();
        updateUi();
        return success=false;
      }
      else {
        PaymentUtility.successMessage();
        _restAllVariables();
        updateUi();
        return success=true;
      }
    } else {
      PaymentUtility.successMessage();
      _restAllVariables();
      updateUi();
      return success=true;
    }

  }


  _restAllVariables(){
    // confirm stripe model
     stripeConfirmResponseModel = null;
    // create stripe model
     stripeCreateResponseModel  = null;
  }



  // create function to management the long term of subscription in recurrent order

 triggerRecurrentPayment({required StripeRequestRecurrentModel stripeRequestRecurrentModel,required BillingDetails billingDetails}) async {
   success = false;
   setLoading = true;
   updateUi();
    ///  Create payment method
    final paymentMethod = await Stripe.instance.createPaymentMethod(
        params: PaymentMethodParams.card(
          paymentMethodData: PaymentMethodData(
            billingDetails: billingDetails,
          ),
        ));

    // set Payment Method id to the object to complete all info of object
    stripeRequestRecurrentModel.paymentMethod = paymentMethod.id;
    stripeRequestRecurrentModel.email = billingDetails.email;
    var recurrentStripeResult = await _createRecurrentStripeUseCase(CreateRecurrentStripeUseCaseParams(stripeRequestRecurrentModel: stripeRequestRecurrentModel));

    return recurrentStripeResult.fold((error) {
      PaymentUtility.errorMessage();
      _restAllVariables();
      updateUi();
      return success=false;

    }, (response) {
      PaymentUtility.successMessage();
      _restAllVariables();
      updateUi();
      return success=true;
    });


  }

}
