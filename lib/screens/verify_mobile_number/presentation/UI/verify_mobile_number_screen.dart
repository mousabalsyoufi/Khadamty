import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/text_styles/text_styles.dart';
import '../../../../core/utility/utility.dart';
import '../../../../shared_widgets/custom_back_button.dart';
import '../../../../shared_widgets/custom_button_black.dart';
import '../../../../shared_widgets/custom_input_text.dart';

class VerifyMobileNumberScreen extends StatelessWidget {
  const VerifyMobileNumberScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Utility.changeStatusBarToTransparent();
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Positioned(
              top: 50.h,
              left: 20.w,
              child: const CustomBackButton(),
            ),
            Column(
              children: [
                SizedBox(
                  height: 240.h,
                ),
                Text("Verify your phone number",
                    style: AppTextStyles.header1Inter),
                SizedBox(
                  height: 23.h,
                ),
                Text("You will receive a code by SMS:",
                    style: AppTextStyles.robotoRegularBlack(14.sp)),
                SizedBox(
                  height: 44.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: const CustomTextField(
                    hint: '+33 00 00 00 00 00',
                  ),
                ),
                SizedBox(
                  height: 44.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: CustomButtonBlack(
                      buttonContent: const Text(  'Check')  , onPressed: () {}),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
