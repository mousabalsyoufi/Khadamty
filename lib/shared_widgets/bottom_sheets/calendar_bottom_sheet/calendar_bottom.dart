import 'package:faciltateur_de_vies/shared_widgets/bottom_sheets/calendar_bottom_sheet/custom_calendar_view/custom_calander_years_view.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import '../../../constants/colors/colors.dart';
import 'custom_calendar_view/custom_calendar_days_view_dotted.dart';
import 'custom_calendar_view/custom_calendar_days_view.dart';
import 'custom_calendar_view/custom_calendar_month_view.dart';

class CalendarBottomSheet {
  static void showCalendarDaysDialog(BuildContext context) {
    // show Date With View Type as Days only
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return const TableRangeDaysCalendar();
        });
  }

  static void showCalendarMonthsDialog(BuildContext context) {
    // show Date With View Type as Months only
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.white,
        builder: (BuildContext context) {
          return TableRangeCalendarMonth(
            onSelectionChanged: (DateRangePickerSelectionChangedArgs
                dateRangePickerSelectionChangedArgs) {
              return dateRangePickerSelectionChangedArgs;
            },
          );
        });
  }

  static void showCalendarMonthsDialogExtend(BuildContext context,
      {DateTime? selectedDate,
      bool allowYearsChange = true,
      Function(DateRangePickerSelectionChangedArgs)? onSelectionChanged}) {
    // show Date With View Type as Months only
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.white,
        builder: (BuildContext context) {
          return TableRangeCalendarMonth(
            selectedDate: selectedDate,
            allowYearsChange: allowYearsChange,
            onSelectionChanged: (DateRangePickerSelectionChangedArgs
                dateRangePickerSelectionChangedArgs) {
              if (onSelectionChanged != null) {
                onSelectionChanged(dateRangePickerSelectionChangedArgs);
              }
            },
          );
        });
  }

  static void showCalendarYearsDialog(BuildContext context,
      {DateTime? selectedDate,
      Function(DateRangePickerSelectionChangedArgs)? onSelectionChanged}) {
    // show Date With View Type as Months only
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.white,
        builder: (BuildContext context) {
          return TableRangeCalendarYears(
            selectedDate: selectedDate,
            onSelectionChanged: (DateRangePickerSelectionChangedArgs
                dateRangePickerSelectionChangedArgs) {
              if (onSelectionChanged != null) {
                onSelectionChanged(dateRangePickerSelectionChangedArgs);
              }
            },
          );
        });
  }

  static void showCalendarDaysDottedDialog(
      BuildContext context, Function(DateTime) onSelectDate) {
    // show Date With View Type as Months only
    showModalBottomSheet(
        context: context,
        backgroundColor: AppColors.transparentColor,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return CustomCalendarDays(
            onSelectDate: onSelectDate,
          );
        });
  }

  static void showCalendarDaysDottedDialogExtents(BuildContext context,
      DateTime startDate, Function(DateTime) onSelectDate) {
    final kToday = DateTime.now();
    DateTime? kFirstDay = DateTime(kToday.year - 100, kToday.month, kToday.day);
    DateTime? kLastDay =
        DateTime(kToday.year - 18, kToday.month + 1,);
    // show Date With View Type as Months only
    showModalBottomSheet(
        context: context,
        backgroundColor: AppColors.transparentColor,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return CustomCalendarDays(
            onSelectDate: onSelectDate,
            kFirstDay: kFirstDay,
            kLastDay: kLastDay,
            slectedDate: startDate,
          );
        });
  }
}
