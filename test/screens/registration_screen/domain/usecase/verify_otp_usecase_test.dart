import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/core/api_handler/error_message.dart';
import 'package:faciltateur_de_vies/core/api_handler/response_handler.dart';
import 'package:faciltateur_de_vies/screens/registeration_screen/data/model/verify_otp_response_model.dart';
import 'package:faciltateur_de_vies/screens/registeration_screen/data/repository/register_repository_imp.dart';
import 'package:faciltateur_de_vies/screens/registeration_screen/domain/usecase/verify_otp_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockRegisterRepositoryImp extends Mock implements RegisterRepositoryImp {}

void main() {
  late MockRegisterRepositoryImp? mockRegisterRepositoryImp;
  late VerifyOtpUseCase? verifyOtpUseCase;

  setUp(() {
    mockRegisterRepositoryImp = MockRegisterRepositoryImp();
    verifyOtpUseCase = VerifyOtpUseCase(mockRegisterRepositoryImp);
  });

  const tOtpCode = '1111';
  const tOtpVerificationId = '111111111111111';
  const tOtpVerificationStatus = 'approved';
  VerifyOtpResponseModel tVerivicationResponseModel = VerifyOtpResponseModel(
      sid: tOtpVerificationId, status: tOtpVerificationStatus);

  // response contains verification Id
  final tVerifyOtpResponse = ApiResponse.completed(tVerivicationResponseModel);
  final ApiResponse<VerifyOtpResponseModel> tErrorResponse =
      ApiResponse.error(ErrorMessages.dioDefault);

  test(
    "should return same verification Id response when calling verify otp",
    () async {
      // Arrange
      when(
        () => mockRegisterRepositoryImp!
            .verifyOtp(otpCode: tOtpCode, verificationId: tOtpVerificationId),
      ).thenAnswer((invocation) async => Right(tVerifyOtpResponse));
      // Act
      final result = await verifyOtpUseCase!(VerifyOtpUseCaseParams(
          otpCode: tOtpCode, verificationId: tOtpVerificationId));
      // Assert
      expect(result, Right(tVerifyOtpResponse));
      verify(
        () => mockRegisterRepositoryImp!
            .verifyOtp(otpCode: tOtpCode, verificationId: tOtpVerificationId),
      );
      verifyNoMoreInteractions(mockRegisterRepositoryImp);
    },
  );
  test(
    "should return error calling verify otp",
    () async {
      // Arrange
      when(
        () => mockRegisterRepositoryImp!
            .verifyOtp(otpCode: tOtpCode, verificationId: tOtpVerificationId),
      ).thenAnswer((invocation) async => Left(tErrorResponse));
      // Act
      final result = await verifyOtpUseCase!(VerifyOtpUseCaseParams(
          otpCode: tOtpCode, verificationId: tOtpVerificationId));
      // Assert
      expect(result, Left(tErrorResponse));
      verify(
        () => mockRegisterRepositoryImp!
            .verifyOtp(otpCode: tOtpCode, verificationId: tOtpVerificationId),
      );
      verifyNoMoreInteractions(mockRegisterRepositoryImp);
    },
  );
}
