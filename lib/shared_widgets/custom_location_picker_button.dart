import 'package:faciltateur_de_vies/constants/colors/colors.dart';
import 'package:faciltateur_de_vies/constants/text_styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bottom_sheets/custom_sheets/custom_sheets.dart';

class CustomLocationPickerButton extends StatelessWidget {
  const CustomLocationPickerButton({Key? key, required this.cityName})
      : super(key: key);
  final String cityName;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        CustomSheets.showLocationPickerBottomSheet(context);
      },
      child: Container(
        height: 35.h,
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(18.r)),
        child: Row(
          children: [
            Icon(
              Icons.location_on_rounded,
              color: AppColors.blackColor,
              size: 13.r,
            ),
            SizedBox(
              width: 5.w,
            ),
            Text(
              cityName,
              style: AppTextStyles.header4Inter,
            ),
            SizedBox(
              width: 15.w,
            ),
            Icon(
              Icons.keyboard_arrow_down,
              color: AppColors.blackColor,
              size: 13.r,
            ),
          ],
        ),
      ),
    );
  }
}
