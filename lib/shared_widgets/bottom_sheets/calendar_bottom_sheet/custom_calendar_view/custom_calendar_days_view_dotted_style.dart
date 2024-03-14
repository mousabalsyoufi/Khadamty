import 'package:dotted_border/dotted_border.dart';
import 'package:faciltateur_de_vies/constants/colors/colors.dart';
import 'package:faciltateur_de_vies/constants/text_styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TableRangeCalendarDotted extends StatefulWidget {
  DateTime? kFirstDay;
  DateTime? kLastDay;
  final DateTime? selectedDay;

 TableRangeCalendarDotted(
      {Key? key,
      required this.onDateSelected,
      this.kFirstDay,
      this.kLastDay,
      this.selectedDay})
      : super(key: key);

  final Function(DateTime) onDateSelected;

  @override
  State<TableRangeCalendarDotted> createState() =>
      _TableRangeCalendarDottedState();
}

class _TableRangeCalendarDottedState extends State<TableRangeCalendarDotted> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime? _focusedDay;
  DateTime? _selectedDay = DateTime.now();

  @override
  void initState() {
    widget.kFirstDay ??= kFirstDay;
    widget.kLastDay ??= kLastDay;
    _focusedDay = widget.selectedDay ?? widget.kLastDay;
    _selectedDay = widget.selectedDay ?? _selectedDay;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      firstDay: widget.kFirstDay!,
      lastDay: widget.kLastDay!,
      focusedDay: _focusedDay!,
      selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
      calendarFormat: CalendarFormat.month,
      rangeSelectionMode: RangeSelectionMode.toggledOff,
      headerVisible: true,
      daysOfWeekVisible: true,
      rowHeight: 50.h,
      daysOfWeekHeight: 80.h,
      headerStyle: const HeaderStyle(
          headerPadding: EdgeInsets.zero,
          headerMargin: EdgeInsets.zero,
          formatButtonVisible: false),
      calendarBuilders: CalendarBuilders(
        // selected cell style
        selectedBuilder: (context, date1, date2) {
          return _normalCalendarWidget(date1, date2, DisplayType.normal);
        },
        headerTitleBuilder: (context, month) {
          final text = DateFormat.yMMM().format(month);
          return Center(
            child: Text(
              text,
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold),
            ),
          );
        },
      ),
      onDaySelected: (selectedDay, focusedDay) {
        if (!isSameDay(_selectedDay, selectedDay)) {
          setState(() {
            _selectedDay = selectedDay;
            _focusedDay = focusedDay;
            widget.onDateSelected(_selectedDay!);
          });
        }
      },
      onRangeSelected: (start, end, focusedDay) {
        setState(() {
          _selectedDay = null;
          _focusedDay = focusedDay;
        });
      },
      onFormatChanged: (format) {
        if (_calendarFormat != format) {
          setState(() {
            _calendarFormat = format;
          });
        }
      },
      onPageChanged: (focusedDay) {
        _focusedDay = focusedDay;
      },
    );
  }


  // custom widget for normal view cell
  Widget _normalCalendarWidget(
      DateTime date1, DateTime date2, DisplayType displayType) {
    // the size of cell from 1->9 is smaller than other cells
    bool isFrom1T09 = int.parse(DateFormat.d().format(date1)) < 10;
    return Stack(
      children: [
        Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: isFrom1T09 ? 4.r : 10.r),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: DottedBorder(
                borderType: BorderType.Circle,
                dashPattern: [displayType == DisplayType.normal ? 6 : 7],
                strokeWidth: 1,
                color: displayType == DisplayType.normal
                    ? Colors.black
                    : Colors.grey,
                child: Padding(
                  padding: isFrom1T09
                      ? EdgeInsets.all(14.r)
                      : EdgeInsetsDirectional.only(
                          top: 8.r, start: 12.r, end: 12.r, bottom: 12.r),
                  child: Text(DateFormat.d().format(date1),
                      style: DisplayType.normal == displayType
                          ? AppTextStyles.header5Inter
                          : AppTextStyles.header5Inter
                              .copyWith(color: AppColors.grey60Color)),
                ),
              ),
            ),
          ],
        ),
        // if(displayType == DisplayType.normal)
        //   Positioned(
        //       top: 35.h,
        //       left: 17.w,
        //       child: _dot())
      ],
    );
  }
}

enum DisplayType { normal, hidden }

///  event class.
class Event {
  final String title;

  const Event(this.title);

  @override
  String toString() => title;
}

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year, kToday.month, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month + 1, kToday.day);
