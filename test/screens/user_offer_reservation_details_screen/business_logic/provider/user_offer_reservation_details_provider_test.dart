import 'package:faciltateur_de_vies/screens/user_offer_reservation_details_screen/business_logic/user_offer_reservation_details_provider.dart';
import 'package:faciltateur_de_vies/screens/user_offer_reservation_details_screen/domain/usecase/get_offer_reservation_details_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGetOfferReservationDetailsUseCase extends Mock
    implements GetOfferReservationDetailsUseCase {}

void main() async {
  late MockGetOfferReservationDetailsUseCase?
      mockGetOfferReservationDetailsUseCase;
  late UserOfferReservationDetailsProvider?
      userOfferReservationDetailsProvider;
  setUp(() {
    mockGetOfferReservationDetailsUseCase =
        MockGetOfferReservationDetailsUseCase();
    userOfferReservationDetailsProvider =
        UserOfferReservationDetailsProvider(
            mockGetOfferReservationDetailsUseCase!);
  });

  group(
      'test get user upcoming offer details functionality in provider',
      () {
    test(
      "initial values of provider should be correct",
      () async {
        // Assert
        expect(userOfferReservationDetailsProvider!.isLoading, false);
        expect(userOfferReservationDetailsProvider!.isError, false);
      },
    );
  });
}
