import 'package:faciltateur_de_vies/screens/easer_service_details_screen/business_logic/provider/easer_service_details_provider.dart';
import 'package:faciltateur_de_vies/screens/easer_service_details_screen/domain/usecase/get_easer_service_details_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGetEaserServiceDetailsUseCase extends Mock
    implements GetEaserServiceDetailsUseCase {}

void main() async {
  late MockGetEaserServiceDetailsUseCase? mockGetEaserServiceDetailsUseCase;
  late EaserServiceDetailsProvider? easerServiceDetailsProvider;
  setUp(() {
    mockGetEaserServiceDetailsUseCase = MockGetEaserServiceDetailsUseCase();
    easerServiceDetailsProvider =
        EaserServiceDetailsProvider(mockGetEaserServiceDetailsUseCase!);
  });

  group('test get easer service details functionality in provider', () {
    test(
      "initial values of provider should be correct",
      () async {
        // Assert
        expect(easerServiceDetailsProvider!.isLoading, false);
        expect(easerServiceDetailsProvider!.isError, false);
      },
    );
  });
}
