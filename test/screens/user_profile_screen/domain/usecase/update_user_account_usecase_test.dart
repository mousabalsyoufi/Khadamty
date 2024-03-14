import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/core/api_handler/error_message.dart';
import 'package:faciltateur_de_vies/core/api_handler/response_handler.dart';
import 'package:faciltateur_de_vies/core/models/response.model.dart';
import 'package:faciltateur_de_vies/screens/user_profile_screen/data/models/account_model.dart';
import 'package:faciltateur_de_vies/screens/user_profile_screen/data/repository/user_profile_repository_imp.dart';
import 'package:faciltateur_de_vies/screens/user_profile_screen/domain/usecase/update_account_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockUserProfileRepositoryImp extends Mock implements UserProfileRepositoryImp {}

void main() {
  late MockUserProfileRepositoryImp? mockUserProfileRepositoryImp;
  late UpdateAccountUseCase? updateAccountUseCase;

  setUp(() {
    mockUserProfileRepositoryImp = MockUserProfileRepositoryImp();
    updateAccountUseCase = UpdateAccountUseCase(mockUserProfileRepositoryImp);
  });


  AccountModel accountModel =  AccountModel(
    id: "1",
    email: "emad1.2@hotmai.com",
    lastname: "juha",
    user_mobile: "+971508902012",
    birth: "2002-12-10",
  );

  SuccessResponseModel successResponseModel = SuccessResponseModel(statusCode:200,message: "User updated");

  // response contains success message
  final tCheckUserExistResponse = ApiResponse.completed(successResponseModel);
  final ApiResponse<AccountModel> tErrorResponse = ApiResponse.error(ErrorMessages.dioDefault);

  test(
    "should return success message response when calling update user account",
        () async {
      // Arrange
      when(
            () => mockUserProfileRepositoryImp!.updateAccount(accountModel: accountModel, id: 18),
      ).thenAnswer((invocation) async => Right(tCheckUserExistResponse));
      // Act
      final result = await updateAccountUseCase!(
          UpdateAccountUseCaseParams(accountModel: accountModel, id: 18));
      // Assert
      expect(result, Right(tCheckUserExistResponse));
      verify(
            () => mockUserProfileRepositoryImp!.updateAccount(accountModel: accountModel, id: 18),
      );
      verifyNoMoreInteractions(mockUserProfileRepositoryImp);
    },
  );
  test(
    "should return error calling update user account",
        () async {
      // Arrange
      when(
            () => mockUserProfileRepositoryImp!.updateAccount(accountModel: accountModel, id: 18),
      ).thenAnswer((invocation) async => Left(tErrorResponse));
      // Act
      final result = await updateAccountUseCase!(
          UpdateAccountUseCaseParams(accountModel: accountModel, id: 18));
      // Assert
      expect(result, Left(tErrorResponse));
      verify(
            () => mockUserProfileRepositoryImp!.updateAccount(accountModel: accountModel, id: 18),
      );
      verifyNoMoreInteractions(mockUserProfileRepositoryImp);
    },
  );
}
