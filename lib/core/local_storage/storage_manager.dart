/// Storage to save token in local device
import 'package:faciltateur_de_vies/constants/enums/app_subscribtions.dart';
import 'package:faciltateur_de_vies/constants/enums/user_type.dart';
import 'package:faciltateur_de_vies/constants/prefs_keys/prefs_keys.dart';
import 'package:faciltateur_de_vies/core/singletons/singletons.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// This class to handle the operation store and get values from local storage in the device
class StorageManager {
  static final SharedPreferences _sharedPreferences =
      getIt<SharedPreferences>();
  static final FlutterSecureStorage _secureStorage =
      getIt<FlutterSecureStorage>();

  /// This fun to store user Id locally in the client device
  static void setUserId(String userId) {
    _sharedPreferences.setString(PrefsKeys.userID, userId);
  }

  /// This fun to get user id from db locally in the client device
  static String getUserId() {
    return _sharedPreferences.getString(
      PrefsKeys.userID,
    )!;
  }

  /// This fun to store user soc Id locally in the client device
  static void setUserSocId(String userSocId) {
    _sharedPreferences.setString(PrefsKeys.userSocID, userSocId);
  }

  /// This fun to get user soc id from db locally in the client device

  static String getUserSocId() {
    return _sharedPreferences.getString(
      PrefsKeys.userSocID,
    )!;
  }

  /// This fun to store user type locally in the client device
  static void setUserType(UserType userType) {
    _sharedPreferences.setInt(
        PrefsKeys.userType, UserType.values.indexOf(userType));
  }

  /// This fun to get user type from db locally in the client device

  static UserType getUserType() {
    return UserType.values[_sharedPreferences.getInt(
      PrefsKeys.userType,
    )!];
  }

  /// This fun to store user Subscription locally in the client device
  /// 0 for initial , 1 for premium
  static void setUserSubscription(int subscription) {
    _sharedPreferences.setInt(PrefsKeys.userSubscription, subscription);
  }

  /// This fun to get user Subscription type from db locally in the client device
  static AppSubscribtion getUserSubscription() {
    return AppSubscribtion.values[_sharedPreferences.getInt(
      PrefsKeys.userSubscription,
    )!];
  }

  static void removeUserData() {
    _sharedPreferences.remove(
      PrefsKeys.userID,
    );
    _sharedPreferences.remove(
      PrefsKeys.userSocID,
    );
    _secureStorage.delete(
      key: PrefsKeys.userToken,
    );

    _sharedPreferences.remove(PrefsKeys.fullName);

    _sharedPreferences.remove(PrefsKeys.email);

    _sharedPreferences.setBool(PrefsKeys.userLoggedIn, false);
  }

  /// This fun to get user logged in status  from db locally in the client device

  static bool? getUserLoggedStatus() {
    return _sharedPreferences.getBool(
      PrefsKeys.userLoggedIn,
    );
  }

  /// This fun to store user logged In  locally in the client device

  static void setUserLoggedIn() {
    _sharedPreferences.setBool(PrefsKeys.userLoggedIn, true);
  }

  /// This fun to store user logged out locally in the client device

  static void setUserLoggedOut() {
    _sharedPreferences.setBool(PrefsKeys.userLoggedIn, false);
  }

  /// This fun to get user token from db locally in the client device

  static Future<String?> getUserToken() async {
    String? t = await _secureStorage.read(key: PrefsKeys.userToken);
    return t;
  }

  /// This fun to store user token locally in the client device

  static void setUserToken(String token) {
    _secureStorage.write(key: PrefsKeys.userToken, value: token);
  }

  // This fun is to get if the user has urssaf account
  static bool? getUserUrssaf() {
    return _sharedPreferences.getBool(
      PrefsKeys.userUrssaf,
    );
  }

  /// This fun to store if the user has urssaf account

  static void setUserUrssaf(bool hasUrssaf) {
    _sharedPreferences.setBool(PrefsKeys.userUrssaf, hasUrssaf);
  }

  /// This fun to store user email locally in the client device

  static void setEmail(String email) {
    _sharedPreferences.setString(PrefsKeys.email, email);
  }

  /// This fun to get user email from db locally in the client device

  static String? getEmail() {
    return _sharedPreferences.getString(
      PrefsKeys.email,
    );
  }

  /// This fun to store user full name locally in the client device

  static void setFullName(String fullName) {
    _sharedPreferences.setString(PrefsKeys.fullName, fullName);
  }

  /// This fun to get user full name from db locally in the client device

  static String? getFullName() {
    return _sharedPreferences.getString(
      PrefsKeys.fullName,
    );
  }

  /// This fun to store user photo locally in the client device

  static void setUserPhoto(String photo) {
    _sharedPreferences.setString(PrefsKeys.photo, photo);
  }

  /// This fun to get user photo from db locally in the client device

  static String? getUserPhoto() {
    return _sharedPreferences.getString(
      PrefsKeys.photo,
    );
  }

  /// This fun to store user address locally in the client device

  static void setUserAddresses(String addressesJson) {
    _sharedPreferences.setString(PrefsKeys.userAddresses, addressesJson);
  }

  /// This fun to get user address from db locally in the client device

  static String? getUserAddresses() {
    return _sharedPreferences.getString(
      PrefsKeys.userAddresses,
    );
  }
}
