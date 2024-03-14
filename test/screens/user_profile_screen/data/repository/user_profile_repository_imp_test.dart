import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/core/api_handler/error_message.dart';
import 'package:faciltateur_de_vies/core/api_handler/response_handler.dart';
import 'package:faciltateur_de_vies/core/models/response.model.dart';
import 'package:faciltateur_de_vies/screens/user_profile_screen/data/data_source/delete_account_provider/delete_account_api_imp.dart';
import 'package:faciltateur_de_vies/screens/user_profile_screen/data/data_source/get_account_provider/get_account_api_imp.dart';
import 'package:faciltateur_de_vies/screens/user_profile_screen/data/data_source/update_account_provider/update_account_api_imp.dart';
import 'package:faciltateur_de_vies/screens/user_profile_screen/data/data_source/upload_photo_provider/upload_photo_api_imp.dart';
import 'package:faciltateur_de_vies/screens/user_profile_screen/data/models/account_model.dart';
import 'package:faciltateur_de_vies/screens/user_profile_screen/data/repository/user_profile_repository_imp.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDeleteAccountApiImp extends Mock implements DeleteAccountApiImp {}

class MockGetUserAccountApiImp extends Mock implements GetAccountApiImp {}

class MockUpdateUserAccountApiImp extends Mock implements UpdateAccountApiImp {}

class MockUploadPhotoApiImp extends Mock implements UploadPhotoApiImp {}

void main() {
  late MockDeleteAccountApiImp? mockDeleteAccountApiImp;
  late UserProfileRepositoryImp? userProfileRepositoryImp;
  late MockGetUserAccountApiImp? mockGetUserAccountApiImp;
  late MockUpdateUserAccountApiImp? mockUpdateUserAccountApiImp;
  late MockUploadPhotoApiImp? mockUploadPhotoApiImp;

  setUp(() {
    mockDeleteAccountApiImp = MockDeleteAccountApiImp();
    mockGetUserAccountApiImp = MockGetUserAccountApiImp();
    mockUpdateUserAccountApiImp = MockUpdateUserAccountApiImp();
    mockUploadPhotoApiImp = MockUploadPhotoApiImp();
    userProfileRepositoryImp = UserProfileRepositoryImp(
        mockDeleteAccountApiImp!,
        mockGetUserAccountApiImp!,
        mockUpdateUserAccountApiImp!,
        mockUploadPhotoApiImp!);
  });

  const tAccountId = '1';
  const tDeleteAccountResponse = 'account deleted successfuly';

  final tresult = ApiResponse.completed(tDeleteAccountResponse);
  final ApiResponse<String> tErrorResponse =
      ApiResponse.error(ErrorMessages.dioDefault);

  test(
    "delete account should return success string",
    () async {
      // Arrange
      when(() => mockDeleteAccountApiImp!.deleteAccount(id: tAccountId))
          .thenAnswer((_) async => tresult);
      // Act
      final result =
          await userProfileRepositoryImp!.deleteAccount(id: tAccountId);
      // Assert
      expect(result, Right(tresult));
      verify(() => mockDeleteAccountApiImp!.deleteAccount(id: tAccountId));
      verifyNoMoreInteractions(mockDeleteAccountApiImp);
    },
  );
  test(
    "delete account should return error form delete account api",
    () async {
      // Arrange
      when(() => mockDeleteAccountApiImp!.deleteAccount(id: tAccountId))
          .thenAnswer((_) async => tErrorResponse);
      // Act
      final result =
          await userProfileRepositoryImp!.deleteAccount(id: tAccountId);
      // Assert
      expect(result, Left(tErrorResponse));
      verify(() => mockDeleteAccountApiImp!.deleteAccount(id: tAccountId));
      verifyNoMoreInteractions(mockDeleteAccountApiImp);
    },
  );

  // GET User Profile test case
  var tGetAccountResponse = ApiResponse.completed(
      AccountModel(id: "18", user_mobile: "+97150890202", birth: "2002-12-12"));

  final ApiResponse<AccountModel> tErrorResponseAccount =
      ApiResponse.error(ErrorMessages.dioDefault);

  test(
    "get account should return success account Object",
    () async {
      // Arrange
      when(() => mockGetUserAccountApiImp!.getAccount())
          .thenAnswer((_) async => tGetAccountResponse);
      // Act
      final result = await userProfileRepositoryImp!.getAccount();
      // Assert
      expect(result, Right(tGetAccountResponse));
      verify(() => mockGetUserAccountApiImp!.getAccount());
      verifyNoMoreInteractions(mockGetUserAccountApiImp);
    },
  );
  test(
    "get account should return error form get account api",
    () async {
      // Arrange
      when(() => mockGetUserAccountApiImp!.getAccount())
          .thenAnswer((_) async => tErrorResponseAccount);
      // Act
      final result = await userProfileRepositoryImp!.getAccount();
      // Assert
      expect(result, Left(tErrorResponseAccount));
      verify(() => mockGetUserAccountApiImp!.getAccount());
      verifyNoMoreInteractions(mockGetUserAccountApiImp);
    },
  );

  // Update User Profile test case

  var tParam = SuccessResponseModel(statusCode: 200, message: "user updated");
  var accountModel =
      AccountModel(id: "18", user_mobile: "+97150890202", birth: "2002-12-12");
  var tUpdateAccountResponse = ApiResponse.completed(tParam);

  final ApiResponse<SuccessResponseModel> tErrorResponseUpdateAccount =
      ApiResponse.error(ErrorMessages.dioDefault);

  test(
    "update account should return success account Object",
    () async {
      // Arrange
      when(() => mockUpdateUserAccountApiImp!.updateAccount(
          accountModel: accountModel,
          id: 18)).thenAnswer((_) async => tUpdateAccountResponse);
      // Act
      final result = await userProfileRepositoryImp!
          .updateAccount(accountModel: accountModel, id: 18);
      // Assert
      expect(result, Right(tUpdateAccountResponse));
      verify(() => mockUpdateUserAccountApiImp!
          .updateAccount(accountModel: accountModel, id: 18));
      verifyNoMoreInteractions(mockUpdateUserAccountApiImp);
    },
  );
  test(
    "update account should return error form update account api",
    () async {
      // Arrange
      when(() => mockUpdateUserAccountApiImp!.updateAccount(
          accountModel: accountModel,
          id: 18)).thenAnswer((_) async => tErrorResponseUpdateAccount);
      // Act
      final result = await userProfileRepositoryImp!
          .updateAccount(accountModel: accountModel, id: 18);
      // Assert
      expect(result, Left(tErrorResponseUpdateAccount));
      verify(() => mockUpdateUserAccountApiImp!
          .updateAccount(accountModel: accountModel, id: 18));
      verifyNoMoreInteractions(mockUpdateUserAccountApiImp);
    },
  );
}
