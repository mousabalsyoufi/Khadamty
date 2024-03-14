import 'package:faciltateur_de_vies/screens/user_upcoming_one_time_service_details_screen/business_logic/provider/user_upcoming_one_time_service_details_provider.dart';
import 'package:faciltateur_de_vies/screens/user_upcoming_one_time_service_details_screen/domain/usecase/get_upcoming_service_details_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGetUpcomingOneTimeServiceDetailsUseCase extends Mock
    implements GetUpcomingServiceDetailsUseCase {}

void main() async {
  late MockGetUpcomingOneTimeServiceDetailsUseCase?
      mockGetUpcomingOneTimeServiceDetailsUseCase;
  late UserUpcomingOneTimeServiceDetailsProvider?
      upcomingOneTimeServiceDetailsProvider;
  setUp(() {
    mockGetUpcomingOneTimeServiceDetailsUseCase =
        MockGetUpcomingOneTimeServiceDetailsUseCase();
    upcomingOneTimeServiceDetailsProvider =
        UserUpcomingOneTimeServiceDetailsProvider(
            mockGetUpcomingOneTimeServiceDetailsUseCase!);
  });

  group(
      'test get user upcoming service details functionality in provider',
      () {
    test(
      "initial values of provider should be correct",
      () async {
        // Assert
        expect(upcomingOneTimeServiceDetailsProvider!.isLoading, false);
        expect(upcomingOneTimeServiceDetailsProvider!.isError, false);
      },
    );
  });
}
