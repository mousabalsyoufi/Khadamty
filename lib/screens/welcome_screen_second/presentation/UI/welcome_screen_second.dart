
import '../../../../core/utility/utility.dart';
import '../../../../shared_widgets/custom_button_black.dart';
import '../../../../shared_widgets/custom_button_white.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/enums/user_type.dart';
import '../../../../constants/text_styles/text_styles.dart';
import '../../../../core/local_storage/storage_manager.dart';
import '../../../../routes/routes_names/routes_names.dart';
import '../../../../routes/routes_provider/routes_provider.dart';
import '../../../../shared_widgets/custom_screen_header.dart';
class WelcomeScreenSecond extends StatelessWidget {
  const WelcomeScreenSecond({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Utility.changeStatusBarToWhite();
    return Scaffold(
      body: Column(
        children: [
          CustomScreenHeader(
            title: 'Welcome',
            imageWidth: 215.w,
            imageHeight: 61.h,
            hasBackButton: true,
          ),

          SizedBox(
            height: 70.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: CustomButtonBlack(
                buttonContent: const Text(  'Sign in')  ,
                onPressed: () {
                  RoutingProvider.pushNamed(routeName: Routes.loginScreen);
                }),
          ),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: CustomButtonWhite(
                buttonText: 'Create my account',
                onPressed: () {
                  RoutingProvider.pushNamed(routeName: Routes.registerScreen);
                }),
          ),
          const Spacer(),
          Align(
            alignment: Alignment.bottomCenter,
            child: InkWell(
              onTap: () {
                StorageManager.setUserType(UserType.guest);
                RoutingProvider.pushNamedAndRemoveAllBack(
                    routeName: Routes.mainScreen);
              },
              child: Text(
                'Continue without account',
                style: AppTextStyles.robotoBoldBlack(16.sp),
              ),
            ),
          ),
          SizedBox(
            height: 70.h,
          ),
        ],
      ),
    );
  }
}
