import 'package:faciltateur_de_vies/constants/colors/colors.dart';
import 'package:faciltateur_de_vies/constants/icons/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../constants/text_styles/text_styles.dart';

/// This class a small part from Bonus Screen [HeaderBonusWidget]

class HeaderBonusWidget extends StatelessWidget {
    final double bonus;
  const HeaderBonusWidget({Key? key,required this.bonus}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 83.h,
      width: 320.w,
      decoration: BoxDecoration(
          color: AppColors.blackColor,
          borderRadius: BorderRadius.circular(5.r)),
      child: Container(
        margin:EdgeInsetsDirectional.only(start:18.w,top: 14.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.only(top: 8.h),
              child: SvgPicture.asset(
                AppIcons.mybounsWithoutCircleCoverIcon,
                height: 20.h,
                width: 20.h,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 10.w,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("$bonus €",style: AppTextStyles.robotoBoldWhite.copyWith(fontSize: 30.sp),),
                Text("Current amount of your premium",style: AppTextStyles.paragraph2Roboto.copyWith(color: AppColors.whiteColor),),
                SizedBox(height: 10.h,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
