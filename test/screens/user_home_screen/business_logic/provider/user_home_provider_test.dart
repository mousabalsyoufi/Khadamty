import 'package:faciltateur_de_vies/screens/user_home_screen/business_logic/provider/user_home_provider.dart';
import 'package:faciltateur_de_vies/screens/user_home_screen/domain/usecase/get_user_categories_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGetUserCategoriesUseCase extends Mock
    implements GetUserCategoriesUseCase {}

void main() async {
  late MockGetUserCategoriesUseCase? mockGetUserCategoriesUseCase;
  late UserHomeProvider? userHomeProvider;
  setUp(() {
    mockGetUserCategoriesUseCase = MockGetUserCategoriesUseCase();
    userHomeProvider = UserHomeProvider(mockGetUserCategoriesUseCase!);
  });

  group('test get categories functionality in provider', () {
    test(
      "initial values of provider should be correct",
      () async {
        // Assert
        expect(userHomeProvider!.isLoading, false);
        expect(userHomeProvider!.isError, false);
      },
    );
  });
}
