import 'package:faciltateur_de_vies/constants/colors/colors.dart';
import 'package:faciltateur_de_vies/constants/text_styles/text_styles.dart';
import 'package:faciltateur_de_vies/core/extensions/date_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../constants/enums/pattren_repeat.dart';
import '../../../../shared_widgets/bottom_sheets/calendar_bottom_sheet/calendar_bottom.dart';
import '../../../../shared_widgets/bottom_sheets/recurrent_bottom_sheets/recurrent_bottom_sheets.dart';
import '../../business_logic/provider/user_offer_subscriber_provider.dart';

class UserOfferSubscriberSelectRepeatScreen extends StatelessWidget {
  const UserOfferSubscriberSelectRepeatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Consumer<UserOfferSubscriberProvider>(
          builder: (context, userOfferSubscriberProvider, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Select repeat Pattern",
              style: AppTextStyles.header3Inter,
            ),
            SizedBox(height: 20.h),
            _choose(
                "To Repeat",
                "${userOfferSubscriberProvider.repeatTimes} times",
                RepeatPattern.toRepeat,
                context,
                userOfferSubscriberProvider),
            SizedBox(height: 20.h),
            _choose("Every", "${userOfferSubscriberProvider.repeatWeeks} week",
                RepeatPattern.every, context, userOfferSubscriberProvider),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Duration",
                  style: AppTextStyles.header5Inter,
                ),
                Container(
                    width: 220.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: AppColors.grey40Color, width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(5.r))),
                    child: Padding(
                      padding: EdgeInsetsDirectional.only(start: 15.w),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                              "${userOfferSubscriberProvider.serviceDuration!} hours")),
                    ))
              ],
            ),
            SizedBox(
              height: 35.h,
            ),
            if (userOfferSubscriberProvider.repeatTimes != 0)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Select days",
                    style: AppTextStyles.header3Inter,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  ...List.generate(userOfferSubscriberProvider.repeatTimes,
                      (index) {
                    return Column(
                      children: [
                        _selectDay(index, "Day ${index + 1}", context,
                            userOfferSubscriberProvider),
                        SizedBox(
                          height: 25.h,
                        ),
                      ],
                    );
                  })
                ],
              ),
          ],
        );
      }),
    );
  }

  // show choose widgets
  Widget _choose(String title, String value, RepeatPattern pattern,
      BuildContext context, UserOfferSubscriberProvider provider) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppTextStyles.header5Inter,
        ),
        InkWell(
          onTap: () {
            if (pattern == RepeatPattern.toRepeat) {
              RecurrentBottomSheets.showRecurrentTimeBottomSheet(
                  context, provider.repeatTimes, (time) {
                provider.setRepeatTimes(time);
              });
            } else if (pattern == RepeatPattern.every) {
              RecurrentBottomSheets.showRecurrentPeriodBottomSheet(
                  context, provider.repeatWeeks, (week) {
                provider.setRepeatWeeks(week);
              });
            }
          },
          child: Container(
            width: 220.w,
            height: 40.h,
            decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.all(Radius.circular(5.r))),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    value,
                    style: AppTextStyles.paragraphRobotoMedium,
                  ),
                  Icon(
                    Icons.arrow_forward,
                    size: 15.r,
                    color: AppColors.blackColor,
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  // show select days options
  Widget _selectDay(int index, String title, BuildContext context,
      UserOfferSubscriberProvider provider) {
    return InkWell(
      onTap: () {
        CalendarBottomSheet.showCalendarDaysDottedDialog(context, (date) {
          provider.setRepeatDays(
              index,
              date.subtract(Duration(
                  hours: date.hour,
                  minutes: date.minute,
                  seconds: date.second)));
        });
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppTextStyles.interRegularBlack,
          ),
          Container(
            width: 220.w,
            height: 40.h,
            decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.all(Radius.circular(5.r))),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "*  ${provider.repeatDays.length < index + 1 ? 'please select date' : provider.repeatDays[index].mmmdd()}  *  ${provider.serviceTimeSlot}",
                    style: AppTextStyles.paragraphRobotoMedium,
                  ),
                  Icon(
                    Icons.arrow_forward,
                    size: 15.r,
                    color: AppColors.blackColor,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
