import 'package:faciltateur_de_vies/screens/user_addresses_screen/business_logic/provider/user_addresses_provider.dart';
import 'package:faciltateur_de_vies/screens/user_addresses_screen/domain/usecase/delete_address_usecase.dart';
import 'package:faciltateur_de_vies/screens/user_addresses_screen/domain/usecase/get_user_addresses_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGetUserAddressesUseCase extends Mock
    implements GetUserAddressesUseCase {}

class MockDeleteAddressUseCase extends Mock implements DeleteAddressUseCase {}

void main() async {
  late MockGetUserAddressesUseCase? mockGetUserAddressesUseCase;
  late MockDeleteAddressUseCase? mockDeleteAddressUseCase;
  late UserAddressesProvider? userAddressesProvider;
  setUp(() {
    mockGetUserAddressesUseCase = MockGetUserAddressesUseCase();
    mockDeleteAddressUseCase = MockDeleteAddressUseCase();
    userAddressesProvider = UserAddressesProvider(
        mockGetUserAddressesUseCase!, mockDeleteAddressUseCase!);
  });

  group('test get addresses functionality in provider', () {
    test(
      "initial values of provider should be correct",
      () async {
        // Assert
        expect(userAddressesProvider!.isLoading, false);
        expect(userAddressesProvider!.isError, false);
      },
    );
  });
}
