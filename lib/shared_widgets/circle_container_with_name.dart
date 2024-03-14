import 'package:faciltateur_de_vies/constants/colors/colors.dart';
import 'package:faciltateur_de_vies/constants/text_styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CircleContainerWithName extends StatelessWidget {
  final double width, height;
  final double borderWidth;
  final Color borderColor;
  final String name;
  final double fontSize;
  const CircleContainerWithName(
      {Key? key,
      required this.width,
      required this.height,
      required this.name,
      this.fontSize = 14,
      this.borderColor = AppColors.whiteColor,
      this.borderWidth = 1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            border: Border.all(color: borderColor, width: borderWidth),
            shape: BoxShape.circle,
            color: AppColors.blackColor),
        child: Center(
          child: Text(
            name.characters.first.toUpperCase(),
            style:
                AppTextStyles.robotoMediumWhite.copyWith(fontSize: fontSize.sp),
          ),
        ));
  }
}
