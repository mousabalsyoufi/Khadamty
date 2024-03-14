import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/core/api_handler/error_message.dart';
import 'package:faciltateur_de_vies/core/api_handler/response_handler.dart';
import 'package:faciltateur_de_vies/screens/user_profile_screen/data/models/account_model.dart';
import 'package:faciltateur_de_vies/screens/user_profile_screen/data/repository/user_profile_repository_imp.dart';
import 'package:faciltateur_de_vies/screens/user_profile_screen/domain/usecase/get_account_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockUserProfileRepositoryImp extends Mock
    implements UserProfileRepositoryImp {}

void main() {
  late MockUserProfileRepositoryImp? mockUserProfileRepositoryImp;
  late GetAccountUseCase? getAccountUseCase;

  setUp(() {
    mockUserProfileRepositoryImp = MockUserProfileRepositoryImp();
    getAccountUseCase = GetAccountUseCase(mockUserProfileRepositoryImp);
  });

  AccountModel accountModel = AccountModel(
    id: "1",
    email: "emad1.2@hotmai.com",
    lastname: "juha",
    user_mobile: "+971508902012",
    birth: "2002-12-10",
  );

  // response contains success account model
  final tUserAccountResponse = ApiResponse.completed(accountModel);
  final ApiResponse<AccountModel> tErrorResponse =
      ApiResponse.error(ErrorMessages.dioDefault);

  test(
    "should return success account model response when calling get user account",
    () async {
      // Arrange
      when(
        () => mockUserProfileRepositoryImp!.getAccount(),
      ).thenAnswer((invocation) async => Right(tUserAccountResponse));
      // Act
      final result = await getAccountUseCase!(GetAccountUseCaseParams());
      // Assert
      expect(result, Right(tUserAccountResponse));
      verify(
        () => mockUserProfileRepositoryImp!.getAccount(),
      );
      verifyNoMoreInteractions(mockUserProfileRepositoryImp);
    },
  );
  test(
    "should return error calling get user account",
    () async {
      // Arrange
      when(
        () => mockUserProfileRepositoryImp!.getAccount(),
      ).thenAnswer((invocation) async => Left(tErrorResponse));
      // Act
      final result = await getAccountUseCase!(GetAccountUseCaseParams());
      // Assert
      expect(result, Left(tErrorResponse));
      verify(
        () => mockUserProfileRepositoryImp!.getAccount(),
      );
      verifyNoMoreInteractions(mockUserProfileRepositoryImp);
    },
  );
}
