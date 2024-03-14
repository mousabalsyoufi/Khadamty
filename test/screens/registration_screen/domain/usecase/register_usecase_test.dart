import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/core/api_handler/error_message.dart';
import 'package:faciltateur_de_vies/core/api_handler/response_handler.dart';
import 'package:faciltateur_de_vies/screens/registeration_screen/data/model/register_model.dart';
import 'package:faciltateur_de_vies/screens/registeration_screen/data/model/register_request_model.dart';
import 'package:faciltateur_de_vies/screens/registeration_screen/data/repository/register_repository_imp.dart';
import 'package:faciltateur_de_vies/screens/registeration_screen/domain/usecase/register_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockRegisterRepositoryImp extends Mock implements RegisterRepositoryImp {}

void main() {
  late MockRegisterRepositoryImp? mockRegisterRepositoryImp;
  late RegisterUseCase? registerUseCase;

  setUp(() {
    mockRegisterRepositoryImp = MockRegisterRepositoryImp();
    registerUseCase = RegisterUseCase(mockRegisterRepositoryImp);
  });

  const tUserNamne = 'userName';
  const tUserNumber = '+971561234578';
  const tUserEmail = 'userName@gmail.com';
  const tPassword = 'password1234';
  final RegisterRequestModel tRegisterRequestModel = RegisterRequestModel(
      fullName: tUserNamne,
      email: tUserEmail,
      phoneNumber: tUserNumber,
      password: tPassword,
      groupId: '2',
      type: 0);
  final RegisterModel tRegisterModel = RegisterModel();
  final tRegisterResponse = ApiResponse.completed(tRegisterModel);
  final ApiResponse<RegisterModel> tErrorResponse =
      ApiResponse.error(ErrorMessages.dioDefault);

  test(
    "should return register model response when calling register",
    () async {
      // Arrange
      when(
        () => mockRegisterRepositoryImp!
            .register(registerRequestModel: tRegisterRequestModel),
      ).thenAnswer((invocation) async => Right(tRegisterResponse));
      // Act
      final result = await registerUseCase!(
          RegisterUseCaseParams(registerRequestModel: tRegisterRequestModel));
      // Assert
      expect(result, Right(tRegisterResponse));
      verify(
        () => mockRegisterRepositoryImp!
            .register(registerRequestModel: tRegisterRequestModel),
      );
      verifyNoMoreInteractions(mockRegisterRepositoryImp);
    },
  );
  test(
    "should return error calling register",
    () async {
      // Arrange
      when(
        () => mockRegisterRepositoryImp!
            .register(registerRequestModel: tRegisterRequestModel),
      ).thenAnswer((invocation) async => Left(tErrorResponse));
      // Act
      final result = await registerUseCase!(
          RegisterUseCaseParams(registerRequestModel: tRegisterRequestModel));
      // Assert
      expect(result, Left(tErrorResponse));
      verify(
        () => mockRegisterRepositoryImp!
            .register(registerRequestModel: tRegisterRequestModel),
      );
      verifyNoMoreInteractions(mockRegisterRepositoryImp);
    },
  );
}
