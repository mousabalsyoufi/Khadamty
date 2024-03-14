import 'package:faciltateur_de_vies/constants/text_styles/text_styles.dart';
import 'package:faciltateur_de_vies/shared_widgets/custom_button_black.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../constants/colors/colors.dart';
import '../../widgets/bottom_sheet_header.dart';

class IconTextButtonBottomSheet extends StatelessWidget {
  const IconTextButtonBottomSheet({
    super.key,
    required this.iconPath,
    required this.contentText,
    required this.buttonText,
    required this.buttonTapFunction,
  });

  final String iconPath;
  final String contentText;
  final String buttonText;
  final Function buttonTapFunction;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.r),
                topRight: Radius.circular(20.r)),
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
                height: 35.h,
              ),
              SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        iconPath,
                        width: 65.r,
                        height: 65.r,
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 65.w),
                        child: Text(
                          contentText,
                          style: AppTextStyles.header2Inter,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      CustomButtonBlack(
                          buttonContent: Text(buttonText),
                          onPressed: () => buttonTapFunction()),
                      SizedBox(
                        height: 10.h,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
