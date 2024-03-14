import 'package:faciltateur_de_vies/constants/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditIcon extends StatelessWidget {
  const EditIcon({super.key, this.width = 15, this.height = 15, this.iconSize = 7, this.color = AppColors.whiteColor});
  final double width;
  final double height;
  final double iconSize;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width.r,
      height: height.r,
      decoration: const BoxDecoration(
        color: AppColors.blackColor,
        shape: BoxShape.circle,
      ),
      child: Icon(
        Icons.edit,
        color: color,
        size: iconSize.r,
      ),
    );
  }
}
