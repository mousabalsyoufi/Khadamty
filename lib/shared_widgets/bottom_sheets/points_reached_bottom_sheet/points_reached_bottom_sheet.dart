import 'package:faciltateur_de_vies/routes/routes_provider/routes_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants/colors/colors.dart';
import '../../../constants/images/images.dart';
import '../../../constants/text_styles/text_styles.dart';
import '../widgets/bottom_sheet_header.dart';
import '../widgets/small_bottom_sheet_button.dart';

class PointsReachedBottomSheet {
  static void showPointsReachedBottomSheet(BuildContext context) {
    // show points level reached bottom sheet
    showModalBottomSheet(
        backgroundColor: AppColors.transparentColor,
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return Wrap(
            children: [
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.r),
                        topRight: Radius.circular(20.r)),
                    color: AppColors.whiteColor,
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: 20.w, right: 20.w, bottom: 20.h),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10.h,
                        ),
                        const BottomSheetHeader(),
                        SizedBox(
                          height: 30.h,
                        ),
                        Column(
                          children: [
                            SvgPicture.asset(
                              AppImages.pointsReached,
                              height: 150.h,
                              width: 150.w,
                            ),
                            SizedBox(
                              height: 40.h,
                            ),
                            Text(
                              'Congratulations!',
                              style: AppTextStyles.header1Inter,
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 40.w),
                              child: Text(
                                'You have reached the 1st level of 480 points to benefit from your free service time.',
                                style: AppTextStyles.robotoRegularBlack(12.sp),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            SmallBottomSheetButton(
                                buttonText: 'OK',
                                onPressed: () {
                                  RoutingProvider.goBack();
                                },
                                buttonTextStyle: AppTextStyles.robotoMediumWhite
                                    .copyWith(fontSize: 16.sp),
                                buttonColor: AppColors.blackColor,
                                buttonWidth: double.infinity,
                                borderColor: AppColors.blackColor),
                            SizedBox(
                              height: 15.h,
                            ),
                            SmallBottomSheetButton(
                                buttonText: 'View my points',
                                onPressed: () {},
                                buttonTextStyle: AppTextStyles.robotoMediumBlack
                                    .copyWith(fontSize: 16.sp),
                                buttonColor: AppColors.whiteColor,
                                buttonWidth: double.infinity,
                                borderColor: AppColors.blackColor),
                            const SizedBox(
                              height: 40,
                            ),
                          ],
                        ),
                      ],
                    ),
                  )),
            ],
          );
        });
  }
}
