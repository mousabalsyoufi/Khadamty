import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/core/api_handler/error_message.dart';
import 'package:faciltateur_de_vies/core/api_handler/response_handler.dart';
import 'package:faciltateur_de_vies/screens/registeration_screen/data/repository/register_repository_imp.dart';
import 'package:faciltateur_de_vies/screens/registeration_screen/domain/usecase/check_user_exist_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockRegisterRepositoryImp extends Mock implements RegisterRepositoryImp {}

void main() {
  late MockRegisterRepositoryImp? mockRegisterRepositoryImp;
  late CheckUserExistUseCase? checkUserExistUseCase;

  setUp(() {
    mockRegisterRepositoryImp = MockRegisterRepositoryImp();
    checkUserExistUseCase = CheckUserExistUseCase(mockRegisterRepositoryImp);
  });

  const tUserEmail = 'user@gmail.com';

  // response contains success message
  final tCheckUserExistResponse = ApiResponse.completed('user not found');
  final ApiResponse<String> tErrorResponse =
      ApiResponse.error(ErrorMessages.dioDefault);

  test(
    "should return success message response when calling check user exist",
    () async {
      // Arrange
      when(
        () => mockRegisterRepositoryImp!.checkUserExist(email: tUserEmail),
      ).thenAnswer((invocation) async => Right(tCheckUserExistResponse));
      // Act
      final result = await checkUserExistUseCase!(
          CheckUserExistUseCaseParams(email: tUserEmail));
      // Assert
      expect(result, Right(tCheckUserExistResponse));
      verify(
        () => mockRegisterRepositoryImp!.checkUserExist(email: tUserEmail),
      );
      verifyNoMoreInteractions(mockRegisterRepositoryImp);
    },
  );
  test(
    "should return error calling check user exist",
    () async {
      // Arrange
      when(
        () => mockRegisterRepositoryImp!.checkUserExist(email: tUserEmail),
      ).thenAnswer((invocation) async => Left(tErrorResponse));
      // Act
      final result = await checkUserExistUseCase!(
          CheckUserExistUseCaseParams(email: tUserEmail));
      // Assert
      expect(result, Left(tErrorResponse));
      verify(
        () => mockRegisterRepositoryImp!.checkUserExist(email: tUserEmail),
      );
      verifyNoMoreInteractions(mockRegisterRepositoryImp);
    },
  );
}
