import 'package:faciltateur_de_vies/constants/text_styles/text_styles.dart';
import 'package:faciltateur_de_vies/shared_widgets/bottom_sheets/widgets/small_bottom_sheet_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/colors/colors.dart';
import '../../widgets/bottom_sheet_header.dart';

class TextTextTwoButtonBottomSheet extends StatelessWidget {
  const TextTextTwoButtonBottomSheet({
    super.key,
    required this.headlineText,
    required this.contentText,
    required this.acceptButtonText,
    required this.rejectButtonText,
    required this.acceptButtonTapFunction,
    required this.rejectButtonTapFunction,
    required this.acceptButtonColor,
    required this.rejectButtonColor,
    required this.acceptButtonStyle,
    required this.rejectButtonStyle,
    required this.buttonWidth,
    required this.borderColor,
  });

  final Color borderColor;
  final String headlineText;
  final String contentText;
  final String acceptButtonText;
  final String rejectButtonText;
  final Color acceptButtonColor;
  final Color rejectButtonColor;
  final Function acceptButtonTapFunction;
  final Function rejectButtonTapFunction;
  final TextStyle acceptButtonStyle;
  final TextStyle rejectButtonStyle;
  final double buttonWidth;

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
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 70.w),
                    child: Text(
                      headlineText,
                      style: AppTextStyles.header2Inter,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    contentText,
                    style: AppTextStyles.robotoRegularBlack(12.sp),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SmallBottomSheetButton(
                        buttonText: acceptButtonText,
                        onPressed: acceptButtonTapFunction,
                        buttonTextStyle: acceptButtonStyle,
                        buttonColor: acceptButtonColor,
                        buttonWidth: buttonWidth,
                        borderColor: borderColor,
                      ),
                      SmallBottomSheetButton(
                        buttonText: rejectButtonText,
                        onPressed: rejectButtonTapFunction,
                        buttonTextStyle: rejectButtonStyle,
                        buttonColor: rejectButtonColor,
                        buttonWidth: buttonWidth,
                        borderColor: borderColor,
                      ),
                    ],
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
