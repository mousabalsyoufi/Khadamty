import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/colors/colors.dart';
import '../constants/text_styles/text_styles.dart';

class CustomButtonBlackWithText extends StatelessWidget {
  const CustomButtonBlackWithText(
      {Key? key,
      required this.buttonText,
      required this.trailingText,
      required this.onPressed})
      : super(key: key);

  final String buttonText;
  final Function? onPressed;
  final String trailingText;
  @override
  Widget build(BuildContext context) {
    bool disabled = onPressed == null;
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.r),
          color: disabled ? AppColors.whiteColor : AppColors.blackColor),
      child: TextButton(
        style: TextButton.styleFrom(
          primary: disabled ? AppColors.whiteColor : AppColors.blackColor,
        ),
        onPressed: disabled ? null : () => onPressed!(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Spacer(),
            Text(
              buttonText,
              style: AppTextStyles.robotoBoldWhite.copyWith(
                  color:
                      disabled ? AppColors.grey40Color : AppColors.whiteColor),
            ),
            const Spacer(),
            Text(
              trailingText,
              style: AppTextStyles.robotoBoldWhite.copyWith(
                  color:
                      disabled ? AppColors.grey40Color : AppColors.whiteColor),
            ),
          ],
        ),
      ),
    );
  }
}





// alt solution 1:
/***
 *     return InkWell(
    onTap: disabled ? null : () => onPressed!(),
    child: Container(
    decoration: BoxDecoration(
    color: disabled ? AppColors.grey40Color : AppColors.blackColor,
    borderRadius: BorderRadius.circular(5.r),
    ),
    height: 45.h,
    child: Row(
    children: [
    SizedBox(width: 130.w,),
    Text(
    buttonText,
    style: AppTextStyles.robotoBoldWhite,
    ),
    const Spacer(),
    Text(
    trailingText,
    style: AppTextStyles.robotoBoldWhite,
    ),
    SizedBox(width: 10.w,),
    ],
    ),
    ),
    );
 */


// alt solution 1:
/***
    return Container(
    height: 45.h,
    decoration: BoxDecoration(
    color: disabled ? AppColors.grey40Color : AppColors.blackColor,
    borderRadius: BorderRadius.circular(5.r),
    ),
    child: ListTile(
    minVerticalPadding: 0,
    contentPadding: EdgeInsets.zero,
    trailing: Padding(
    padding:EdgeInsetsDirectional.only(end:8.w),
    child: Text(trailingText, style: AppTextStyles.robotoBoldWhite,),
    ),
    horizontalTitleGap: 0,
    leading: const SizedBox(height: 0,),
    title: Center(child: Text(buttonText, style: AppTextStyles.robotoBoldWhite,)),
    onTap: disabled ? null : () => onPressed!(),

    ),
    );
 ***/
