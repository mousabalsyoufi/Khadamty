import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/core/api_handler/error_message.dart';
import 'package:faciltateur_de_vies/core/api_handler/response_handler.dart';
import 'package:faciltateur_de_vies/screens/easer_personal_data_screen/data/datasource/get_account_provider/get_easer_account_api_imp.dart';
import 'package:faciltateur_de_vies/screens/easer_personal_data_screen/data/repository/easer_personal_data_repository_imp.dart';
import 'package:faciltateur_de_vies/screens/user_profile_screen/data/models/account_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGetEaserAccountApiImp extends Mock implements GetEaserAccountApiImp {}

void main() {
  late EaserPersonalDataRepositoryImp? easerPersonalDataRepositoryImp;
  late MockGetEaserAccountApiImp? mockGetEaserAccountApiImp;

  setUp(() {
    mockGetEaserAccountApiImp = MockGetEaserAccountApiImp();
    easerPersonalDataRepositoryImp = EaserPersonalDataRepositoryImp(
      mockGetEaserAccountApiImp!,
    );
  });

  // GET User Profile test case
  var tGetAccountResponse = ApiResponse.completed(
      AccountModel(id: "18", user_mobile: "+97150890202", birth: "2002-12-12"));

  final ApiResponse<AccountModel> tErrorResponseAccount =
      ApiResponse.error(ErrorMessages.dioDefault);

  test(
    "get account should return success account Object",
    () async {
      // Arrange
      when(() => mockGetEaserAccountApiImp!.getAccount())
          .thenAnswer((_) async => tGetAccountResponse);
      // Act
      final result = await easerPersonalDataRepositoryImp!.getAccount();
      // Assert
      expect(result, Right(tGetAccountResponse));
      verify(() => mockGetEaserAccountApiImp!.getAccount());
      verifyNoMoreInteractions(mockGetEaserAccountApiImp);
    },
  );
  test(
    "get account should return error form get account api",
    () async {
      // Arrange
      when(() => mockGetEaserAccountApiImp!.getAccount())
          .thenAnswer((_) async => tErrorResponseAccount);
      // Act
      final result = await easerPersonalDataRepositoryImp!.getAccount();
      // Assert
      expect(result, Left(tErrorResponseAccount));
      verify(() => mockGetEaserAccountApiImp!.getAccount());
      verifyNoMoreInteractions(mockGetEaserAccountApiImp);
    },
  );
}
