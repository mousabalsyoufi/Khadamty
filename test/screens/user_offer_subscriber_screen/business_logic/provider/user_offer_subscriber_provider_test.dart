import 'package:faciltateur_de_vies/screens/user_offer_subscriber_screen/business_logic/provider/user_offer_subscriber_provider.dart';
import 'package:faciltateur_de_vies/screens/user_offer_subscriber_screen/domain/usecase/subscribe_to_offer_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockSubscribeToOfferUseCase extends Mock
    implements SubscribeToOfferUseCase {}

void main() async {
  late MockSubscribeToOfferUseCase? mockSubscribeToOfferUseCase;
  late UserOfferSubscriberProvider? userOfferSubscriberProvider;
  setUp(() {
    mockSubscribeToOfferUseCase = MockSubscribeToOfferUseCase();
    userOfferSubscriberProvider = UserOfferSubscriberProvider(mockSubscribeToOfferUseCase!);
  });

  group('test subscribe to offer functionality in provider', () {
    test(
      "initial values of provider should be correct",
      () async {
        // Assert
        expect(userOfferSubscriberProvider!.isLoading, false);
        expect(userOfferSubscriberProvider!.isError, false);
      },
    );
  });
}
