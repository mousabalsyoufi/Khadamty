import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/colors/colors.dart';
import '../../../../constants/text_styles/text_styles.dart';
import '../../../custom_radio_button.dart';
import '../../widgets/bottom_sheet_header.dart';

class RecurrentPeriodBottomSheet extends StatefulWidget {
  const RecurrentPeriodBottomSheet(
      {super.key, required this.selectedWeek, required this.onChangeSelection});

  final int selectedWeek;
  final Function(int) onChangeSelection;

  @override
  State<RecurrentPeriodBottomSheet> createState() =>
      _RecurrentPeriodBottomSheetState();
}

class _RecurrentPeriodBottomSheetState
    extends State<RecurrentPeriodBottomSheet> {
  int selectedWeek = 0;

  @override
  void initState() {
    selectedWeek = widget.selectedWeek;
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
                        title: '1 weeks',
                        value: 1,
                        groupValue: selectedWeek,
                        hasPadding: false,
                        selectedTextStyle: AppTextStyles.header3Inter,
                        unselectedTextStyle:
                            AppTextStyles.robotoRegularBlack(14.sp),
                        onChanged: (value) {
                          setState(() {
                            selectedWeek = 1;
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
                        title: '2 weeks',
                        value: 2,
                        groupValue: selectedWeek,
                        hasPadding: false,
                        selectedTextStyle: AppTextStyles.header3Inter,
                        unselectedTextStyle:
                            AppTextStyles.robotoRegularBlack(14.sp),
                        onChanged: (value) {
                          setState(() {
                            selectedWeek = 2;
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
                        title: '3 weeks',
                        value: 3,
                        groupValue: selectedWeek,
                        hasPadding: false,
                        selectedTextStyle: AppTextStyles.header3Inter,
                        unselectedTextStyle:
                            AppTextStyles.robotoRegularBlack(14.sp),
                        onChanged: (value) {
                          setState(() {
                            selectedWeek = 3;
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
                        title: '4 weeks',
                        value: 4,
                        groupValue: selectedWeek,
                        hasPadding: false,
                        selectedTextStyle: AppTextStyles.header3Inter,
                        unselectedTextStyle:
                            AppTextStyles.robotoRegularBlack(14.sp),
                        onChanged: (value) {
                          setState(() {
                            selectedWeek = 4;
                            widget.onChangeSelection(4);
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
