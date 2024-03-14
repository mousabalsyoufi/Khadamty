
import '../../../../core/base_provider/base_provider.dart';
import '../../domain/usecase/forget_password_usecase.dart';

class ForgetPasswordProvider extends BaseProvider {

  final ForgetPasswordUseCase _forgetPasswordUseCase;

  ForgetPasswordProvider(this._forgetPasswordUseCase);
  // Verify mobile number function to check mobile number  and change state depended on return
  forgetPassword({required String username,required String email }) async {
    setLoading = true;
    var  forgetPasswordResult = await  _forgetPasswordUseCase(ForgetPasswordUseCaseParams(email: email));
    forgetPasswordResult.fold((error){
      setError = true;
    }, (response) {
      setLoading = false;
    });
  }
}