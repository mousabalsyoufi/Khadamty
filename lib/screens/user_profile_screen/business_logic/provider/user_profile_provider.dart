import 'package:faciltateur_de_vies/core/local_storage/storage_manager.dart';
import 'package:faciltateur_de_vies/core/utility/utility.dart';
import 'package:faciltateur_de_vies/screens/user_profile_screen/data/models/account_model.dart';
import 'package:faciltateur_de_vies/screens/user_profile_screen/data/models/upload_photo_model.dart';
import 'package:faciltateur_de_vies/screens/user_profile_screen/domain/usecase/delete_user_account_usecase.dart';
import 'package:faciltateur_de_vies/screens/user_profile_screen/domain/usecase/get_account_usecase.dart';
import 'package:faciltateur_de_vies/screens/user_profile_screen/domain/usecase/update_account_usecase.dart';
import 'package:faciltateur_de_vies/screens/user_profile_screen/domain/usecase/upload_photo_usecase.dart';

import '../../../../core/base_provider/base_provider.dart';

class UserProfileProvider extends BaseProvider {
  final DeleteUserAccountUseCase _deleteUserAccountUseCase;
  final GetAccountUseCase _getAccountUseCase;
  final UploadPhotoUseCase _uploadPhotoUseCase;

  final UpdateAccountUseCase _updateAccountUseCase;

  UserProfileProvider(this._deleteUserAccountUseCase, this._getAccountUseCase,
      this._updateAccountUseCase, this._uploadPhotoUseCase);

  AccountModel? account;
  bool isLoadingUpdate = false;

  // delete user accoint function to handle delete user account and change state
  Future<bool> deleteUserAccount({
    required String id,
  }) async {
    setLoading = true;
    Utility.showLoader();
    var deleteAccountResult =
        await _deleteUserAccountUseCase(DeleteUserAccountUseCaseParams(
      id: id,
    ));
    return deleteAccountResult.fold((error) {
      setError = true;
      setLoading = false;
      Utility.removeLoader();
      Utility.showToast(message: error.message);
      updateUi();
      return false;
    }, (response) {
      setLoading = false;
      Utility.removeLoader();
      return true;
    });
  }

  Future<bool> uploadPhoto({
    required String photo,
  }) async {
    setLoading = true;
    Utility.showLoader();
    var uploadPhotoResult = await _uploadPhotoUseCase(UploadPhotoUseCaseParams(
        requestModel: UploadPhotoModel(
            fileName:
                '${StorageManager.getFullName()}/photo/${DateTime.now().microsecondsSinceEpoch}',
            ref: StorageManager.getUserId(),
            modulePart: 'user',
            fileContent: photo,
            fileEncoding: 'base64')));
    return uploadPhotoResult.fold((error) {
      setError = true;
      setLoading = false;
      Utility.removeLoader();
      Utility.showToast(message: error.message);
      updateUi();
      return false;
    }, (response) {
      setLoading = false;
      Utility.removeLoader();
      updateUi();
      return true;
    });
  }

  getAccount() async {
    setLoading = true;
    updateUi();
    var getAccountResult = await _getAccountUseCase(GetAccountUseCaseParams());
    return getAccountResult.fold((error) {
      setError = true;
      setLoading = false;
      Utility.showToast(message: error.message);
      updateUi();
    }, (response) {
      setLoading = false;
      account = response.data!;
      updateUi();
    });
  }

  Future<AccountModel?> updateAccount(
      {required int id, required AccountModel accountModel}) async {
    isLoadingUpdate = true;
    updateUi();
    var updateAccountUseCase = await _updateAccountUseCase(
        UpdateAccountUseCaseParams(accountModel: accountModel, id: id));
    return updateAccountUseCase.fold((error) {
      setError = true;
      isLoadingUpdate = false;
      Utility.showToast(message: error.message);
      updateUi();
      return null;
    }, (response) {
      isLoadingUpdate = false;
      updateUi();
      return accountModel;
    });
  }
}
