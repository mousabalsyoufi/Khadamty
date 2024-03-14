import 'dart:collection';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../constants/colors/colors.dart';
import '../../../../constants/icons/icons.dart';
import '../../../../constants/text_styles/text_styles.dart';
import '../../business_logic/provider/user_service_subscribe_process_provider.dart';

class ServiceDateDayPicker extends StatefulWidget {
  const ServiceDateDayPicker({super.key});

  @override
  State<ServiceDateDayPicker> createState() => _ServiceDateDayPickerState();
}

class _ServiceDateDayPickerState extends State<ServiceDateDayPicker> {
  DateTime _focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Selector<UserServiceSubscribeProcessProvider, DateTime?>(
        selector: (BuildContext context,
                UserServiceSubscribeProcessProvider provider) =>
            provider.oneTimeServiceSelectedDay,
        builder: (context, DateTime? oneTimeSelectedDay, child) {
          return TableCalendar(
            firstDay: kFirstDay,
            lastDay: kLastDay,
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) => isSameDay(oneTimeSelectedDay, day),
            calendarFormat: CalendarFormat.week,
            rangeSelectionMode: RangeSelectionMode.toggledOff,
            headerVisible: true,
            daysOfWeekVisible: false,
            rowHeight: 75.h,
            daysOfWeekHeight: 80.h,
            headerStyle: HeaderStyle(
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(5.r),
                ),
                headerPadding: EdgeInsets.zero,
                headerMargin: EdgeInsets.zero,
                formatButtonVisible: false),
            calendarBuilders: CalendarBuilders(
              // selected cell style
              selectedBuilder: (context, date1, date2) {
                return Container(
                  margin: EdgeInsets.only(top: 10.r),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  padding: EdgeInsetsDirectional.only(start: 5.w, end: 5.w),
                  child: Column(
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            width: 45.r,
                            height: 45.r,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.black,
                            ),
                            child: Center(
                              child: Text(
                                DateFormat.d().format(date1),
                                style: AppTextStyles.robotoRegularWhite
                                    .copyWith(fontSize: 14.sp),
                              ),
                            ),
                          ),
                          Positioned(
                              top: -8.h,
                              left: 8.w,
                              child: SvgPicture.asset(
                                AppIcons.successMarkIcon,
                                height: 20.h,
                                width: 20.w,
                                fit: BoxFit.cover,
                              )),
                        ],
                      ),
                      Expanded(
                          child: Text(
                        DateFormat.E().format(date1),
                        style: AppTextStyles.header5Inter,
                      ))
                    ],
                  ),
                );
              },
              outsideBuilder: (context, date1, date2) {
                return _normalCalendarWidget(date1, date2, DisplayType.normal);
              },
              // // default cell style
              defaultBuilder: (context, date1, date2) {
                return _normalCalendarWidget(date1, date2, DisplayType.normal);
              },
              todayBuilder: (context, date1, date2) {
                return _todayCalendarWidget(date1, date2, DisplayType.normal);
              },
              disabledBuilder: (context, date1, date2) {
                return _normalCalendarWidget(date1, date2, DisplayType.hidden);
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
              if (!isSameDay(oneTimeSelectedDay, selectedDay)) {
                Provider.of<UserServiceSubscribeProcessProvider>(context,
                        listen: false)
                    .setSelectedDayForOneTimeService(selectedDay);
                _focusedDay = focusedDay;
              }
            },
          );
        });
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
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.whiteColor,
                ),
                child: Padding(
                  padding: isFrom1T09
                      ? EdgeInsets.all(14.r)
                      : EdgeInsetsDirectional.all(10.r),
                  child: Text(DateFormat.d().format(date1),
                      style: DisplayType.normal == displayType
                          ? AppTextStyles.robotoRegularBlack(14.sp)
                          : AppTextStyles.paragraph3Roboto
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
      ],
    );
  }

  Widget _todayCalendarWidget(
      DateTime date1, DateTime date2, DisplayType displayType) {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 10.r),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: DottedBorder(
                borderType: BorderType.Circle,
                dashPattern: const [7],
                strokeWidth: 2,
                child: Padding(
                  padding: EdgeInsetsDirectional.all(8.r),
                  child: Text(DateFormat.d().format(date1),
                      style: DisplayType.normal == displayType
                          ? AppTextStyles.robotoRegularBlack(14.sp)
                          : AppTextStyles.paragraph3Roboto
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
