import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/core/api_handler/error_message.dart';
import 'package:faciltateur_de_vies/core/api_handler/response_handler.dart';
import 'package:faciltateur_de_vies/screens/registeration_screen/data/data_source/check_user_exist_provider/check_user_exist_api_imp.dart';
import 'package:faciltateur_de_vies/screens/registeration_screen/data/data_source/otp_sending_provider/send_otp_api_imp.dart';
import 'package:faciltateur_de_vies/screens/registeration_screen/data/data_source/otp_verification_provider/verify_otp_api_imp.dart';
import 'package:faciltateur_de_vies/screens/registeration_screen/data/data_source/register_company_provider/register_company_api_imp.dart';
import 'package:faciltateur_de_vies/screens/registeration_screen/data/data_source/register_provider/register_api_imp.dart';
import 'package:faciltateur_de_vies/screens/registeration_screen/data/model/register_comany_model.dart';
import 'package:faciltateur_de_vies/screens/registeration_screen/data/model/register_model.dart';
import 'package:faciltateur_de_vies/screens/registeration_screen/data/model/register_request_model.dart';
import 'package:faciltateur_de_vies/screens/registeration_screen/data/model/verify_otp_response_model.dart';
import 'package:faciltateur_de_vies/screens/registeration_screen/data/repository/register_repository_imp.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockRegisterApiImp extends Mock implements RegisterApiImp {}

class MockVerifyOtpApiImp extends Mock implements VerifyOtpApiImp {}

class MockSendOtpApiImp extends Mock implements SendOtpApiImp {}

class MockCheckUserExistApiImp extends Mock implements CheckUserExistApiImp {}

class MockRegisterCompanyApiImp extends Mock implements RegisterCompanyApiImp {}


void main() {
  late MockRegisterApiImp? mockRegisterApiImp;
  late MockVerifyOtpApiImp? mockVerifyOtpApiImp;
  late MockSendOtpApiImp? mockSendOtpApiImp;
  late MockCheckUserExistApiImp? mockCheckUserExistApiImp;
  late RegisterRepositoryImp? registerRepositoryImp;
  late MockRegisterCompanyApiImp?  mockRegisterCompanyApiImp;

  setUp(() {
    mockRegisterApiImp = MockRegisterApiImp();
    mockVerifyOtpApiImp = MockVerifyOtpApiImp();
    mockSendOtpApiImp = MockSendOtpApiImp();
    mockCheckUserExistApiImp = MockCheckUserExistApiImp();
    mockRegisterCompanyApiImp = MockRegisterCompanyApiImp();
    registerRepositoryImp = RegisterRepositoryImp(
      registerCompanyImp: mockRegisterCompanyApiImp!,
      registerImp: mockRegisterApiImp!,
      verifyOtpImp: mockVerifyOtpApiImp!,
      sendOtpApiImp: mockSendOtpApiImp!,
      checkUserExistApiImp: mockCheckUserExistApiImp!,
    );
  });

  const tUserName = 'userName';
  const tUserNumber = '+971561234578';
  const tOtpCode = '1111';
  const tOtpVerificationId = '111111111111111';
  const tCheckUserExistSuccessMessage = 'user is not found';
  const tOtpVerificationStatus = 'approved';
  VerifyOtpResponseModel tVerivicationResponseModel = VerifyOtpResponseModel(
      sid: tOtpVerificationId, status: tOtpVerificationStatus);
  const tUserEmail = 'userName@gmail.com';
  const tPassword = 'password1234';
  // response contains verification Id
  final tSendOtpResponse = ApiResponse.completed(tOtpVerificationId);
  final tCheckUserExistResponse =
      ApiResponse.completed(tCheckUserExistSuccessMessage);
  final tVerifyOtpResponse = ApiResponse.completed(tVerivicationResponseModel);
  final RegisterRequestModel tRegisterRequestModel = RegisterRequestModel(
      fullName: tUserName,
      email: tUserEmail,
      phoneNumber: tUserNumber,
      password: tPassword,
      groupId: '2',
      type: 0);

  final RegisterRequestCompanyModel tRegisterRequestCompanyModel = RegisterRequestCompanyModel(
      fullName: tUserName,
      email: tUserEmail,
      phoneNumber: tUserNumber,
      password: tPassword,
      groupId: '2',
      type: 0);
  final RegisterModel tRegisterModel = RegisterModel();
  final tRegisterResponse = ApiResponse.completed(tRegisterModel);
  final ApiResponse<RegisterModel> tErrorRegisterResponse =
      ApiResponse.error(ErrorMessages.dioDefault);
  final ApiResponse<VerifyOtpResponseModel> tErrorVerifyOtpResponse =
      ApiResponse.error(ErrorMessages.dioDefault);
  final ApiResponse<String> tErrorSendOtpResponse =
      ApiResponse.error(ErrorMessages.dioDefault);
  final ApiResponse<String> tErrorCheckUserExistResponse =
      ApiResponse.error(ErrorMessages.dioDefault);

  group('Register Feature Test Group', () {
    test(
      "register should return register responsemodel",
      () async {
        // Arrange
        when(() => mockRegisterApiImp!
                .register(registerRequestModel: tRegisterRequestModel))
            .thenAnswer((_) async => tRegisterResponse);
        // Act
        final result = await registerRepositoryImp!
            .register(registerRequestModel: tRegisterRequestModel);
        // Assert
        expect(result, Right(tRegisterResponse));
        verify(() => mockRegisterApiImp!
            .register(registerRequestModel: tRegisterRequestModel));
        verifyNoMoreInteractions(mockRegisterApiImp);
      },
    );
    test(
      "register should return error form register api",
      () async {
        // Arrange
        when(() => mockRegisterApiImp!
                .register(registerRequestModel: tRegisterRequestModel))
            .thenAnswer((_) async => tErrorRegisterResponse);
        // Act
        final result = await registerRepositoryImp!
            .register(registerRequestModel: tRegisterRequestModel);
        // Assert
        expect(result, Left(tErrorRegisterResponse));
        verify(() => mockRegisterApiImp!
            .register(registerRequestModel: tRegisterRequestModel));
        verifyNoMoreInteractions(mockRegisterApiImp);
      },
    );
  });

  group('Check User Exist Feature Test', () {
    test(
      "check user exist should return success message",
      () async {
        // Arrange
        when(() => mockCheckUserExistApiImp!.checkUserExist(email: tUserEmail))
            .thenAnswer((_) async => tCheckUserExistResponse);
        // Act
        final result =
            await registerRepositoryImp!.checkUserExist(email: tUserEmail);
        // Assert
        expect(result, Right(tCheckUserExistResponse));
        verify(
            () => mockCheckUserExistApiImp!.checkUserExist(email: tUserEmail));
        verifyNoMoreInteractions(mockCheckUserExistApiImp);
      },
    );
    test(
      "check user exist should return error form send otp api",
      () async {
        // Arrange
        when(() => mockCheckUserExistApiImp!.checkUserExist(email: tUserEmail))
            .thenAnswer((_) async => tErrorCheckUserExistResponse);
        // Act
        final result =
            await registerRepositoryImp!.checkUserExist(email: tUserEmail);
        // Assert
        expect(result, Left(tErrorCheckUserExistResponse));
        verify(
            () => mockCheckUserExistApiImp!.checkUserExist(email: tUserEmail));
        verifyNoMoreInteractions(mockCheckUserExistApiImp);
      },
    );
  });

  group('Send Otp Feature Test', () {
    test(
      "send otp should return verification Id",
      () async {
        // Arrange
        when(() => mockSendOtpApiImp!.sendOtp(phoneNumber: tUserNumber))
            .thenAnswer((_) async => tSendOtpResponse);
        // Act
        final result =
            await registerRepositoryImp!.sendOtp(phoneNumber: tUserNumber);
        // Assert
        expect(result, Right(tSendOtpResponse));
        verify(() => mockSendOtpApiImp!.sendOtp(phoneNumber: tUserNumber));
        verifyNoMoreInteractions(mockSendOtpApiImp);
      },
    );
    test(
      "send otp should return error form send otp api",
      () async {
        // Arrange
        when(() => mockSendOtpApiImp!.sendOtp(phoneNumber: tUserNumber))
            .thenAnswer((_) async => tErrorSendOtpResponse);
        // Act
        final result =
            await registerRepositoryImp!.sendOtp(phoneNumber: tUserNumber);
        // Assert
        expect(result, Left(tErrorSendOtpResponse));
        verify(() => mockSendOtpApiImp!.sendOtp(phoneNumber: tUserNumber));
        verifyNoMoreInteractions(mockSendOtpApiImp);
      },
    );
  });
  group('verify Otp Feature Test', () {
    test(
      "verify otp should return verification Id",
      () async {
        // Arrange
        when(() => mockVerifyOtpApiImp!.verifyOtp(
                otpCode: tOtpCode, verificationId: tOtpVerificationId))
            .thenAnswer((_) async => tVerifyOtpResponse);
        // Act
        final result = await registerRepositoryImp!
            .verifyOtp(otpCode: tOtpCode, verificationId: tOtpVerificationId);
        // Assert
        expect(result, Right(tVerifyOtpResponse));
        verify(() => mockVerifyOtpApiImp!
            .verifyOtp(otpCode: tOtpCode, verificationId: tOtpVerificationId));
        verifyNoMoreInteractions(mockVerifyOtpApiImp);
      },
    );
    test(
      "verify otp should return error form verify otp api",
      () async {
        // Arrange
        when(() => mockVerifyOtpApiImp!.verifyOtp(
                otpCode: tOtpCode, verificationId: tOtpVerificationId))
            .thenAnswer((_) async => tErrorVerifyOtpResponse);
        // Act
        final result = await registerRepositoryImp!
            .verifyOtp(otpCode: tOtpCode, verificationId: tOtpVerificationId);
        // Assert
        expect(result, Left(tErrorVerifyOtpResponse));
        verify(() => mockVerifyOtpApiImp!
            .verifyOtp(otpCode: tOtpCode, verificationId: tOtpVerificationId));
        verifyNoMoreInteractions(mockVerifyOtpApiImp);
      },
    );
  });



  group('Register company Feature Test Group', () {
    test(
      "register company should return register response model",
          () async {
        // Arrange
        when(() => mockRegisterCompanyApiImp!
            .register(registerRequestModel: tRegisterRequestCompanyModel))
            .thenAnswer((_) async => tRegisterResponse);
        // Act
        final result = await registerRepositoryImp!
            .registerCompany(registerRequestModel: tRegisterRequestCompanyModel);
        // Assert
        expect(result, Right(tRegisterResponse));
        verify(() => mockRegisterCompanyApiImp!
            .register(registerRequestModel: tRegisterRequestCompanyModel));
        verifyNoMoreInteractions(mockRegisterApiImp);
      },
    );
    test(
      "register company  should return error form register api",
          () async {
        // Arrange
        when(() => mockRegisterCompanyApiImp!
            .register(registerRequestModel: tRegisterRequestCompanyModel))
            .thenAnswer((_) async => tErrorRegisterResponse);
        // Act
        final result = await registerRepositoryImp!
            .registerCompany(registerRequestModel: tRegisterRequestCompanyModel);
        // Assert
        expect(result, Left(tErrorRegisterResponse));
        verify(() => mockRegisterCompanyApiImp!
            .register(registerRequestModel: tRegisterRequestCompanyModel));
        verifyNoMoreInteractions(mockRegisterApiImp);
      },
    );
  });
}
