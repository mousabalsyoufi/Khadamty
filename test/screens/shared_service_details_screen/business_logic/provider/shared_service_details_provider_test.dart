import 'package:faciltateur_de_vies/screens/shared_service_details_screen/business_logic/shared_serivce_details_provider/shared_service_details_provider.dart';
import 'package:faciltateur_de_vies/screens/shared_service_details_screen/domain/usecase/get_service_details_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGetServiceDetailsUseCase extends Mock
    implements GetServiceDetailsUseCase {}

void main() async {
  late MockGetServiceDetailsUseCase? mockGetServiceDetailsUseCase;
  late SharedServiceDetailsProvider? sharedServiceDetailsProvider;
  setUp(() {
    mockGetServiceDetailsUseCase = MockGetServiceDetailsUseCase();
    sharedServiceDetailsProvider =
        SharedServiceDetailsProvider(mockGetServiceDetailsUseCase!);
  });

  group('test get service details functionality in provider', () {
    test(
      "initial values of provider should be correct",
      () async {
        // Assert
        expect(sharedServiceDetailsProvider!.isLoading, false);
        expect(sharedServiceDetailsProvider!.isError, false);
      },
    );
  });
}
