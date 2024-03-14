import 'package:faciltateur_de_vies/screens/shared_offer_details_screen/business_logic/shared_offer_details_provider/shared_offer_details_provider.dart';
import 'package:faciltateur_de_vies/screens/shared_offer_details_screen/domain/usecase/get_offer_details_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGetOfferDetailsUseCase extends Mock
    implements GetOfferDetailsUseCase {}

void main() async {
  late MockGetOfferDetailsUseCase? mockGetOfferDetailsUseCase;
  late SharedOfferDetailsProvider? sharedOfferDetailsProvider;
  setUp(() {
    mockGetOfferDetailsUseCase = MockGetOfferDetailsUseCase();
    sharedOfferDetailsProvider =
        SharedOfferDetailsProvider(mockGetOfferDetailsUseCase!);
  });

  group('test get offer details functionality in provider', () {
    test(
      "initial values of provider should be correct",
      () async {
        // Assert
        expect(sharedOfferDetailsProvider!.isLoading, false);
        expect(sharedOfferDetailsProvider!.isError, false);
      },
    );
  });
}
