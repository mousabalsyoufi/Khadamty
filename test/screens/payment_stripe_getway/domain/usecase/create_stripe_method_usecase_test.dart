import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/core/api_handler/error_message.dart';
import 'package:faciltateur_de_vies/core/api_handler/response_handler.dart';
import 'package:faciltateur_de_vies/screens/payment_method_module/data/models/stripe_response_model.dart';
import 'package:faciltateur_de_vies/screens/payment_method_module/data/models/stripe_request_model.dart';
import 'package:faciltateur_de_vies/screens/payment_method_module/data/repository/payment_repository_imp.dart';
import 'package:faciltateur_de_vies/screens/payment_method_module/domain/usecase/create_stripe_method_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockPaymentMethodRepositoryImp extends Mock implements PaymentMethodRepositoryImp {}

void main() {
  late MockPaymentMethodRepositoryImp? mockPaymentMethodRepositoryImp;
  late CreateStripeUseCase? createStripeUseCase;

  setUp(() {
    mockPaymentMethodRepositoryImp = MockPaymentMethodRepositoryImp();
    createStripeUseCase = CreateStripeUseCase(mockPaymentMethodRepositoryImp);
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


  final ApiResponse<StripeResponseModel> tErrorResponse = ApiResponse.error(ErrorMessages.dioDefault);
  test(
    "should return Stripe model response when calling create stripe",
        () async {
      // Arrange
      when(
            () => mockPaymentMethodRepositoryImp!
            .createStripePaymentMethod(stripeRequestModel: tStripeModel ),
      ).thenAnswer((invocation) async => Right(tStripeResponse));
      // Act
      final result = await createStripeUseCase!(
          CreateStripeUseCaseParams(stripeRequestModel: tStripeModel));
      // Assert
      expect(result, Right(tStripeResponse));
      verify(
            () => mockPaymentMethodRepositoryImp!
            .createStripePaymentMethod(stripeRequestModel: tStripeModel),
      );
      verifyNoMoreInteractions(mockPaymentMethodRepositoryImp);
    },
  );
  test(
    "should return error calling create stripe",
        () async {
      // Arrange
      when(
            () => mockPaymentMethodRepositoryImp!
            .createStripePaymentMethod(stripeRequestModel: tStripeModel),
      ).thenAnswer((invocation) async => Left(tErrorResponse));
      // Act
      final result = await createStripeUseCase!(
          CreateStripeUseCaseParams(stripeRequestModel: tStripeModel));
      // Assert
      expect(result, Left(tErrorResponse));
      verify(
            () => mockPaymentMethodRepositoryImp!
            .createStripePaymentMethod(stripeRequestModel: tStripeModel),
      );
      verifyNoMoreInteractions(mockPaymentMethodRepositoryImp);
    },
  );
}
