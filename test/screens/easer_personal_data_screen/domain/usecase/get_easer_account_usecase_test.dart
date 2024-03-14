import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/core/api_handler/error_message.dart';
import 'package:faciltateur_de_vies/core/api_handler/response_handler.dart';
import 'package:faciltateur_de_vies/core/generic_usecase/usecase.dart';
import 'package:faciltateur_de_vies/screens/easer_personal_data_screen/data/repository/easer_personal_data_repository_imp.dart';
import 'package:faciltateur_de_vies/screens/easer_personal_data_screen/domain/usecase/get_easer_account_usecase.dart';
import 'package:faciltateur_de_vies/screens/user_profile_screen/data/models/account_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockEaserPersonalDataRepositoryImp extends Mock
    implements EaserPersonalDataRepositoryImp {}

void main() {
  late MockEaserPersonalDataRepositoryImp? mockEaserPersonalDataRepositoryImp;
  late GetEaserAccountUseCase? getEaserAccountUseCase;

  setUp(() {
    mockEaserPersonalDataRepositoryImp = MockEaserPersonalDataRepositoryImp();
    getEaserAccountUseCase =
        GetEaserAccountUseCase(mockEaserPersonalDataRepositoryImp);
  });

  AccountModel accountModel = AccountModel(
    id: "1",
    email: "emad1.2@hotmai.com",
    lastname: "juha",
    user_mobile: "+971508902012",
    birth: "2002-12-10",
  );

  // response contains success message
  final tAccountResponse = ApiResponse.completed(accountModel);
  final ApiResponse<AccountModel> tErrorResponse =
      ApiResponse.error(ErrorMessages.dioDefault);

  test(
    "should return success account model response when calling get easer account",
    () async {
      // Arrange
      when(
        () => mockEaserPersonalDataRepositoryImp!.getAccount(),
      ).thenAnswer((invocation) async => Right(tAccountResponse));
      // Act
      final result = await getEaserAccountUseCase!(NoParams());
      // Assert
      expect(result, Right(tAccountResponse));
      verify(
        () => mockEaserPersonalDataRepositoryImp!.getAccount(),
      );
      verifyNoMoreInteractions(mockEaserPersonalDataRepositoryImp);
    },
  );
  test(
    "should return error calling get easer account",
    () async {
      // Arrange
      when(
        () => mockEaserPersonalDataRepositoryImp!.getAccount(),
      ).thenAnswer((invocation) async => Left(tErrorResponse));
      // Act
      final result = await getEaserAccountUseCase!(NoParams());
      // Assert
      expect(result, Left(tErrorResponse));
      verify(
        () => mockEaserPersonalDataRepositoryImp!.getAccount(),
      );
      verifyNoMoreInteractions(mockEaserPersonalDataRepositoryImp);
    },
  );
}
