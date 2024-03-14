import 'package:faciltateur_de_vies/shared_widgets/custom_button_black.dart';
import 'package:faciltateur_de_vies/shared_widgets/custom_input_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/colors/colors.dart';
import '../../../../constants/text_styles/text_styles.dart';
import '../../../../core/utility/custom_validator.dart';
import '../../../../shared_widgets/custom_appbar.dart';

class EaserSettingsScreen extends StatelessWidget {
  EaserSettingsScreen({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        appBar: customAppBar("Settings"),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.all(20.r),
          child: CustomButtonBlack(
            onPressed: () {},
            buttonContent: const Text('Save Changes'),  
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 29.h),
            child: Form(
              key: _formKey,
              child: Container(
                decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(5.r)),
                padding: EdgeInsets.all(20.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Current password",
                      style: AppTextStyles.robotoBoldBlack(12.sp),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    CustomTextField(
                      fillColor: AppColors.grey10Color,
                      hint: 'current password',
                      textInputAction: TextInputAction.next,
                      hintStyle: AppTextStyles.robotoRegularGrey50
                          .copyWith(fontSize: 14.sp),
                      onValid: (value) => CustomValidator.isRequired(value),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      "New password",
                      style: AppTextStyles.robotoBoldBlack(12.sp),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    CustomTextField(
                      fillColor: AppColors.grey10Color,
                      textInputAction: TextInputAction.next,
                      hint: 'new password',
                      hintStyle: AppTextStyles.robotoRegularGrey50
                          .copyWith(fontSize: 14.sp),
                      onValid: (value) => CustomValidator.isRequired(value),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      "Confirm new password",
                      style: AppTextStyles.robotoBoldBlack(12.sp),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    CustomTextField(
                      fillColor: AppColors.grey10Color,
                      hint: 'confirm new password',
                      hintStyle: AppTextStyles.robotoRegularGrey50
                          .copyWith(fontSize: 14.sp),
                      onValid: (value) => CustomValidator.isRequired(value),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
