import 'package:faciltateur_de_vies/screens/user_become_employee_screen/business_logic/provider/become_an_employee_provider.dart';
import 'package:faciltateur_de_vies/screens/user_become_employee_screen/domain/usecase/become_an_employee_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockBecomeAnEmployeeUseCase extends Mock
    implements BecomeAnEmployeeUseCase {}

void main() async {
  late MockBecomeAnEmployeeUseCase? mockBecomeAnEmployeeUseCase;
  late BecomeAnEmployeeProvider? becomeAnEmployeeProvider;
  setUp(() {
    mockBecomeAnEmployeeUseCase = MockBecomeAnEmployeeUseCase();
    becomeAnEmployeeProvider =
        BecomeAnEmployeeProvider(mockBecomeAnEmployeeUseCase!);
  });

  group('test become an employee functionality in provider', () {
    test(
      "initial values of provider should be correct",
      () async {
        // Assert
        expect(becomeAnEmployeeProvider!.isLoading, false);
        expect(becomeAnEmployeeProvider!.isError, false);
      },
    );
  });
}
