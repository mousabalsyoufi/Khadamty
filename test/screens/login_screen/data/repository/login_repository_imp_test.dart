import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/core/api_handler/error_message.dart';
import 'package:faciltateur_de_vies/core/api_handler/response_handler.dart';
import 'package:faciltateur_de_vies/screens/login_screen/data/data_source/login_provider/login_api_imp.dart';
import 'package:faciltateur_de_vies/screens/login_screen/data/model/login_model.dart';
import 'package:faciltateur_de_vies/screens/login_screen/data/repository/login_repository_imp.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockLoginApiImp extends Mock implements LoginApiImp {}

void main() {
  late MockLoginApiImp? mockLoginApiImp;
  late LoginRepositoryImp? loginRepositoryImp;

  setUp(() {
    mockLoginApiImp = MockLoginApiImp();
    loginRepositoryImp = LoginRepositoryImp(mockLoginApiImp!);
  });

  const tUserNamne = 'userName';
  const tPassword = 'password';
  final LoginModel tLoginModel =
      LoginModel(token: 'token', socid: '1', userId: '1',email: "emad1.2@hotma.com",fullName: "Emadeldin", addresses: [], subscriptionType: -1, clientId: 'Client Id', urssafMember: false, photo: '');
  final tloginResponse = ApiResponse.completed(tLoginModel);
  final ApiResponse<LoginModel> tErrorResponse =
      ApiResponse.error(ErrorMessages.dioDefault);

  test(
    "login should return login responsemodel",
    () async {
      // Arrange
      when(() =>
              mockLoginApiImp!.login(username: tUserNamne, password: tPassword))
          .thenAnswer((_) async => tloginResponse);
      // Act
      final result = await loginRepositoryImp!
          .login(username: tUserNamne, password: tPassword);
      // Assert
      expect(result, Right(tloginResponse));
      verify(() =>
          mockLoginApiImp!.login(username: tUserNamne, password: tPassword));
      verifyNoMoreInteractions(mockLoginApiImp);
    },
  );
  test(
    "login should return error form login api",
    () async {
      // Arrange
      when(() =>
              mockLoginApiImp!.login(username: tUserNamne, password: tPassword))
          .thenAnswer((_) async => tErrorResponse);
      // Act
      final result = await loginRepositoryImp!
          .login(username: tUserNamne, password: tPassword);
      // Assert
      expect(result, Left(tErrorResponse));
      verify(() =>
          mockLoginApiImp!.login(username: tUserNamne, password: tPassword));
      verifyNoMoreInteractions(mockLoginApiImp);
    },
  );
}
