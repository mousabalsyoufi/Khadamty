import 'package:faciltateur_de_vies/constants/colors/colors.dart';
import 'package:faciltateur_de_vies/constants/text_styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../constants/icons/icons.dart';

class UserAreaNotCoveredScreen extends StatelessWidget {
  final String? title;
  final String? body;
  const UserAreaNotCoveredScreen({Key? key, this.title, this.body})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30.h,
            ),
            Text(
              title ?? "Oups.. Area not covered",
              style: AppTextStyles.header3Inter,
            ),
            SizedBox(
              height: 23.h,
            ),
            Container(
              height: 104.h,
              width: 320.w,
              decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.all(Radius.circular(5.r))),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      AppIcons.myBonusIcon,
                      width: 35.r,
                      height: 35.r,
                    ),
                    SizedBox(
                      width: 12.w,
                    ),
                    Expanded(
                        child: Text(
                      body ??
                          "The location area you have selected is not yet covered by our Easers. You can visit our website ptitservices.com to book your services.",
                      style: AppTextStyles.robotoRegularBlack(12.sp),
                    )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
