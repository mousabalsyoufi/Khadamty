import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/core/api_handler/error_message.dart';
import 'package:faciltateur_de_vies/core/api_handler/response_handler.dart';
import 'package:faciltateur_de_vies/screens/user_upcoming_recurrent_service_details_screen/data/data_source/recurrent_service_reservation_details_provider/recurrent_service_reservation_details_api_imp.dart';
import 'package:faciltateur_de_vies/screens/user_upcoming_recurrent_service_details_screen/data/repoistory/user_upcoming_recurrent_service_details_repository_imp.dart';
import 'package:faciltateur_de_vies/shared_models/address_model.dart';
import 'package:faciltateur_de_vies/shared_models/service_reservation_details_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockRecurrentServiceReservationDetailsApiImp extends Mock
    implements RecurrentServiceReservationDetailsApiImp {}

void main() {
  late MockRecurrentServiceReservationDetailsApiImp?
      mockServiceReservationDetailsApiImp;
  late UserUpcomingRecurrentServiceDetailsRepositoryImp?
      userUpcomingRecurrentServiceDetailsRepositoryImp;

  setUp(() {
    mockServiceReservationDetailsApiImp =
        MockRecurrentServiceReservationDetailsApiImp();
    userUpcomingRecurrentServiceDetailsRepositoryImp =
        UserUpcomingRecurrentServiceDetailsRepositoryImp(
            serviceReservationDetailsApiImp:
                mockServiceReservationDetailsApiImp!);
  });

  const tOrderId = '1';
  final tServiceDetailsResponse = ServiceReservationDetailsModel(
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

  final tresult = ApiResponse.completed(tServiceDetailsResponse);
  final ApiResponse<ServiceReservationDetailsModel> tErrorResponse =
      ApiResponse.error(ErrorMessages.dioDefault);

  test(
    "get upcoming serevice details should return success service reservation details model",
    () async {
      // Arrange
      when(() => mockServiceReservationDetailsApiImp!
              .getServiceReservationDetails(id: tOrderId))
          .thenAnswer((_) async => tresult);
      // Act
      final result = await userUpcomingRecurrentServiceDetailsRepositoryImp!
          .getUpcomingServiceDetails(id: tOrderId);
      // Assert
      expect(result, Right(tresult));
      verify(() => mockServiceReservationDetailsApiImp!
          .getServiceReservationDetails(id: tOrderId));
      verifyNoMoreInteractions(mockServiceReservationDetailsApiImp);
    },
  );
  test(
    "get upcoming serevice details should return error form get upcoming serevice details api",
    () async {
      // Arrange
      when(() => mockServiceReservationDetailsApiImp!
              .getServiceReservationDetails(id: tOrderId))
          .thenAnswer((_) async => tErrorResponse);
      // Act
      final result = await userUpcomingRecurrentServiceDetailsRepositoryImp!
          .getUpcomingServiceDetails(id: tOrderId);
      // Assert
      expect(result, Left(tErrorResponse));
      verify(() => mockServiceReservationDetailsApiImp!
          .getServiceReservationDetails(id: tOrderId));
      verifyNoMoreInteractions(mockServiceReservationDetailsApiImp);
    },
  );
}
