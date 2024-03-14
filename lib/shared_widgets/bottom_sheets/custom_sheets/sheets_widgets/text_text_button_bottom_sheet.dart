import 'package:faciltateur_de_vies/constants/text_styles/text_styles.dart';
import 'package:faciltateur_de_vies/shared_widgets/custom_button_black.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/colors/colors.dart';
import '../../widgets/bottom_sheet_header.dart';

class TextTextButtonBottomSheet extends StatelessWidget {
  const TextTextButtonBottomSheet({
    super.key,
    required this.headlineText,
    required this.contentText,
    required this.buttonText,
    required this.buttonTapFunction,
  });

  final String contentText;
  final String headlineText;
  final String buttonText;
  final Function buttonTapFunction;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 225.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r), topRight: Radius.circular(20.r)),
        color: AppColors.whiteColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 10.h,
          ),
          const BottomSheetHeader(),
          SizedBox(
            height: 30.h,
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  Text(
                    headlineText,
                    style: AppTextStyles.header2Inter,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Text(
                      contentText,
                      style: AppTextStyles.robotoRegularBlack(12.sp),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  CustomButtonBlack(
                      buttonContent: Text(  buttonText),
                      onPressed: () => buttonTapFunction())
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
