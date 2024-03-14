import 'custom_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/colors/colors.dart';
import '../constants/icons/icons.dart';
import '../constants/text_styles/text_styles.dart';

class CustomScreenHeader extends StatelessWidget {
  const CustomScreenHeader({
    Key? key,
    required this.title,
    required this.imageWidth,
    required this.imageHeight,
    this.hasBackButton = false,
  }) : super(key: key);

  final String title;
  final double imageWidth;
  final double imageHeight;
  final bool hasBackButton;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          decoration:  BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(15.r),
              )),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 60.h,
              ),
              SvgPicture.asset(
                AppIcons.appIconWithTitle,
                width: imageWidth,
                height: imageHeight,
              ),
              SizedBox(
                height: 78.h,
              ),
              Text(
                title,
                style: AppTextStyles.header1Inter,
              ),
              SizedBox(
                height: 35.h,
              ),
            ],
          ),
        ),
        if (hasBackButton)
           Positioned(
            top: 50.h,
            left: 20.w,
            child:const CustomBackButton(),
          ),
      ],
    );
  }
}
