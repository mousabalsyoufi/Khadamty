import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/colors/colors.dart';
import '../../../../constants/text_styles/text_styles.dart';
import '../../../custom_radio_button.dart';
import '../../widgets/bottom_sheet_header.dart';

class RecurrentTimeBottomSheet extends StatefulWidget {
  const RecurrentTimeBottomSheet(
      {super.key, required this.selectedTime, required this.onChangeSelection});

  final int selectedTime;
  final Function(int) onChangeSelection;

  @override
  State<RecurrentTimeBottomSheet> createState() =>
      _RecurrentTimeBottomSheetState();
}

class _RecurrentTimeBottomSheetState extends State<RecurrentTimeBottomSheet> {
  int selectedTime = 0;

  @override
  void initState() {
    selectedTime = widget.selectedTime;
    super.initState();
  }

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
                        title: '1 time',
                        value: 1,
                        groupValue: selectedTime,
                        hasPadding: false,
                        selectedTextStyle: AppTextStyles.header3Inter,
                        unselectedTextStyle:
                            AppTextStyles.robotoRegularBlack(14.sp),
                        onChanged: (value) {
                          setState(() {
                            selectedTime = 1;
                            widget.onChangeSelection(1);
                          });
                        }),
                    SizedBox(
                      height: 10.h,
                    ),
                    const Divider(),
                    SizedBox(
                      height: 10.h,
                    ),
                    CustomRadioButton(
                        title: '2 time',
                        value: 2,
                        groupValue: selectedTime,
                        hasPadding: false,
                        selectedTextStyle: AppTextStyles.header3Inter,
                        unselectedTextStyle:
                            AppTextStyles.robotoRegularBlack(14.sp),
                        onChanged: (value) {
                          setState(() {
                            selectedTime = 2;
                            widget.onChangeSelection(2);
                          });
                        }),
                    SizedBox(
                      height: 10.h,
                    ),
                    const Divider(),
                    SizedBox(
                      height: 10.h,
                    ),
                    CustomRadioButton(
                        title: '3 time',
                        value: 3,
                        groupValue: selectedTime,
                        hasPadding: false,
                        selectedTextStyle: AppTextStyles.header3Inter,
                        unselectedTextStyle:
                            AppTextStyles.robotoRegularBlack(14.sp),
                        onChanged: (value) {
                          setState(() {
                            selectedTime = 3;
                            widget.onChangeSelection(3);
                          });
                        }),
                    SizedBox(
                      height: 10.h,
                    ),
                    const Divider(),
                    SizedBox(
                      height: 10.h,
                    ),
                    CustomRadioButton(
                        title: '4 time',
                        value: 4,
                        groupValue: selectedTime,
                        hasPadding: false,
                        selectedTextStyle: AppTextStyles.header3Inter,
                        unselectedTextStyle:
                            AppTextStyles.robotoRegularBlack(14.sp),
                        onChanged: (value) {
                          setState(() {
                            selectedTime = 4;
                            widget.onChangeSelection(4);
                          });
                        }),
                    SizedBox(
                      height: 10.h,
                    ),
                    const Divider(),
                    SizedBox(
                      height: 10.h,
                    ),
                    CustomRadioButton(
                        title: '5 time',
                        value: 5,
                        groupValue: selectedTime,
                        hasPadding: false,
                        selectedTextStyle: AppTextStyles.header3Inter,
                        unselectedTextStyle:
                            AppTextStyles.robotoRegularBlack(14.sp),
                        onChanged: (value) {
                          setState(() {
                            selectedTime = 5;
                            widget.onChangeSelection(5);
                          });
                        }),
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
