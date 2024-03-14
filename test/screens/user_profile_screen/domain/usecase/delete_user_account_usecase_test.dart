import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/core/api_handler/error_message.dart';
import 'package:faciltateur_de_vies/core/api_handler/response_handler.dart';
import 'package:faciltateur_de_vies/screens/user_profile_screen/data/repository/user_profile_repository_imp.dart';
import 'package:faciltateur_de_vies/screens/user_profile_screen/domain/usecase/delete_user_account_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockUserProfileRepositoryImp extends Mock implements UserProfileRepositoryImp {}

void main() {
  late MockUserProfileRepositoryImp? mockUserProfileRepositoryImp;
  late DeleteUserAccountUseCase? deleteUserAccountUseCase;

  setUp(() {
    mockUserProfileRepositoryImp = MockUserProfileRepositoryImp();
    deleteUserAccountUseCase =
        DeleteUserAccountUseCase(mockUserProfileRepositoryImp);
  });

  const tUserId = '1';

  // response contains success message
  final tCheckUserExistResponse =
      ApiResponse.completed('user deleted successfully');
  final ApiResponse<String> tErrorResponse =
      ApiResponse.error(ErrorMessages.dioDefault);

  test(
    "should return success message response when calling delete user account",
    () async {
      // Arrange
      when(
        () => mockUserProfileRepositoryImp!.deleteAccount(id: tUserId),
      ).thenAnswer((invocation) async => Right(tCheckUserExistResponse));
      // Act
      final result = await deleteUserAccountUseCase!(
          DeleteUserAccountUseCaseParams(id: tUserId));
      // Assert
      expect(result, Right(tCheckUserExistResponse));
      verify(
        () => mockUserProfileRepositoryImp!.deleteAccount(id: tUserId),
      );
      verifyNoMoreInteractions(mockUserProfileRepositoryImp);
    },
  );
  test(
    "should return error calling delete user account",
    () async {
      // Arrange
      when(
        () => mockUserProfileRepositoryImp!.deleteAccount(id: tUserId),
      ).thenAnswer((invocation) async => Left(tErrorResponse));
      // Act
      final result = await deleteUserAccountUseCase!(
          DeleteUserAccountUseCaseParams(id: tUserId));
      // Assert
      expect(result, Left(tErrorResponse));
      verify(
        () => mockUserProfileRepositoryImp!.deleteAccount(id: tUserId),
      );
      verifyNoMoreInteractions(mockUserProfileRepositoryImp);
    },
  );
}
