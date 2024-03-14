import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/colors/colors.dart';

class CustomBadgeEdit extends StatelessWidget {
  final Function onPress;
  const CustomBadgeEdit({Key? key,required this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: ()=>onPress(),
      child: Container(
        height: 25.h,
        width: 25.h,
        decoration:const BoxDecoration(
          color: AppColors.greenColor,
          shape: BoxShape.circle,
        ),
        child: Icon(
          Icons.edit,
          size: 13.r,
          color: AppColors.blackColor,
        ),
      ),
    );
  }
}
