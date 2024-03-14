import 'package:faciltateur_de_vies/screens/user_add_address_screen/buainess_logic/provider/user_add_address_provider.dart';
import 'package:faciltateur_de_vies/screens/user_add_address_screen/domain/usecase/add_address_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAddAddressUseCase extends Mock implements AddAddressUseCase {}

void main() async {
  late MockAddAddressUseCase? mockAddAddressUseCase;
  late AddAddressProvider? addAddressProvider;
  setUp(() {
    mockAddAddressUseCase = MockAddAddressUseCase();
    addAddressProvider = AddAddressProvider(mockAddAddressUseCase!);
  });

  group('test add address functionality in provider', () {
    test(
      "initial values of provider should be correct",
      () async {
        // Assert
        expect(addAddressProvider!.isLoading, false);
        expect(addAddressProvider!.isError, false);
      },
    );
  });
}
