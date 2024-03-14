import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/core/api_handler/error_message.dart';
import 'package:faciltateur_de_vies/core/api_handler/response_handler.dart';
import 'package:faciltateur_de_vies/screens/easer_service_history_details_screen/data/data_source/service_history_details_provider/easer_service_history_details_api_imp.dart';
import 'package:faciltateur_de_vies/screens/easer_service_history_details_screen/data/repository/easer_service_history_details_repository_imp.dart';
import 'package:faciltateur_de_vies/shared_models/address_model.dart';
import 'package:faciltateur_de_vies/shared_models/service_reservation_details_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockEaserServiceHistoryDetailsApiImp extends Mock
    implements EaserServiceHistoryDetailsApiImp {}

void main() {
  late MockEaserServiceHistoryDetailsApiImp?
      mockEaserServiceHistoryDetailsApiImp;
  late EaserServiceHistoryDetailsRepositoryImp?
      easerServiceHistoryDetailsRepositoryImp;

  setUp(() {
    mockEaserServiceHistoryDetailsApiImp =
        MockEaserServiceHistoryDetailsApiImp();
    easerServiceHistoryDetailsRepositoryImp =
        EaserServiceHistoryDetailsRepositoryImp(
            easerServiceHistoryDetailsApiImp:
                mockEaserServiceHistoryDetailsApiImp!);
  });

  const tOrderId = '1';
  final tserviceDetailsResponse = ServiceReservationDetailsModel(
      date: 1,
      totalHt: 'totalHt',
      totalTva: 'totalTva',
      totalLocaltax1: 'totalLocaltax1',
      totalLocaltax2: 'totalLocaltax2',
      totalTtc: 'totalTtc',
      multicurrencyCode: 'multicurrencyCode',
      multicurrencyTx: 'multicurrencyTx',
      multicurrencyTotalHt: 'multicurrencyTotalHt',
      multicurrencyTotalTva: 'multicurrencyTotalTva',
      multicurrencyTotalTtc: 'multicurrencyTotalTtc',
      instructions: 'instructions',
      contact: AddressModel(
          id: '1',
          email: 'test@test.com',
          lastname: 'mohammad',
          address: 'paris',
          zip: '35500',
          town: 'montiplieer',
          arrayOptions:
              ArrayOptions(surface: '100', lat: '20.0000', long: '20.0000')),
      lines: []);

  final tresult = ApiResponse.completed(tserviceDetailsResponse);
  final ApiResponse<ServiceReservationDetailsModel> tErrorResponse =
      ApiResponse.error(ErrorMessages.dioDefault);

  test(
    "get service details should return success service history details model",
    () async {
      // Arrange
      when(() => mockEaserServiceHistoryDetailsApiImp!.getServiceHistoryDetails(
          id: tOrderId)).thenAnswer((_) async => tresult);
      // Act
      final result = await easerServiceHistoryDetailsRepositoryImp!
          .getServiceHistoryDetails(id: tOrderId);
      // Assert
      expect(result, Right(tresult));
      verify(() => mockEaserServiceHistoryDetailsApiImp!
          .getServiceHistoryDetails(id: tOrderId));
      verifyNoMoreInteractions(mockEaserServiceHistoryDetailsApiImp);
    },
  );
  test(
    "get service history details should return error form get service history details api",
    () async {
      // Arrange
      when(() => mockEaserServiceHistoryDetailsApiImp!.getServiceHistoryDetails(
          id: tOrderId)).thenAnswer((_) async => tErrorResponse);
      // Act
      final result = await easerServiceHistoryDetailsRepositoryImp!
          .getServiceHistoryDetails(id: tOrderId);
      // Assert
      expect(result, Left(tErrorResponse));
      verify(() => mockEaserServiceHistoryDetailsApiImp!
          .getServiceHistoryDetails(id: tOrderId));
      verifyNoMoreInteractions(mockEaserServiceHistoryDetailsApiImp);
    },
  );
}
