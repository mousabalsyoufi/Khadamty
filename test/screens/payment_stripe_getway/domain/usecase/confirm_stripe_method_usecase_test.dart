import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/core/api_handler/error_message.dart';
import 'package:faciltateur_de_vies/core/api_handler/response_handler.dart';
import 'package:faciltateur_de_vies/screens/payment_method_module/data/models/stripe_response_model.dart';
import 'package:faciltateur_de_vies/screens/payment_method_module/data/repository/payment_repository_imp.dart';
import 'package:faciltateur_de_vies/screens/payment_method_module/domain/usecase/confirm_stripe_method_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockPaymentMethodRepositoryImp extends Mock implements PaymentMethodRepositoryImp {}

void main() {
  late MockPaymentMethodRepositoryImp? mockPaymentMethodRepositoryImp;
  late ConfirmStripeUseCase? confirmStripeUseCase;

  setUp(() {
    mockPaymentMethodRepositoryImp = MockPaymentMethodRepositoryImp();
    confirmStripeUseCase = ConfirmStripeUseCase(mockPaymentMethodRepositoryImp);
  });


  StripeResponseModel tStripeResponseModel = StripeResponseModel(
      message: "The Payment transaction is passed",
      requiresAction: false,
      status:"true",
      clientSecret: "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
  );

  final tStripeResponse= ApiResponse.completed(tStripeResponseModel);

  const tPaymentIntentId = '21321321321';

  final ApiResponse<StripeResponseModel> tErrorResponse = ApiResponse.error(ErrorMessages.dioDefault);
  test(
    "should return Stripe model response when calling confirm stripe",
        () async {
      // Arrange
      when(
            () => mockPaymentMethodRepositoryImp!
            .confirmStripePaymentMethod(paymentIntentId:tPaymentIntentId ),
      ).thenAnswer((invocation) async => Right(tStripeResponse));
      // Act
      final result = await confirmStripeUseCase!(
          ConfirmStripeUseCaseParams(paymentIntentId: tPaymentIntentId));
      // Assert
      expect(result, Right(tStripeResponse));
      verify(
            () => mockPaymentMethodRepositoryImp!
            .confirmStripePaymentMethod(paymentIntentId: tPaymentIntentId),
      );
      verifyNoMoreInteractions(mockPaymentMethodRepositoryImp);
    },
  );
  test(
    "should return error calling confirm stripe",
        () async {
      // Arrange
      when(
            () => mockPaymentMethodRepositoryImp!
            .confirmStripePaymentMethod(paymentIntentId:tPaymentIntentId),
      ).thenAnswer((invocation) async => Left(tErrorResponse));
      // Act
      final result = await confirmStripeUseCase!(
          ConfirmStripeUseCaseParams(paymentIntentId: tPaymentIntentId));
      // Assert
      expect(result, Left(tErrorResponse));
      verify(
            () => mockPaymentMethodRepositoryImp!
            .confirmStripePaymentMethod(paymentIntentId: tPaymentIntentId),
      );
      verifyNoMoreInteractions(mockPaymentMethodRepositoryImp);
    },
  );
}
