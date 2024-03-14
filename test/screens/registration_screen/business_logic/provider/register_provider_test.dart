import 'package:faciltateur_de_vies/screens/registeration_screen/bussiness_logic/provider/register_provider.dart';
import 'package:faciltateur_de_vies/screens/registeration_screen/domain/usecase/check_user_exist_usecase.dart';
import 'package:faciltateur_de_vies/screens/registeration_screen/domain/usecase/register_company_usecase.dart';
import 'package:faciltateur_de_vies/screens/registeration_screen/domain/usecase/register_usecase.dart';
import 'package:faciltateur_de_vies/screens/registeration_screen/domain/usecase/send_otp_usecase.dart';
import 'package:faciltateur_de_vies/screens/registeration_screen/domain/usecase/verify_otp_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockRegisterUseCase extends Mock implements RegisterUseCase {}

class MockSendOtpUseCase extends Mock implements SendOtpUseCase {}

class MockVerifyOtpUseCase extends Mock implements VerifyOtpUseCase {}

class MockCheckUserExistUseCase extends Mock implements CheckUserExistUseCase {}

class MockRegisterCompanyUseCase extends Mock implements RegisterCompanyUseCase {}


void main() async {
  late MockRegisterUseCase? mockRegisterUseCase;
  late MockSendOtpUseCase? mockSendOtpUseCase;
  late MockVerifyOtpUseCase? mockVerifyOtpUseCase;
  late MockRegisterCompanyUseCase? mockRegisterCompanyUseCase;
  late MockCheckUserExistUseCase? mockCheckUserExistUseCase;
  late RegisterProvider? registerProvider;
  setUp(() {
    mockRegisterUseCase = MockRegisterUseCase();
    mockSendOtpUseCase = MockSendOtpUseCase();
    mockRegisterCompanyUseCase  =MockRegisterCompanyUseCase();
    mockVerifyOtpUseCase = MockVerifyOtpUseCase();
    mockCheckUserExistUseCase = MockCheckUserExistUseCase();
    registerProvider = RegisterProvider(
        registerCompanyUseCase: mockRegisterCompanyUseCase!,
        registerUseCase: mockRegisterUseCase!,
        sendOtpUseCase: mockSendOtpUseCase!,
        verifyOtpUseCase: mockVerifyOtpUseCase!,
        checkUserExistUseCase: mockCheckUserExistUseCase!);
  });

  group('test register functionality in provider', () {
    test(
      "initial values of provider should be correct",
      () async {
        // Assert
        expect(registerProvider!.isLoading, false);
        expect(registerProvider!.isError, false);
      },
    );
  });
}
