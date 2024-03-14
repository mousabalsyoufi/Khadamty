import 'package:faciltateur_de_vies/screens/guest_home_screen.dart/business_logic/provider/guest_home_provider.dart';
import 'package:faciltateur_de_vies/screens/guest_home_screen.dart/domain/usecase/get_guest_categories_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGetGuestCategoriesUseCase extends Mock
    implements GetGuestCategoriesUseCase {}

void main() async {
  late MockGetGuestCategoriesUseCase? mockGetGuestCategoriesUseCase;
  late GuestHomeProvider? guestHomeProvider;
  setUp(() {
    mockGetGuestCategoriesUseCase = MockGetGuestCategoriesUseCase();
    guestHomeProvider = GuestHomeProvider(mockGetGuestCategoriesUseCase!);
  });

  group('test get categories functionality in provider', () {
    test(
      "initial values of provider should be correct",
      () async {
        // Assert
        expect(guestHomeProvider!.isLoading, false);
        expect(guestHomeProvider!.isError, false);
      },
    );
  });
}
