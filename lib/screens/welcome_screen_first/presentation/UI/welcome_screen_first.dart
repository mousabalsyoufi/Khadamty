
import '../../../../constants/enums/user_type.dart';
import '../../../../core/local_storage/storage_manager.dart';
import '../../../../routes/routes_names/routes_names.dart';
import '../../../../shared_widgets/custom_button_black.dart';
import '../../../../shared_widgets/custom_button_white.dart';
import '../../../../shared_widgets/custom_screen_header.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utility/utility.dart';
import '../../../../routes/routes_provider/routes_provider.dart';

class WelcomeScreenFirst extends StatelessWidget {
  const WelcomeScreenFirst({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Utility.changeStatusBarToWhite();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomScreenHeader(
                title: 'Welcome', imageWidth: 215.w, imageHeight: 61.h),
            SizedBox(
              height: 70.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: CustomButtonBlack(
                  buttonContent: const Text(  'I am a User')  ,
                  onPressed: () {
                    StorageManager.setUserType(UserType.user);
                    RoutingProvider.pushNamed(
                        routeName: Routes.welcomeScreenSecond);
                  }),
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: CustomButtonWhite(
                  buttonText: 'I am an Easer',
                  onPressed: () {
                    StorageManager.setUserType(UserType.easer);
                    RoutingProvider.pushNamed(routeName: Routes.loginScreen);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
