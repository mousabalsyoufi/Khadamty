import 'package:faciltateur_de_vies/screens/user_upcoming_recurrent_service_details_screen/business_logic/provider/user_upcoming_recurrent_service_details_provider.dart';
import 'package:faciltateur_de_vies/screens/user_upcoming_recurrent_service_details_screen/domain/usecase/get_upcoming_recurrent_service_details_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGetUpcomingRecurrentServiceDetailsUseCase extends Mock
    implements GetUpcomingRecurrentServiceDetailsUseCase {}

void main() async {
  late MockGetUpcomingRecurrentServiceDetailsUseCase?
      mockGetUpcomingRecurrentServiceDetailsUseCase;
  late UserUpcomingRecurrentServiceDetailsProvider?
      upcomingRecurrentServiceDetailsProvider;
  setUp(() {
    mockGetUpcomingRecurrentServiceDetailsUseCase =
        MockGetUpcomingRecurrentServiceDetailsUseCase();
    upcomingRecurrentServiceDetailsProvider =
        UserUpcomingRecurrentServiceDetailsProvider(
            mockGetUpcomingRecurrentServiceDetailsUseCase!);
  });

  group('test get user upcoming service details functionality in provider', () {
    test(
      "initial values of provider should be correct",
      () async {
        // Assert
        expect(upcomingRecurrentServiceDetailsProvider!.isLoading, false);
        expect(upcomingRecurrentServiceDetailsProvider!.isError, false);
      },
    );
  });
}
