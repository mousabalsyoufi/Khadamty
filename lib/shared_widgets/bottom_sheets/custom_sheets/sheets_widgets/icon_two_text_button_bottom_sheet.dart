import 'package:faciltateur_de_vies/constants/text_styles/text_styles.dart';
import 'package:faciltateur_de_vies/shared_widgets/bottom_sheets/widgets/small_bottom_sheet_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../constants/colors/colors.dart';
import '../../widgets/bottom_sheet_header.dart';

class IconTextTextButtonBottomSheet extends StatelessWidget {
  const IconTextTextButtonBottomSheet({
    super.key,
    required this.iconPath,
    required this.headlineText,
    required this.contentText,
    required this.acceptButtonText,
    required this.acceptButtonTapFunction,
    required this.acceptButtonColor,
    required this.acceptButtonStyle,
    required this.buttonWidth,
    required this.borderColor,
  });
  final String iconPath;
  final Color borderColor;
  final String headlineText;
  final String contentText;
  final String acceptButtonText;
  final Color acceptButtonColor;
  final Function acceptButtonTapFunction;
  final TextStyle acceptButtonStyle;
  final double buttonWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 414.h,
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
                  SvgPicture.asset(
                    iconPath,
                    width: 99.r,
                    height: 180.r,
                  ),
                  SizedBox(height: 30.h,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 70.w),
                    child: Text(
                      headlineText,
                      style: AppTextStyles.header2Inter,
                    ),
                  ),
                  SizedBox(
                    height: 11.h,
                  ),
                  Text(
                    contentText,
                    style: AppTextStyles.robotoRegularBlack(12.sp),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 35.h,
                  ),
                  SmallBottomSheetButton(
                    buttonText: acceptButtonText,
                    onPressed: acceptButtonTapFunction,
                    buttonTextStyle: acceptButtonStyle,
                    buttonColor: acceptButtonColor,
                    buttonWidth: buttonWidth,
                    borderColor: borderColor,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
