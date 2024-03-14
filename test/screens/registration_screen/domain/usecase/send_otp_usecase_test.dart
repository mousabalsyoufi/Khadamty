import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/core/api_handler/error_message.dart';
import 'package:faciltateur_de_vies/core/api_handler/response_handler.dart';
import 'package:faciltateur_de_vies/screens/registeration_screen/data/repository/register_repository_imp.dart';
import 'package:faciltateur_de_vies/screens/registeration_screen/domain/usecase/send_otp_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockRegisterRepositoryImp extends Mock implements RegisterRepositoryImp {}

void main() {
  late MockRegisterRepositoryImp? mockRegisterRepositoryImp;
  late SendOtpUseCase? sendOtpUseCase;

  setUp(() {
    mockRegisterRepositoryImp = MockRegisterRepositoryImp();
    sendOtpUseCase = SendOtpUseCase(mockRegisterRepositoryImp);
  });

  const tUserNumber = '+971561234578';

  // response contains verification Id
  final tSendOtpResponse = ApiResponse.completed('111111111111111');
  final ApiResponse<String> tErrorResponse =
      ApiResponse.error(ErrorMessages.dioDefault);

  test(
    "should return verification Id response when calling send otp",
    () async {
      // Arrange
      when(
        () => mockRegisterRepositoryImp!.sendOtp(phoneNumber: tUserNumber),
      ).thenAnswer((invocation) async => Right(tSendOtpResponse));
      // Act
      final result =
          await sendOtpUseCase!(SendOtpUseCaseParams(phoneNumber: tUserNumber));
      // Assert
      expect(result, Right(tSendOtpResponse));
      verify(
        () => mockRegisterRepositoryImp!.sendOtp(phoneNumber: tUserNumber),
      );
      verifyNoMoreInteractions(mockRegisterRepositoryImp);
    },
  );
  test(
    "should return error calling send otp",
    () async {
      // Arrange
      when(
        () => mockRegisterRepositoryImp!.sendOtp(phoneNumber: tUserNumber),
      ).thenAnswer((invocation) async => Left(tErrorResponse));
      // Act
      final result =
          await sendOtpUseCase!(SendOtpUseCaseParams(phoneNumber: tUserNumber));
      // Assert
      expect(result, Left(tErrorResponse));
      verify(
        () => mockRegisterRepositoryImp!.sendOtp(phoneNumber: tUserNumber),
      );
      verifyNoMoreInteractions(mockRegisterRepositoryImp);
    },
  );
}
