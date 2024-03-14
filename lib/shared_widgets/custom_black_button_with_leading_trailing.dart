import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/colors/colors.dart';
import '../constants/text_styles/text_styles.dart';

class CustomButtonBlackWithLeadingTrailing extends StatelessWidget {
  const CustomButtonBlackWithLeadingTrailing(
      {Key? key,
      required this.buttonText,
      required this.trailingText,
      required this.onPressed})
      : super(key: key);

  final String buttonText;
  final Function? onPressed;
  final String trailingText;
  @override
  Widget build(BuildContext context) {
    bool disabled = onPressed == null;
    return InkWell(
      onTap: disabled ? null : () => onPressed!(),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        decoration: BoxDecoration(
          color: disabled ? AppColors.grey40Color : AppColors.blackColor,
          borderRadius: BorderRadius.circular(5.r),
        ),
        height: 45.h,
        child: Row(
          children: [
            Icon(
              Icons.lock,
              color: disabled ? AppColors.grey40Color : AppColors.whiteColor,
              size: 18.r,
            ),
            const Spacer(),
            Text(
              buttonText,
              style: AppTextStyles.robotoBoldWhite,
            ),
            const Spacer(),
            Text(
              trailingText,
              style: AppTextStyles.robotoBoldWhite,
            )
          ],
        ),
      ),
    );
  }
}
