import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:faciltateur_de_vies/constants/colors/colors.dart';
import 'package:faciltateur_de_vies/constants/enums/user_type.dart';
import 'package:faciltateur_de_vies/constants/icons/icons.dart';
import 'package:faciltateur_de_vies/constants/text_styles/text_styles.dart';
import 'package:faciltateur_de_vies/core/local_storage/storage_manager.dart';
import 'package:faciltateur_de_vies/core/utility/utility.dart';
import 'package:faciltateur_de_vies/screens/easer_help_screen/presentation/UI/easer_help_screen.dart';
import 'package:faciltateur_de_vies/screens/easer_home_screen/presentation/UI/easer_home_screen.dart';
import 'package:faciltateur_de_vies/screens/easer_profile_screen/presentation/UI/easer_profile_screen.dart';
import 'package:faciltateur_de_vies/screens/easer_services_history_screen/presentation/UI/easer_services_history_screen.dart';
import 'package:faciltateur_de_vies/screens/main_screen/business_logic/provider/main_provider.dart';
import 'package:faciltateur_de_vies/screens/main_screen/presentation/widgets/easer_main_header.dart';
import 'package:faciltateur_de_vies/screens/main_screen/presentation/widgets/guest_main_header.dart';
import 'package:faciltateur_de_vies/screens/main_screen/presentation/widgets/user_main_header.dart';
import 'package:faciltateur_de_vies/screens/user_bookings_screen/presentation/UI/user_bookings_screen.dart';
import 'package:faciltateur_de_vies/screens/user_home_screen/presentation/UI/user_home_screen.dart';
import 'package:faciltateur_de_vies/screens/user_profile_screen/presentation/UI/user_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../guest_home_screen.dart/presentation/UI/guest_home_screen.dart';
import '../../../guest_profile_screen/presentation/UI/guest_profile_screen.dart';
import '../../../shared_help_screen/presentation/UI/shared_help_screen.dart';
import '../../../shared_services_categories_screen/presentation/UI/shared_services_categories_screen.dart';
import '../widgets/subscribed_user_main_header.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  List<Widget> screens = [];
  UserType userType = UserType.guest;

  @override
  void initState() {
    userType = StorageManager.getUserType();
    super.initState();
    _initScreens();
  }

  @override
  Widget build(BuildContext context) {
    Utility.changeStatusBarToGrey();
    return Consumer<MainProvider>(builder: (context, mainProvider, child) {
      return SafeArea(
        child: Scaffold(
            extendBody: true,
            body: Column(
              children: [
                SizedBox(
                  height: 10.h,
                ),
                _getHeaderWidget(),
                Expanded(child: screens[mainProvider.activeScreenIndex])
              ],
            ),
            floatingActionButton: userType == UserType.user ||
                    userType == UserType.subscribedUser
                ? Container(
                    width: 70.w,
                    height: 70.h,
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: AppColors.blackColor, width: 3.0.r),
                      shape: BoxShape.circle,
                    ),
                    child: FittedBox(
                      child: FloatingActionButton(
                        elevation: 0.0,
                        heroTag: null,
                        onPressed: (() {
                          mainProvider.changeActiveScreen(4);
                        }),
                        backgroundColor: mainProvider.activeScreenIndex == 4
                            ? AppColors.greenColor
                            : AppColors.whiteColor,
                        child: SvgPicture.asset(
                          AppIcons.bookingsIcon,
                          width: 16.w,
                          height: 16.h,
                        ),
                      ),
                    ),
                  )
                : null,
            floatingActionButtonLocation:
                userType == UserType.user || userType == UserType.subscribedUser
                    ? FloatingActionButtonLocation.centerDocked
                    : null,
            bottomNavigationBar: _getBottomNavigationBar(mainProvider)),
      );
    });
  }

  Widget _getHeaderWidget() {
    switch (userType) {
      case UserType.guest:
        return const GuestMainHeader();
      case UserType.user:
        return UserMainHeader();
      case UserType.subscribedUser:
        return SubscribedUserMainHeader();
      case UserType.easer:
        return EaserMainHeader();
      default:
        return const GuestMainHeader();
    }
  }

  Widget _getBottomNavigationBar(MainProvider mainProvider) {
    return AnimatedBottomNavigationBar.builder(
      itemCount: 4,
      height: 69.h,
      tabBuilder: ((index, isActive) {
        switch (userType) {
          case UserType.guest:
            switch (index) {
              case 0:
                return isActive
                    ? _getActiveIconWidget(
                        iconPath: AppIcons.homeIcon, underText: 'Home')
                    : _getInactiveIconWidget(iconPath: AppIcons.homeIcon);
              case 1:
                return isActive
                    ? _getActiveIconWidget(
                        iconPath: AppIcons.categoryIcon, underText: 'Services')
                    : _getInactiveIconWidget(iconPath: AppIcons.categoryIcon);
              case 2:
                return isActive
                    ? _getActiveIconWidget(
                        iconPath: AppIcons.assistanceIconActive,
                        underText: 'Help')
                    : _getInactiveIconWidget(
                        iconPath: AppIcons.assistanceIconInactive);
              case 3:
                return isActive
                    ? _getActiveIconWidget(
                        iconPath: AppIcons.userIcon, underText: 'profile')
                    : _getInactiveIconWidget(iconPath: AppIcons.userIcon);
              default:
                return Container();
            }
          case UserType.user:
          case UserType.subscribedUser:
            switch (index) {
              case 0:
                return isActive
                    ? _getActiveIconWidget(
                        iconPath: AppIcons.homeIcon, underText: 'Home')
                    : _getInactiveIconWidget(iconPath: AppIcons.homeIcon);
              case 1:
                return isActive
                    ? _getActiveIconWidget(
                        iconPath: AppIcons.categoryIcon, underText: 'Services')
                    : _getInactiveIconWidget(iconPath: AppIcons.categoryIcon);
              case 2:
                return isActive
                    ? _getActiveIconWidget(
                        iconPath: AppIcons.userChatIconActive,
                        underText: 'Communication')
                    : _getInactiveIconWidget(
                        iconPath: AppIcons.userChatIconInactive);
              case 3:
                return isActive
                    ? _getActiveIconWidget(
                        iconPath: AppIcons.userIcon, underText: 'profile')
                    : _getInactiveIconWidget(iconPath: AppIcons.userIcon);
              default:
                return Container();
            }
          case UserType.easer:
            switch (index) {
              case 0:
                return isActive
                    ? _getActiveIconWidget(
                        iconPath: AppIcons.homeIcon, underText: 'Home')
                    : _getInactiveIconWidget(iconPath: AppIcons.homeIcon);
              case 1:
                return isActive
                    ? _getActiveIconWidget(
                        iconPath: AppIcons.evaluationIcon, underText: 'Rating')
                    : _getInactiveIconWidget(iconPath: AppIcons.evaluationIcon);
              case 2:
                return isActive
                    ? _getActiveIconWidget(
                        iconPath: AppIcons.easerChatIconActive,
                        underText: 'Communication')
                    : _getInactiveIconWidget(
                        iconPath: AppIcons.easerChatIconInactive);
              case 3:
                return isActive
                    ? _getActiveIconWidget(
                        iconPath: AppIcons.userIcon, underText: 'profile')
                    : _getInactiveIconWidget(iconPath: AppIcons.userIcon);
              default:
                return Container();
            }
          default:
            return Container();
        }
      }),
      activeIndex: mainProvider.activeScreenIndex,
      gapLocation:
          userType == UserType.user || userType == UserType.subscribedUser
              ? GapLocation.center
              : GapLocation.none,
      notchSmoothness:
          userType == UserType.user || userType == UserType.subscribedUser
              ? NotchSmoothness.softEdge
              : NotchSmoothness.defaultEdge,
      leftCornerRadius: 20.r,
      rightCornerRadius: 20.r,
      backgroundColor: Colors.black,
      onTap: (index) {
        mainProvider.changeActiveScreen(index);
      },
    );
  }

  _initScreens() {
    switch (userType) {
      case UserType.guest:
        screens = [
          const GuestHomeScreen(),
          const SharedServicesCategoriesScreen(),
          const SharedHelpScreen(),
          const GuestProfileScreen(),
        ];
        break;
      case UserType.user:
      case UserType.subscribedUser:
        screens = [
          const UserHomeScreen(),
          const SharedServicesCategoriesScreen(),
          const SharedHelpScreen(),
          const UserProfileScreen(),
          const UserBookingsScreen(),
        ];
        break;
      case UserType.easer:
        screens = [
          const EaserHomeScreen(),
          const EaserServicesHistoryScreen(),
          const EaserHelpScreen(),
          const EaserProfileScreen(),
        ];
        break;
      default:
        screens = [
          Container(),
          Container(),
          Container(),
          Container(),
        ];
        break;
    }
  }

  Widget _getInactiveIconWidget({
    required String iconPath,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          iconPath,
          width: 20.w,
          height: 20.h,
        ),
      ],
    );
  }

  Widget _getActiveIconWidget(
      {required String iconPath, required String underText}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _getTopIconLine(),
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 20.h,
            ),
            SvgPicture.asset(
              iconPath,
              width: 20.w,
              height: 20.h,
              color: AppColors.greenColor,
            ),
            SizedBox(
              height: 9.h,
            ),
            Text(
              underText,
              style: AppTextStyles.interExtraBold(8.sp),
            )
          ],
        ),
      ],
    );
  }

  Widget _getTopIconLine() {
    return Container(
      height: 3.h,
      width: 30.w,
      decoration: BoxDecoration(
          color: AppColors.greenColor,
          borderRadius: BorderRadius.circular(5.r)),
    );
  }
}
