import 'package:faciltateur_de_vies/screens/easer_personal_data_screen/business_logic/provider/easer_personal_data_provider.dart';
import 'package:faciltateur_de_vies/screens/easer_personal_data_screen/domain/usecase/get_easer_account_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGetEaserAccountUseCase extends Mock
    implements GetEaserAccountUseCase {}

void main() async {
  late EaserPersonalDataProvider? easerPersonalDataProvider;
  late MockGetEaserAccountUseCase? mockGetEaserAccountUseCase;
  setUp(() {
    mockGetEaserAccountUseCase = MockGetEaserAccountUseCase();
    easerPersonalDataProvider = EaserPersonalDataProvider(
      mockGetEaserAccountUseCase!,
    );
  });

  group('test get easer account functionality in provider', () {
    test(
      "initial values of provider should be correct",
      () async {
        // Assert
        expect(easerPersonalDataProvider!.isLoading, false);
        expect(easerPersonalDataProvider!.isError, false);
      },
    );
  });
}
