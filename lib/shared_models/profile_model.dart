import 'package:faciltateur_de_vies/constants/icons/icons.dart';
import 'package:faciltateur_de_vies/routes/routes_names/routes_names.dart';

class ProfileOptionModel {
  final String iconName;
  final String title;
  final bool isTrailingIcon;
  final String screenName;

  ProfileOptionModel(
      {required this.iconName,
      required this.title,
      required this.screenName,
      required this.isTrailingIcon});
}

List<ProfileOptionModel> easerProfileOptions = [
  ProfileOptionModel(
      title: 'Personal data',
      iconName: AppIcons.personalDataIcon,
      isTrailingIcon: true,
      screenName: Routes.easerPersonalDataScreen),
  ProfileOptionModel(
      title: 'Dashboard',
      iconName: AppIcons.dashboardIcon,
      isTrailingIcon: true,
      screenName: Routes.easerDashboardScreen),
  ProfileOptionModel(
      title: 'My bonus',
      iconName: AppIcons.myBonusIcon,
      isTrailingIcon: true,
      screenName: Routes.easerbonusScreeen),
  ProfileOptionModel(
      title: 'Reset Password',
      iconName: AppIcons.settingsIcon,
      isTrailingIcon: true,
      screenName: Routes.forgetPasswordScreen),
  ProfileOptionModel(
    title: 'Equipment catalog',
    iconName: AppIcons.equipmentCatalogIcon,
    isTrailingIcon: true,
    screenName: Routes.easerCatalogScreen,
  ),
  ProfileOptionModel(
      title: 'Log out',
      iconName: AppIcons.logoutIcon,
      isTrailingIcon: false,
      screenName: Routes.loginScreen),
];
List<ProfileOptionModel> userProfileOptions = [
  ProfileOptionModel(
      title: 'Personal data',
      iconName: AppIcons.personalDataIcon,
      isTrailingIcon: true,
      screenName: Routes.userPersonalDataScreeen),
  ProfileOptionModel(
      title: 'My addresses',
      iconName: AppIcons.addressesIcon,
      isTrailingIcon: true,
      screenName: Routes.userAddressesScreen),
  ProfileOptionModel(
      title: 'Reset Password',
      iconName: AppIcons.settingsIcon,
      isTrailingIcon: true,
      screenName: Routes.forgetPasswordScreen),
  ProfileOptionModel(
      title: 'Become an employee',
      iconName: AppIcons.becomeEmplyeeIcon,
      isTrailingIcon: true,
      screenName: Routes.userBecomeEmployeeScreen),
  ProfileOptionModel(
      title: 'Delete your account',
      iconName: AppIcons.removeIcon,
      isTrailingIcon: false,
      screenName: 'delete_account'),
  ProfileOptionModel(
      title: 'Log out',
      iconName: AppIcons.logoutIcon,
      isTrailingIcon: false,
      screenName: Routes.loginScreen),
];
List<ProfileOptionModel> subscribedUserProfileOptions = [
  ProfileOptionModel(
      title: 'Personal data',
      iconName: AppIcons.personalDataIcon,
      isTrailingIcon: true,
      screenName: Routes.userPersonalDataScreeen),
  ProfileOptionModel(
      title: 'My addresses',
      iconName: AppIcons.addressesIcon,
      isTrailingIcon: true,
      screenName: Routes.userAddressesScreen),
  ProfileOptionModel(
      title: 'My points',
      iconName: AppIcons.myBonusIcon,
      isTrailingIcon: true,
      screenName: Routes.userPointsScreen),
  ProfileOptionModel(
      title: 'Reset Password',
      iconName: AppIcons.settingsIcon,
      isTrailingIcon: true,
      screenName: Routes.forgetPasswordScreen),
  ProfileOptionModel(
      title: 'Become an employee',
      iconName: AppIcons.becomeEmplyeeIcon,
      isTrailingIcon: true,
      screenName: Routes.userBecomeEmployeeScreen),
  ProfileOptionModel(
      title: 'Delete your account',
      iconName: AppIcons.removeIcon,
      isTrailingIcon: false,
      screenName: 'delete_account'),
  ProfileOptionModel(
      title: 'Log out',
      iconName: AppIcons.logoutIcon,
      isTrailingIcon: false,
      screenName: Routes.loginScreen),
];
