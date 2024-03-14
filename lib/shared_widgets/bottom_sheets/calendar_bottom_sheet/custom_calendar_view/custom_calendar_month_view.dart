import 'package:faciltateur_de_vies/constants/colors/colors.dart';
import 'package:faciltateur_de_vies/constants/text_styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TableRangeCalendarMonth extends StatefulWidget {
  TableRangeCalendarMonth(
      {Key? key,
      this.onSelectionChanged,
      this.selectedDate,
      this.allowYearsChange = true})
      : super(key: key);
  Function(
      DateRangePickerSelectionChangedArgs
          dateRangePickerSelectionChangedArgs)? onSelectionChanged;
  DateTime? selectedDate;
  bool allowYearsChange;
  @override
  State<TableRangeCalendarMonth> createState() =>
      _TableRangeCalendarMonthState();
}

class _TableRangeCalendarMonthState extends State<TableRangeCalendarMonth> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.r)),
      height: 250.h,
      child: SfDateRangePicker(
        onSelectionChanged: (DateRangePickerSelectionChangedArgs
            dateRangePickerSelectionChangedArgs) {
          if (widget.onSelectionChanged != null) {
            widget.onSelectionChanged!(dateRangePickerSelectionChangedArgs);
          }
        },
        allowViewNavigation: false,
        selectionColor: AppColors.greenColor,
        selectionRadius: 50.r,
        showNavigationArrow: widget.allowYearsChange,
        initialSelectedDate: null,
        initialDisplayDate: widget.selectedDate,
        todayHighlightColor: AppColors.blueColor,
        headerStyle: DateRangePickerHeaderStyle(
          backgroundColor: Colors.black,
          textAlign: TextAlign.center,
          textStyle: AppTextStyles.interMeduimWhite,
        ),
        selectionTextStyle: AppTextStyles.robotoBoldBlack(16.sp),
        view: DateRangePickerView.year,
        yearCellStyle: DateRangePickerYearCellStyle(
            textStyle: AppTextStyles.robotoRegularBlack(16.sp)),
      ),
    );
  }
}
