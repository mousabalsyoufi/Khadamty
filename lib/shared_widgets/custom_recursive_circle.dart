import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/colors/colors.dart';

class CustomRecursiveCircle extends StatelessWidget {
  const CustomRecursiveCircle({Key? key, this.width = 20, this.height = 20})
      : super(key: key);

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: width.r,
      width: height.r,
      decoration: const BoxDecoration(
          color: AppColors.greenColor, shape: BoxShape.circle),
      child: Icon(
        Icons.refresh_rounded,
        color: AppColors.blackColor,
        size: 15.r,
      ),
    );
  }
}
