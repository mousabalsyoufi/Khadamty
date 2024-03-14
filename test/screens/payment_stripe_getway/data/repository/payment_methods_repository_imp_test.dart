import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/core/api_handler/error_message.dart';
import 'package:faciltateur_de_vies/core/api_handler/response_handler.dart';
import 'package:faciltateur_de_vies/screens/payment_method_module/data/data_source/confirm_payment_stripe/confrim_payment_stripe_api_imp.dart';
import 'package:faciltateur_de_vies/screens/payment_method_module/data/data_source/create_payment_stripe/create_payment_stripe_api_imp.dart';
import 'package:faciltateur_de_vies/screens/payment_method_module/data/data_source/create_recurrent_payment_stripe/create_recurrent_payment_stripe_api_imp.dart';
import 'package:faciltateur_de_vies/screens/payment_method_module/data/models/stripe_recurrent_model.dart';
import 'package:faciltateur_de_vies/screens/payment_method_module/data/models/stripe_response_model.dart';
import 'package:faciltateur_de_vies/screens/payment_method_module/data/models/stripe_request_model.dart';
import 'package:faciltateur_de_vies/screens/payment_method_module/data/repository/payment_repository_imp.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockConfirmPaymentStripeApiImp extends Mock implements ConfirmPaymentStripeApiImp {}
class MockCreatePaymentStripeApiImp extends Mock implements CreatePaymentStripeApiImp {}
class MockCreateRecurrentPaymentStripeApiImp extends Mock implements CreateRecurrentPaymentStripeApiImp {}

void main() {
  late MockConfirmPaymentStripeApiImp? mockConfirmPaymentStripeApiImp;
  late MockCreatePaymentStripeApiImp? mockCreatePaymentStripeApiImp;
  late MockCreateRecurrentPaymentStripeApiImp? mockCreateRecurrentPaymentStripeApiImp;

  late PaymentMethodRepositoryImp? paymentMethodRepositoryImp;

  setUp(() {
    mockConfirmPaymentStripeApiImp = MockConfirmPaymentStripeApiImp();
    mockCreatePaymentStripeApiImp  = MockCreatePaymentStripeApiImp();
    mockCreateRecurrentPaymentStripeApiImp = MockCreateRecurrentPaymentStripeApiImp();
    paymentMethodRepositoryImp = PaymentMethodRepositoryImp(mockCreatePaymentStripeApiImp!,mockConfirmPaymentStripeApiImp!,mockCreateRecurrentPaymentStripeApiImp!);
  });


  final StripeRequestModel tStripeModel =StripeRequestModel(
    useStripeSdk: true,
    paymentMethod: 't_sddsferwer_sdff',
    currency: 'USD',
    amount: 1
  );

  StripeResponseModel tStripeResponseModel = StripeResponseModel(
    message: "The Payment transaction is passed",
    requiresAction: false,
    status:"true",
    clientSecret: "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
  );

  final tStripeResponse= ApiResponse.completed(tStripeResponseModel);

  const tpaymentIntentId = '21321321321';

  final ApiResponse<StripeResponseModel> tErrorResponse = ApiResponse.error(ErrorMessages.dioDefault);


  // create stripe recurrent model

  final StripeRequestRecurrentModel tRStripeModel =StripeRequestRecurrentModel(
      paymentMethod: "",
      cancelAt:213232132132,
      intervalCount: 2,
      price: 123,
      email: "emad1.2@hotmail.com"
  );


  final tRStripeResponse= ApiResponse.completed(true);
  final ApiResponse<bool> tRErrorResponse = ApiResponse.error(ErrorMessages.dioDefault);


  test(
    "Stripe create  should return stripe res Model response model",
        () async {
      // Arrange
      when(() =>
          mockCreatePaymentStripeApiImp!.createPaymentStripe(stripeRequestModel: tStripeModel))
              .thenAnswer((_) async => tStripeResponse);

      // Act
      final result = await paymentMethodRepositoryImp!
          .createStripePaymentMethod(stripeRequestModel: tStripeModel);
      // Assert
      expect(result, Right(tStripeResponse));
      verify(() =>
          mockCreatePaymentStripeApiImp!.createPaymentStripe(stripeRequestModel: tStripeModel));
      verifyNoMoreInteractions(mockCreatePaymentStripeApiImp);
    },
  );
  test(
    "stripe should return error form stripe api",
        () async {
      // Arrange
      when(() =>
          mockCreatePaymentStripeApiImp!.createPaymentStripe(stripeRequestModel: tStripeModel))
          .thenAnswer((_) async => tErrorResponse);
      // Act
      final result = await paymentMethodRepositoryImp!
          .createStripePaymentMethod(stripeRequestModel: tStripeModel);
      // Assert
      expect(result, Left(tErrorResponse));
      verify(() =>
          paymentMethodRepositoryImp!.createStripePaymentMethod(stripeRequestModel: tStripeModel));
      verifyNoMoreInteractions(mockCreatePaymentStripeApiImp);
    },
  );





  test(
    "Stripe Confirm  should return stripe res Model response model",
        () async {
      // Arrange
      when(() =>
          mockConfirmPaymentStripeApiImp!.confirmPaymentStripe(paymentIntentId: tpaymentIntentId))
          .thenAnswer((_) async => tStripeResponse);

      // Act
      final result = await paymentMethodRepositoryImp!
          .confirmStripePaymentMethod(paymentIntentId: tpaymentIntentId);
      // Assert
      expect(result, Right(tStripeResponse));
      verify(() =>
          mockConfirmPaymentStripeApiImp!.confirmPaymentStripe(paymentIntentId: tpaymentIntentId));
      verifyNoMoreInteractions(mockConfirmPaymentStripeApiImp);
    },
  );
  test(
    "stripe confirm should return error form stripe api",
        () async {
      // Arrange
      when(() =>
          mockConfirmPaymentStripeApiImp!.confirmPaymentStripe(paymentIntentId: tpaymentIntentId))
          .thenAnswer((_) async => tErrorResponse);
      // Act
      final result = await paymentMethodRepositoryImp!
          .confirmStripePaymentMethod(paymentIntentId: tpaymentIntentId);
      // Assert
      expect(result, Left(tErrorResponse));
      verify(() =>
          paymentMethodRepositoryImp!.confirmStripePaymentMethod(paymentIntentId: tpaymentIntentId));
      verifyNoMoreInteractions(mockConfirmPaymentStripeApiImp);
    },
  );



  // This test case for create recurrent stripe request model
  test(
    "This test case should be return model from Create Recurrent Stripe model",
        () async {
      // Arrange
      when(() =>
          mockCreateRecurrentPaymentStripeApiImp!.createRecurrentPaymentStripe(stripeRecurrentModel: tRStripeModel))
          .thenAnswer((_) async => tRStripeResponse);

      // Act
      final result = await paymentMethodRepositoryImp!
          .createRecurrentStripePaymentMethod(stripeRequestRecurrentModel: tRStripeModel);
      // Assert
      expect(result, Right(tRStripeResponse));
      verify(() =>
          mockCreateRecurrentPaymentStripeApiImp!.createRecurrentPaymentStripe(stripeRecurrentModel: tRStripeModel));
      verifyNoMoreInteractions(mockCreateRecurrentPaymentStripeApiImp);
    },
  );
  test(
    "This test case should be return error form stripe api",
        () async {
      // Arrange
      when(() =>
          mockCreateRecurrentPaymentStripeApiImp!.createRecurrentPaymentStripe(stripeRecurrentModel: tRStripeModel))
          .thenAnswer((_) async => tRErrorResponse);
      // Act
      final result = await paymentMethodRepositoryImp!
          .createRecurrentStripePaymentMethod(stripeRequestRecurrentModel: tRStripeModel);
      // Assert
      expect(result, Left(tRErrorResponse));
      verify(() =>
          paymentMethodRepositoryImp!.createRecurrentStripePaymentMethod(stripeRequestRecurrentModel: tRStripeModel));
      verifyNoMoreInteractions(mockCreateRecurrentPaymentStripeApiImp);
    },
  );
}
