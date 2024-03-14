import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/colors/colors.dart';
import '../../../../routes/routes_provider/routes_provider.dart';
import '../../../custom_button_black.dart';
import '../../widgets/bottom_sheet_header.dart';
import 'custom_calendar_days_view_dotted_style.dart';

class CustomCalendarDays extends StatefulWidget {
  CustomCalendarDays(
      {Key? key, required this.onSelectDate, this.kLastDay, this.kFirstDay, this.slectedDate})
      : super(key: key);
  DateTime? kFirstDay;
  DateTime? kLastDay;
  final DateTime? slectedDate;
  final Function(DateTime) onSelectDate;

  @override
  State<CustomCalendarDays> createState() => _CustomCalendarDaysState();
}

class _CustomCalendarDaysState extends State<CustomCalendarDays> {
  late DateTime selectedDate;
  
  @override
  void initState() {
    selectedDate = widget.slectedDate != null ? widget.slectedDate! : DateTime.now();
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
              TableRangeCalendarDotted(
                kFirstDay: widget.kFirstDay,
                kLastDay: widget.kLastDay,
                selectedDay: widget.slectedDate,
                onDateSelected: (date) {
                  selectedDate = date;
                },
              ),
              SizedBox(
                height: 30.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                child: CustomButtonBlack(
                    buttonContent: const Text("Ok"),
                    onPressed: () {
                      widget.onSelectDate(selectedDate);
                      RoutingProvider.goBack();
                    }),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
