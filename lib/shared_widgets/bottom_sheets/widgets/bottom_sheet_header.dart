import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/colors/colors.dart';

class BottomSheetHeader extends StatelessWidget {
  const BottomSheetHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70.w,
      height: 5.h,
      decoration: BoxDecoration(
          color: AppColors.greyColor, borderRadius: BorderRadius.circular(5.r)),
    );
  }
}
