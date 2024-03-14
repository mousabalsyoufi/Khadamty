import 'package:faciltateur_de_vies/screens/easer_home_screen/business_logic/provider/easer_home_provider.dart';
import 'package:faciltateur_de_vies/screens/easer_home_screen/domain/usecase/ger_easer_upcoming_services_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGetEaserUpcomingServicesUseCase extends Mock
    implements GetEaserUpcomingServicesUseCase {}

void main() async {
  late MockGetEaserUpcomingServicesUseCase? mockGetEaserUpcomingServicesUseCase;
  late EaserHomeProvider? easerHomeProvider;
  setUp(() {
    mockGetEaserUpcomingServicesUseCase = MockGetEaserUpcomingServicesUseCase();
    easerHomeProvider = EaserHomeProvider(mockGetEaserUpcomingServicesUseCase!);
  });

  group('test get easer upcoming services functionality in provider', () {
    test(
      "initial values of provider should be correct",
      () async {
        // Assert
        expect(easerHomeProvider!.isLoading, false);
        expect(easerHomeProvider!.isError, false);
      },
    );
  });
}
