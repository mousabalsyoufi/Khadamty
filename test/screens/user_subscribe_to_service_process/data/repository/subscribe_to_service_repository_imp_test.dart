import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/core/api_handler/error_message.dart';
import 'package:faciltateur_de_vies/core/api_handler/response_handler.dart';
import 'package:faciltateur_de_vies/screens/user_subscribe_to_service_process/data/data_source/save_service_provider/save_service_api_imp.dart';
import 'package:faciltateur_de_vies/screens/user_subscribe_to_service_process/data/data_source/subscribe_to_service_provider/subscribe_to_service_api_imp.dart';
import 'package:faciltateur_de_vies/screens/user_subscribe_to_service_process/data/data_source/subscribe_with_subscription_provider/subscribe_with_subscription_api_imp.dart';
import 'package:faciltateur_de_vies/screens/user_subscribe_to_service_process/data/model/service_subscribe_request_model.dart';
import 'package:faciltateur_de_vies/screens/user_subscribe_to_service_process/data/repository/subscribe_to_service_repository_imp.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockSubsribeToServiceApiImp extends Mock
    implements SubscribeToServiceApiImp {}

class MockSubsribeWithSubscriptionApiImp extends Mock
    implements SubscribeWithSubscriptionApiImp {}

class MockSaveServiceApiImp extends Mock implements SaveServiceApiImp {}

void main() {
  late MockSubsribeToServiceApiImp? mockSubsribeToServiceApiImp;
  late MockSubsribeWithSubscriptionApiImp? mockSubsribeWithSubscriptionApiImp;
  late MockSaveServiceApiImp? mockSaveServiceApiImp;
  late SubscribeToServiceRepositoryImp? subscribeToServiceRepositoryImp;

  setUp(() {
    mockSubsribeToServiceApiImp = MockSubsribeToServiceApiImp();
    mockSubsribeWithSubscriptionApiImp = MockSubsribeWithSubscriptionApiImp();
    mockSaveServiceApiImp = MockSaveServiceApiImp();
    subscribeToServiceRepositoryImp = SubscribeToServiceRepositoryImp(
        mockSubsribeToServiceApiImp!,
        mockSaveServiceApiImp!,
        mockSubsribeWithSubscriptionApiImp!);
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

  final tresult = ApiResponse.completed(tSubscribeToServiceResponse);
  final ApiResponse<int> tErrorResponse =
      ApiResponse.error(ErrorMessages.dioDefault);

  test(
    "subscribe to service should return success order id",
    () async {
      // Arrange
      when(() => mockSubsribeToServiceApiImp!.subscribeToService(
          subscribeModel: tSubscribeModel)).thenAnswer((_) async => tresult);
      // Act
      final result = await subscribeToServiceRepositoryImp!
          .subscribeToService(subscribeModel: tSubscribeModel);
      // Assert
      expect(result, Right(tresult));
      verify(() => mockSubsribeToServiceApiImp!
          .subscribeToService(subscribeModel: tSubscribeModel));
      verifyNoMoreInteractions(mockSubsribeToServiceApiImp);
    },
  );
  test(
    "subscribe to service should return error form subscribe to service api",
    () async {
      // Arrange
      when(() => mockSubsribeToServiceApiImp!
              .subscribeToService(subscribeModel: tSubscribeModel))
          .thenAnswer((_) async => tErrorResponse);
      // Act
      final result = await subscribeToServiceRepositoryImp!
          .subscribeToService(subscribeModel: tSubscribeModel);
      // Assert
      expect(result, Left(tErrorResponse));
      verify(() => mockSubsribeToServiceApiImp!
          .subscribeToService(subscribeModel: tSubscribeModel));
      verifyNoMoreInteractions(mockSubsribeToServiceApiImp);
    },
  );
}
