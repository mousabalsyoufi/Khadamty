
import '../../../../core/base_provider/base_provider.dart';
import '../../domain/usecase/verify_mobile_number_usecase.dart';

class VerifyMobileNumberProvider extends BaseProvider {

  final VerifyMobileNumberUseCase _verifyMobileNumberUseCase;

  VerifyMobileNumberProvider(this._verifyMobileNumberUseCase);
  // Verify mobile number function to check mobile number  and change state depended on return
  login({required String username,required String mobileNumber }) async {
    setLoading = true;
    var  verifyMobileNumberResult = await  _verifyMobileNumberUseCase(VerifyMobileNumberUseCaseParams(mobileNumber: mobileNumber));
    verifyMobileNumberResult.fold((error){
      setError = true;
    }, (response) {
      setLoading = false;
    });
  }
}