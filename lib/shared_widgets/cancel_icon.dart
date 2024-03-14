import 'package:faciltateur_de_vies/constants/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CancelIcon extends StatelessWidget {
  const CancelIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 15.r,
      height: 15.r,
      decoration: const BoxDecoration(
        color: AppColors.redColor,
        shape: BoxShape.circle,
      ),
      child: Icon(
        Icons.close,
        color: AppColors.whiteColor,
        size: 7.r,
      ),
    );
  }
}
