import 'package:faciltateur_de_vies/constants/enums/user_type.dart';
import 'package:faciltateur_de_vies/screens/registeration_screen/data/model/register_comany_model.dart';
import 'package:faciltateur_de_vies/screens/registeration_screen/data/model/register_request_model.dart';
import 'package:faciltateur_de_vies/screens/registeration_screen/domain/usecase/check_user_exist_usecase.dart';
import 'package:faciltateur_de_vies/screens/registeration_screen/domain/usecase/register_company_usecase.dart';
import 'package:faciltateur_de_vies/screens/registeration_screen/domain/usecase/send_otp_usecase.dart';
import 'package:faciltateur_de_vies/screens/registeration_screen/domain/usecase/verify_otp_usecase.dart';

import '../../../../core/base_provider/base_provider.dart';
import '../../../../core/utility/utility.dart';
import '../../domain/usecase/register_usecase.dart';

class RegisterProvider extends BaseProvider {
  final RegisterUseCase registerUseCase;
  final RegisterCompanyUseCase registerCompanyUseCase;

  final SendOtpUseCase sendOtpUseCase;
  final VerifyOtpUseCase verifyOtpUseCase;
  final CheckUserExistUseCase checkUserExistUseCase;

  UserType _userType = UserType.user;

  UserType get userType => _userType;

  String _fullName = '';
  String get fullName => _fullName;
  String _email = '';
  String get email => _email;
  String _phoneNumber = '';
  String get phoneNumber => _phoneNumber;
  String _password = '';
  String get password => _password;

  String _otpVerificationId = '';


  RegisterRequestCompanyModel? requestCompanyModel;

  RegisterProvider(
      {required this.registerUseCase,
      required this.sendOtpUseCase,
      required this.verifyOtpUseCase,
      required this.registerCompanyUseCase,
      required this.checkUserExistUseCase});

  // register function to handle register and change state depended on return
  Future<bool> register(
      {required RegisterRequestModel registerRequestModel}) async {
    setLoading = true;
    updateUi();
    var registerResult = await registerUseCase(
        RegisterUseCaseParams(registerRequestModel: registerRequestModel));
    return registerResult.fold((error) {
      setError = true;
      setLoading = false;
      Utility.showToast(message: error.message);
      updateUi();
      return false;
    }, (response) {
      setLoading = false;
      updateUi();
      Utility.showToast(message: response.message!);
      return true;
    });
  }

  // check user exist function to check if a user is already registered with that email
  Future<bool> checkUserExist({required String email}) async {
    setLoading = true;
    updateUi();
    var checkUserExistResult =
        await checkUserExistUseCase(CheckUserExistUseCaseParams(email: email));
    return checkUserExistResult.fold((error) {
      setError = true;
      setLoading = false;
      Utility.showToast(message: error.message);
      updateUi();
      return false;
    }, (response) {
       setLoading = false;
      updateUi();
      return true;
    });
  }

  // send otp function to handle sending otp to the user number
  Future<bool> sendOtp({required String phoneNumber}) async {
    setLoading = true;
    updateUi();
    var sendOtpResult =
        await sendOtpUseCase(SendOtpUseCaseParams(phoneNumber: phoneNumber));
    return sendOtpResult.fold((error) {
      setError = true;
      setLoading = false;
      Utility.showToast(message: error.message);
      updateUi();
      return false;
    }, (response) {
      setLoading = false;
      updateUi();
      Utility.showToast(message: response.message!);
      _otpVerificationId = response.data!;
      return true;
    });
  }

  // verify otp function to handle verifying otp
  Future<bool> verifyOtp({required String otpCode}) async {
    setLoading = true;
    updateUi();
    var verifyOtpResult = await verifyOtpUseCase(VerifyOtpUseCaseParams(
        otpCode: otpCode, verificationId: _otpVerificationId));
    return verifyOtpResult.fold((error) {
      setError = true;
      setLoading = false;
      Utility.showToast(message: error.message);
      updateUi();
      return false;
    }, (response) {
      setLoading = false;
      updateUi();
      if (_otpVerificationId == response.data!.sid &&
          response.data!.status == 'approved') {
        Utility.showToast(message: response.message!);
        return true;
      } else {
        Utility.showToast(message: 'The code you inserted is not correct');
        return false;
      }
    });
  }

  setUserRegisterAccountData({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) {
    _fullName = name;
    _email = email;
    _phoneNumber = phone;
    _password = password;
  }

  changeUserType(UserType userType) {
    _userType = userType;
    notifyListeners();
  }


  // register company function to handle register and change state depended on return
  Future<bool> registerCompany(
      {required RegisterRequestCompanyModel registerRequestModel}) async {
    setLoading = true;
    updateUi();
    var registerResult = await registerCompanyUseCase(RegisterCompanyUseCaseParams(registerRequestModel: registerRequestModel));
    return registerResult.fold((error) {
      setError = true;
      setLoading = false;
      Utility.showToast(message: error.message);
      updateUi();
      return false;
    }, (response) {
      setLoading = false;
      updateUi();
      Utility.showToast(message: response.message!);
      return true;
    });
  }




  setUserRegisterCompanyAccountData({
    required String name,
    required String email,
    required String phone,
    required String password,
     String? label,
     String? iban,
  }) {
    requestCompanyModel =  RegisterRequestCompanyModel(
        fullName: name,
        email: email,
        phoneNumber: phone,
        password: password,
        groupId:  '2',
        type: 0,
        iban: iban,
        label: label,

    );
  }
}
