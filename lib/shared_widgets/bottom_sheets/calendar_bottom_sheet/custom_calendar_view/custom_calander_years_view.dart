import 'package:faciltateur_de_vies/constants/colors/colors.dart';
import 'package:faciltateur_de_vies/constants/text_styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TableRangeCalendarYears extends StatefulWidget {
  Function(
      DateRangePickerSelectionChangedArgs
          dateRangePickerSelectionChangedArgs)? onSelectionChanged;
  TableRangeCalendarYears(
      {Key? key, this.onSelectionChanged, this.selectedDate})
      : super(key: key);
  DateTime? selectedDate;
  @override
  State<TableRangeCalendarYears> createState() =>
      _TableRangeCalendarYearsState();
}

class _TableRangeCalendarYearsState extends State<TableRangeCalendarYears> {
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
        showNavigationArrow: true,
        initialSelectedDate: widget.selectedDate,
        initialDisplayDate: widget.selectedDate,
        maxDate: DateTime(DateTime.now().year - 19, DateTime.now().month + 1),
        todayHighlightColor: AppColors.blueColor,
        headerStyle: DateRangePickerHeaderStyle(
          backgroundColor: Colors.black,
          textAlign: TextAlign.center,
          textStyle: AppTextStyles.interMeduimWhite,
        ),
        selectionTextStyle: AppTextStyles.robotoBoldBlack(16.sp),
        view: DateRangePickerView.decade,
        yearCellStyle: DateRangePickerYearCellStyle(
            textStyle: AppTextStyles.robotoRegularBlack(16.sp)),
      ),
    );
  }
}
