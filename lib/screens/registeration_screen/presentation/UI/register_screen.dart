import '../widgets/register_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utility/utility.dart';
import '../../../../shared_widgets/custom_screen_header.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Utility.changeStatusBarToWhite();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomScreenHeader(
                title: 'Create my account',
                imageWidth: 137.w,
                imageHeight: 39.h,
                hasBackButton: true),
            RegisterScreenBody(),
          ],
        ),
      ),
    );
  }
}
