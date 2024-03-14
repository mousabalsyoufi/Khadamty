import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/core/api_handler/error_message.dart';
import 'package:faciltateur_de_vies/core/api_handler/response_handler.dart';
import 'package:faciltateur_de_vies/screens/easer_service_details_screen/data/data_source/service_details_provider/easer_service_details_api_imp.dart';
import 'package:faciltateur_de_vies/screens/easer_service_details_screen/data/repository/easer_service_details_repository_imp.dart';
import 'package:faciltateur_de_vies/shared_models/address_model.dart';
import 'package:faciltateur_de_vies/shared_models/service_reservation_details_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockEaserServiceDetailsApiImp extends Mock
    implements EaserServiceDetailsApiImp {}

void main() {
  late MockEaserServiceDetailsApiImp? mockEaserServiceDetailsApiImp;
  late EaserServiceDetailsRepositoryImp? easerServiceDetailsRepositoryImp;

  setUp(() {
    mockEaserServiceDetailsApiImp = MockEaserServiceDetailsApiImp();
    easerServiceDetailsRepositoryImp = EaserServiceDetailsRepositoryImp(
        easerServiceDetailsApiImp: mockEaserServiceDetailsApiImp!);
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
    "get service details should return success service details model",
    () async {
      // Arrange
      when(() => mockEaserServiceDetailsApiImp!.getServiceDetails(id: tOrderId))
          .thenAnswer((_) async => tresult);
      // Act
      final result = await easerServiceDetailsRepositoryImp!
          .getServiceDetails(id: tOrderId);
      // Assert
      expect(result, Right(tresult));
      verify(
          () => mockEaserServiceDetailsApiImp!.getServiceDetails(id: tOrderId));
      verifyNoMoreInteractions(mockEaserServiceDetailsApiImp);
    },
  );
  test(
    "get service details should return error form get service details api",
    () async {
      // Arrange
      when(() => mockEaserServiceDetailsApiImp!.getServiceDetails(id: tOrderId))
          .thenAnswer((_) async => tErrorResponse);
      // Act
      final result = await easerServiceDetailsRepositoryImp!
          .getServiceDetails(id: tOrderId);
      // Assert
      expect(result, Left(tErrorResponse));
      verify(
          () => mockEaserServiceDetailsApiImp!.getServiceDetails(id: tOrderId));
      verifyNoMoreInteractions(mockEaserServiceDetailsApiImp);
    },
  );
}
