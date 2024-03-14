import '../constants/colors/colors.dart';
import '../constants/text_styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButtonWhite extends StatelessWidget {
  const CustomButtonWhite(
      {Key? key, required this.buttonText, required this.onPressed})
      : super(key: key);

  final String buttonText;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressed(),
      style: ElevatedButton.styleFrom(
        elevation: 0.0,
        primary: AppColors.whiteColor,
        minimumSize: Size.fromHeight(45.h),
      ),
      child: Text(
        buttonText,
        style: AppTextStyles.robotoBoldBlack(16.sp),
      ),
    );
  }
}
