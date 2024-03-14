import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/core/api_handler/error_message.dart';
import 'package:faciltateur_de_vies/core/api_handler/response_handler.dart';
import 'package:faciltateur_de_vies/screens/user_offer_reservation_details_screen/data/data_source/offer_reservation_details_provider/offer_reservation_details_api_imp.dart';
import 'package:faciltateur_de_vies/screens/user_offer_reservation_details_screen/data/repository/user_offer_reservation_details_repository_imp.dart';
import 'package:faciltateur_de_vies/shared_models/address_model.dart';
import 'package:faciltateur_de_vies/shared_models/service_reservation_details_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockOfferReservationDetailsApiImp extends Mock
    implements OfferReservationDetailsApiImp {}

void main() {
  late MockOfferReservationDetailsApiImp? mockOfferReservationDetailsApiImp;
  late UserOfferReservationDetailsRepositoryImp?
      userOfferReservationDetailsRepositoryImp;

  setUp(() {
    mockOfferReservationDetailsApiImp = MockOfferReservationDetailsApiImp();
    userOfferReservationDetailsRepositoryImp =
        UserOfferReservationDetailsRepositoryImp(
            offerReservationDetailsApiImp: mockOfferReservationDetailsApiImp!);
  });

  const tOrderId = '1';
  final tofferDetailsResponse = ServiceReservationDetailsModel(
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

  final tresult = ApiResponse.completed(tofferDetailsResponse);
  final ApiResponse<ServiceReservationDetailsModel> tErrorResponse =
      ApiResponse.error(ErrorMessages.dioDefault);

  test(
    "get upcoming offer details should return success offer reservation details model",
    () async {
      // Arrange
      when(() => mockOfferReservationDetailsApiImp!.getOfferReservationDetails(
          id: tOrderId)).thenAnswer((_) async => tresult);
      // Act
      final result = await userOfferReservationDetailsRepositoryImp!
          .getUpcomingOfferDetails(id: tOrderId);
      // Assert
      expect(result, Right(tresult));
      verify(() => mockOfferReservationDetailsApiImp!
          .getOfferReservationDetails(id: tOrderId));
      verifyNoMoreInteractions(mockOfferReservationDetailsApiImp);
    },
  );
  test(
    "get upcoming offer details should return error form get upcoming offer details api",
    () async {
      // Arrange
      when(() => mockOfferReservationDetailsApiImp!.getOfferReservationDetails(
          id: tOrderId)).thenAnswer((_) async => tErrorResponse);
      // Act
      final result = await userOfferReservationDetailsRepositoryImp!
          .getUpcomingOfferDetails(id: tOrderId);
      // Assert
      expect(result, Left(tErrorResponse));
      verify(() => mockOfferReservationDetailsApiImp!
          .getOfferReservationDetails(id: tOrderId));
      verifyNoMoreInteractions(mockOfferReservationDetailsApiImp);
    },
  );
}
