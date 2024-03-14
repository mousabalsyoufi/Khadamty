
import 'package:faciltateur_de_vies/screens/login_screen/business_logic/provider/login_provider.dart';
import 'package:faciltateur_de_vies/screens/login_screen/domain/usecase/login_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockLoginUseCase extends Mock implements LoginUseCase {}

void main() async{
  TestWidgetsFlutterBinding.ensureInitialized();
  late MockLoginUseCase? mockLoginUseCase;
  late LoginProvider? loginProvider;
  setUp(() {
    mockLoginUseCase = MockLoginUseCase();
    loginProvider = LoginProvider(mockLoginUseCase!);
  });

  group('test login functionality in provider', () {
    test(
      "initial values of provider should be correct",
      () async {
        // Assert
        expect(loginProvider!.isLoading, false);
        expect(loginProvider!.isError, false);
      },
    );

    /* test(
      "should call login and get login model response",
      () async {
        // Arrange
        when(
          () => mockLoginUseCase!(tLoginParams),
        ).thenAnswer((_) async => Right(tloginResponse));
        // Act
        await loginProvider!.login(username: tUserNamne, password: tPassword);
        // Assert
        verify(() => mockLoginUseCase!(tLoginParams));
        verifyNoMoreInteractions(mockLoginUseCase!);
      },
    ); */
  });
}
