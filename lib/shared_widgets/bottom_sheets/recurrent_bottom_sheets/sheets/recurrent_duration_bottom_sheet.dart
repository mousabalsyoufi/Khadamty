import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/colors/colors.dart';
import '../../../../constants/text_styles/text_styles.dart';
import '../../../custom_radio_button.dart';
import '../../widgets/bottom_sheet_header.dart';

class RecurrentDurationBottomSheet extends StatelessWidget {
  const RecurrentDurationBottomSheet({super.key});

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
          child: Column(
            children: [
              SizedBox(
                height: 10.h,
              ),
              const BottomSheetHeader(),
              SizedBox(
                height: 30.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 40.w, right: 40.w, bottom: 40.h),
                child: Column(
                  children: [
                    CustomRadioButton(
                        title: '2 hours',
                        value: 1,
                        groupValue: 1,
                        hasPadding: false,
                        selectedTextStyle: AppTextStyles.header3Inter,
                        unselectedTextStyle:
                            AppTextStyles.robotoRegularBlack(14.sp),
                        onChanged: (value) {}),
                    SizedBox(
                      height: 10.h,
                    ),
                    const Divider(),
                    SizedBox(
                      height: 10.h,
                    ),
                    CustomRadioButton(
                        title: '3 hours',
                        value: 2,
                        groupValue: 1,
                        hasPadding: false,
                        selectedTextStyle: AppTextStyles.header3Inter,
                        unselectedTextStyle:
                            AppTextStyles.robotoRegularBlack(14.sp),
                        onChanged: (value) {}),
                    SizedBox(
                      height: 10.h,
                    ),
                    const Divider(),
                    SizedBox(
                      height: 10.h,
                    ),
                    CustomRadioButton(
                        title: '4 hours',
                        value: 3,
                        groupValue: 1,
                        hasPadding: false,
                        selectedTextStyle: AppTextStyles.header3Inter,
                        unselectedTextStyle:
                            AppTextStyles.robotoRegularBlack(14.sp),
                        onChanged: (value) {}),
                    SizedBox(
                      height: 10.h,
                    ),
                    const Divider(),
                    SizedBox(
                      height: 10.h,
                    ),
                    CustomRadioButton(
                        title: '5 hours',
                        value: 4,
                        groupValue: 1,
                        hasPadding: false,
                        selectedTextStyle: AppTextStyles.header3Inter,
                        unselectedTextStyle:
                            AppTextStyles.robotoRegularBlack(14.sp),
                        onChanged: (value) {}),
                    SizedBox(
                      height: 10.h,
                    ),
                    const Divider(),
                    SizedBox(
                      height: 10.h,
                    ),
                    CustomRadioButton(
                        title: '6 hours',
                        value: 5,
                        groupValue: 1,
                        hasPadding: false,
                        selectedTextStyle: AppTextStyles.header3Inter,
                        unselectedTextStyle:
                            AppTextStyles.robotoRegularBlack(14.sp),
                        onChanged: (value) {}),
                    SizedBox(
                      height: 10.h,
                    ),
                    const Divider(),
                    SizedBox(
                      height: 10.h,
                    ),
                    CustomRadioButton(
                        title: '7 hours',
                        value: 6,
                        groupValue: 1,
                        hasPadding: false,
                        selectedTextStyle: AppTextStyles.header3Inter,
                        unselectedTextStyle:
                            AppTextStyles.robotoRegularBlack(14.sp),
                        onChanged: (value) {}),
                    SizedBox(
                      height: 10.h,
                    ),
                    const Divider(),
                    SizedBox(
                      height: 10.h,
                    ),
                    CustomRadioButton(
                        title: '8 hours',
                        value: 7,
                        groupValue: 1,
                        hasPadding: false,
                        selectedTextStyle: AppTextStyles.header3Inter,
                        unselectedTextStyle:
                            AppTextStyles.robotoRegularBlack(14.sp),
                        onChanged: (value) {}),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
