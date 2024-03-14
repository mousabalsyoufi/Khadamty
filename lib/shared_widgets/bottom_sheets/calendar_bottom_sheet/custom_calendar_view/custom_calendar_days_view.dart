import 'dart:collection';
import 'package:dotted_border/dotted_border.dart';
import 'package:faciltateur_de_vies/constants/colors/colors.dart';
import 'package:faciltateur_de_vies/constants/text_styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TableRangeDaysCalendar extends StatefulWidget {
  const TableRangeDaysCalendar({Key? key}) : super(key: key);

  @override
  State<TableRangeDaysCalendar> createState() => _TableRangeDaysCalendarState();
}

class _TableRangeDaysCalendarState extends State<TableRangeDaysCalendar> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      firstDay: kFirstDay,
      lastDay: kLastDay,
      focusedDay: _focusedDay,
      selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
      calendarFormat: CalendarFormat.month,
      rangeSelectionMode: RangeSelectionMode.toggledOff,
      daysOfWeekVisible: false,
      rowHeight: 70.h,
      daysOfWeekHeight: 80.h,
      headerStyle: const HeaderStyle(
          formatButtonShowsNext: false,
          formatButtonVisible: false,
          decoration: BoxDecoration(color: AppColors.blackColor),
          leftChevronIcon: Icon(Icons.arrow_back_ios,color: AppColors.whiteColor,),
          rightChevronIcon: Icon(Icons.arrow_forward_ios,color: AppColors.whiteColor,)

      ),
      calendarBuilders: CalendarBuilders(
        // selected cell style
        selectedBuilder: (context, date1, date2) {
          return Container(
            decoration: const BoxDecoration(
                color: AppColors.greenColor, shape: BoxShape.circle),
            child: Center(
                child: Text(
              DateFormat.d().format(date1),
              style: AppTextStyles.robotoBoldBlack(16.sp),
            )),
          );
        },
        headerTitleBuilder: (context, month) {
          final text = DateFormat.yMMM().format(month);
          return Center(
            child: Text(
              text,
              style: AppTextStyles.interMeduimWhite.copyWith(fontSize: 15.sp)
            ),
          );
        },
      ),
      onDaySelected: (selectedDay, focusedDay) {
        if (!isSameDay(_selectedDay, selectedDay)) {
          setState(() {
            _selectedDay = selectedDay;
            _focusedDay = focusedDay;
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

  // small green dot
  Widget _dot() {
    return Container(
      width: 5.h,
      height: 5.h,
      decoration: const BoxDecoration(
          color: AppColors.greenColor, shape: BoxShape.circle),
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
            SizedBox(
              height: 7.h,
            ),
            Expanded(
                child: Text(DateFormat.E().format(date1),
                    style: DisplayType.normal == displayType
                        ? AppTextStyles.header5Inter
                        : AppTextStyles.header5Inter
                            .copyWith(color: AppColors.grey60Color)))
          ],
        ),
        if (displayType == DisplayType.normal)
          Positioned(top: 35.h, left: 17.w, child: _dot())
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

/// Example events.
///
/// Using a [LinkedHashMap] is highly recommended if you decide to use a map.
final kEvents = LinkedHashMap<DateTime, List<Event>>(
  equals: isSameDay,
  hashCode: getHashCode,
)..addAll(_kEventSource);

final _kEventSource = Map.fromIterable(List.generate(50, (index) => index),
    key: (item) => DateTime.utc(kFirstDay.year, kFirstDay.month, item * 5),
    value: (item) => List.generate(
        item % 4 + 1, (index) => Event('Event $item | ${index + 1}')))
  ..addAll({
    kToday: [
      const Event('Today\'s Event 1'),
      const Event('Today\'s Event 2'),
    ],
  });

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year, kToday.month, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month + 1, kToday.day);
