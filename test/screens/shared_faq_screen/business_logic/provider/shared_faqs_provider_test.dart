import 'package:faciltateur_de_vies/screens/shared_faq_screen/business_logic/provider/shared_faqs_provider.dart';
import 'package:faciltateur_de_vies/screens/shared_faq_screen/domain/usecase/get_shared_faq_items_usecase.dart';
import 'package:faciltateur_de_vies/screens/shared_faq_screen/domain/usecase/get_shared_faqs_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGetSharedFaqsUseCase extends Mock implements GetSharedFaqsUseCase {}

class MockGetSharedFaqItemsUseCase extends Mock
    implements GetSharedFaqItemsUseCase {}

void main() async {
  late MockGetSharedFaqsUseCase? mockGetSharedFaqsUseCase;
  late MockGetSharedFaqItemsUseCase? mockGetSharedFaqItemsUseCase;
  late SharedFaqsProvider? sharedFaqsProvider;
  setUp(() {
    mockGetSharedFaqsUseCase = MockGetSharedFaqsUseCase();
    mockGetSharedFaqItemsUseCase = MockGetSharedFaqItemsUseCase();
    sharedFaqsProvider = SharedFaqsProvider(
        mockGetSharedFaqsUseCase!, mockGetSharedFaqItemsUseCase!);
  });

  group('test get shared faqs functionality in provider', () {
    test(
      "initial values of provider should be correct",
      () async {
        // Assert
        expect(sharedFaqsProvider!.isLoading, false);
        expect(sharedFaqsProvider!.isError, false);
      },
    );
  });
}
