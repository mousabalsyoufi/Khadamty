import 'package:faciltateur_de_vies/screens/easer_help_screen/business_logic/provider/easer_help_provider.dart';
import 'package:faciltateur_de_vies/screens/easer_help_screen/domain/usecase/get_easer_faqs_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGetEaserFaqsUseCase extends Mock implements GetEaserFaqsUseCase {}

void main() async {
  late MockGetEaserFaqsUseCase? mockGetEaserFaqsUseCase;
  late EaserHelpProvider? easerHelpProvider;
  setUp(() {
    mockGetEaserFaqsUseCase = MockGetEaserFaqsUseCase();
    easerHelpProvider = EaserHelpProvider(mockGetEaserFaqsUseCase!);
  });

  group('test get easer faqs functionality in provider', () {
    test(
      "initial values of provider should be correct",
      () async {
        // Assert
        expect(easerHelpProvider!.isLoading, false);
        expect(easerHelpProvider!.isError, false);
      },
    );
  });
}
