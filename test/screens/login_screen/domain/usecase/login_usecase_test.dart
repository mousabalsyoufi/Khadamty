import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/core/api_handler/error_message.dart';
import 'package:faciltateur_de_vies/core/api_handler/response_handler.dart';
import 'package:faciltateur_de_vies/screens/login_screen/data/model/login_model.dart';
import 'package:faciltateur_de_vies/screens/login_screen/data/repository/login_repository_imp.dart';
import 'package:faciltateur_de_vies/screens/login_screen/domain/usecase/login_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockLoginRepositoryImp extends Mock implements LoginRepositoryImp {}

void main() {
  late MockLoginRepositoryImp? mockLoginRepositoryImp;
  late LoginUseCase? loginUseCase;

  setUp(() {
    mockLoginRepositoryImp = MockLoginRepositoryImp();
    loginUseCase = LoginUseCase(mockLoginRepositoryImp);
  });

  const tUserNamne = 'userName';
  const tPassword = 'password';
  final LoginModel tLoginModel = LoginModel(
      token: 'token',
      socid: '1',
      userId: '1',
      email: "emad1.2@hotm",
      fullName: "emadee",
      addresses: [],
      subscriptionType: -1,
      clientId: 'Client Id',
      urssafMember: false,
      photo: '');
  final tloginResponse = ApiResponse.completed(tLoginModel);
  final ApiResponse<LoginModel> tErrorResponse =
      ApiResponse.error(ErrorMessages.dioDefault);

  test(
    "should return login model response when calling login",
    () async {
      // Arrange
      when(
        () => mockLoginRepositoryImp!
            .login(username: tUserNamne, password: tPassword),
      ).thenAnswer((invocation) async => Right(tloginResponse));
      // Act
      final result = await loginUseCase!(
          LoginUseCaseParams(username: tUserNamne, password: tPassword));
      // Assert
      expect(result, Right(tloginResponse));
      verify(
        () => mockLoginRepositoryImp!
            .login(username: tUserNamne, password: tPassword),
      );
      verifyNoMoreInteractions(mockLoginRepositoryImp);
    },
  );
  test(
    "should return error calling login",
    () async {
      // Arrange
      when(
        () => mockLoginRepositoryImp!
            .login(username: tUserNamne, password: tPassword),
      ).thenAnswer((invocation) async => Left(tErrorResponse));
      // Act
      final result = await loginUseCase!(
          LoginUseCaseParams(username: tUserNamne, password: tPassword));
      // Assert
      expect(result, Left(tErrorResponse));
      verify(
        () => mockLoginRepositoryImp!
            .login(username: tUserNamne, password: tPassword),
      );
      verifyNoMoreInteractions(mockLoginRepositoryImp);
    },
  );
}
