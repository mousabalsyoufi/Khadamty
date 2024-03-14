import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/core/api_handler/error_message.dart';
import 'package:faciltateur_de_vies/core/api_handler/response_handler.dart';
import 'package:faciltateur_de_vies/screens/user_subscribe_to_service_process/data/model/service_subscribe_request_model.dart';
import 'package:faciltateur_de_vies/screens/user_subscribe_to_service_process/data/repository/subscribe_to_service_repository_imp.dart';
import 'package:faciltateur_de_vies/screens/user_subscribe_to_service_process/domain/usecase/subscribe_to_service_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockUserSubsribeToServiceRepositoryImp extends Mock
    implements SubscribeToServiceRepositoryImp {}

void main() {
  late MockUserSubsribeToServiceRepositoryImp?
      mockUserSubsribeToServiceRepositoryImp;
  late SubscribeToServiceUseCase? subscribeToServiceUseCase;

  setUp(() {
    mockUserSubsribeToServiceRepositoryImp =
        MockUserSubsribeToServiceRepositoryImp();
    subscribeToServiceUseCase =
        SubscribeToServiceUseCase(mockUserSubsribeToServiceRepositoryImp);
  });

  final ServiceSubscribeRequestModel tSubscribeModel =
      ServiceSubscribeRequestModel(
          socid: 'socid',
          date: 'date',
          type: 0,
          instructions: 'instructions',
          contactId: '1',
          extraInfoForPayment: PaymentInfo(
              datepaye: 0,
              closepaidinvoices: 'closepaidinvoices',
              accountid: 'accountid',
              paymentid: 'paymentid',
              numPayment: 'numPayment',
              comment: 'comment'),
          lines: []);
  const tSubscribeToServiceResponse = 1;

  // response contains order id
  final tSubscribeResponse = ApiResponse.completed(tSubscribeToServiceResponse);
  final ApiResponse<int> tErrorResponse =
      ApiResponse.error(ErrorMessages.dioDefault);

  test(
    "should return order id response when calling subscribe to service",
    () async {
      // Arrange
      when(
        () => mockUserSubsribeToServiceRepositoryImp!
            .subscribeToService(subscribeModel: tSubscribeModel),
      ).thenAnswer((invocation) async => Right(tSubscribeResponse));
      // Act
      final result = await subscribeToServiceUseCase!(
          SubscribeToServiceUseCaseParams(
              subscribeRequestModel: tSubscribeModel));
      // Assert
      expect(result, Right(tSubscribeResponse));
      verify(
        () => mockUserSubsribeToServiceRepositoryImp!
            .subscribeToService(subscribeModel: tSubscribeModel),
      );
      verifyNoMoreInteractions(mockUserSubsribeToServiceRepositoryImp);
    },
  );
  test(
    "should return error calling subscribe to service uscase",
    () async {
      // Arrange
      when(
        () => mockUserSubsribeToServiceRepositoryImp!
            .subscribeToService(subscribeModel: tSubscribeModel),
      ).thenAnswer((invocation) async => Left(tErrorResponse));
      // Act
      final result = await subscribeToServiceUseCase!(
          SubscribeToServiceUseCaseParams(
              subscribeRequestModel: tSubscribeModel));
      // Assert
      expect(result, Left(tErrorResponse));
      verify(
        () => mockUserSubsribeToServiceRepositoryImp!
            .subscribeToService(subscribeModel: tSubscribeModel),
      );
      verifyNoMoreInteractions(mockUserSubsribeToServiceRepositoryImp);
    },
  );
}
