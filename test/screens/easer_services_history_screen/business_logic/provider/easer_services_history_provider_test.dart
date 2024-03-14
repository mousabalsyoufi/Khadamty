import 'package:faciltateur_de_vies/screens/easer_services_history_screen/business_logic/provider/easer_services_history_provider.dart';
import 'package:faciltateur_de_vies/screens/easer_services_history_screen/domain/usecase/get_easer_services_history_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGetEaserServicesHistoryUseCase extends Mock
    implements GetEaserServicesHistoryUseCase {}

void main() async {
  late MockGetEaserServicesHistoryUseCase? mockGetEaserServicesHistoryUseCase;
  late EaserServicesHistoryProvider? easerServicesHistoryProvider;
  setUp(() {
    mockGetEaserServicesHistoryUseCase = MockGetEaserServicesHistoryUseCase();
    easerServicesHistoryProvider =
        EaserServicesHistoryProvider(mockGetEaserServicesHistoryUseCase!);
  });

  group('test get easer services history functionality in provider', () {
    test(
      "initial values of provider should be correct",
      () async {
        // Assert
        expect(easerServicesHistoryProvider!.isLoading, false);
        expect(easerServicesHistoryProvider!.isError, false);
      },
    );
  });
}
