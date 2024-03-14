import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../constants/colors/colors.dart';
import '../../../../constants/images/images.dart';
import '../../../../constants/text_styles/text_styles.dart';
import '../../widgets/bottom_sheet_header.dart';
import '../../widgets/small_bottom_sheet_button.dart';

class ReservationModifiedBottomSheet extends StatelessWidget {
  const ReservationModifiedBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
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
              padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 20.h),
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
                        AppImages.reservationComplete,
                        height: 180.h,
                        width: 155.w,
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Text(
                        'Reservation modified !',
                        style: AppTextStyles.header1Inter,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        'Your service has been successfully modified',
                        style: AppTextStyles.robotoRegularBlack(12.sp),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      SmallBottomSheetButton(
                          buttonText: 'OK',
                          onPressed: () {},
                          buttonTextStyle: AppTextStyles.robotoMediumWhite
                              .copyWith(fontSize: 16.sp),
                          buttonColor: AppColors.blackColor,
                          buttonWidth: double.infinity,
                          borderColor: AppColors.blackColor),
                    ],
                  ),
                ],
              ),
            )),
      ],
    );
  }
}
