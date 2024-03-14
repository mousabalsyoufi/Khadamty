import 'package:faciltateur_de_vies/screens/easer_service_history_details_screen/business_logic/provider/easer_service_history_details_provider.dart';
import 'package:faciltateur_de_vies/screens/easer_service_history_details_screen/domain/usecase/get_easer_service_history_details_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGetEaserServiceHistoryDetailsUseCase extends Mock
    implements GetEaserServiceHistoryDetailsUseCase {}

void main() async {
  late MockGetEaserServiceHistoryDetailsUseCase?
      mockGetEaserServiceHistoryDetailsUseCase;
  late EaserServiceHistoryDetailsProvider? easerServiceHistoryDetailsProvider;
  setUp(() {
    mockGetEaserServiceHistoryDetailsUseCase =
        MockGetEaserServiceHistoryDetailsUseCase();
    easerServiceHistoryDetailsProvider = EaserServiceHistoryDetailsProvider(
        mockGetEaserServiceHistoryDetailsUseCase!);
  });

  group('test get easer service history details functionality in provider', () {
    test(
      "initial values of provider should be correct",
      () async {
        // Assert
        expect(easerServiceHistoryDetailsProvider!.isLoading, false);
        expect(easerServiceHistoryDetailsProvider!.isError, false);
      },
    );
  });
}
