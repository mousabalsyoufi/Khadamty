import 'package:faciltateur_de_vies/screens/user_service_history_details_screen/business_logic/provider/user_service_history_details_provider.dart';
import 'package:faciltateur_de_vies/screens/user_service_history_details_screen/domain/usecase/get_service_history_details_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGetServiceHistoryDetailsUseCase extends Mock
    implements GetServiceHistoryDetailsUseCase {}

void main() async {
  late MockGetServiceHistoryDetailsUseCase?
      mockGetServiceHistoryDetailsUseCase;
  late UserServiceHistoryDetailsProvider?
      userServiceHistoryDetailsProvider;
  setUp(() {
    mockGetServiceHistoryDetailsUseCase =
        MockGetServiceHistoryDetailsUseCase();
    userServiceHistoryDetailsProvider =
        UserServiceHistoryDetailsProvider(
            mockGetServiceHistoryDetailsUseCase!);
  });

  group(
      'test get user service history details functionality in provider',
      () {
    test(
      "initial values of provider should be correct",
      () async {
        // Assert
        expect(userServiceHistoryDetailsProvider!.isLoading, false);
        expect(userServiceHistoryDetailsProvider!.isError, false);
      },
    );
  });
}
