import 'package:faciltateur_de_vies/core/extensions/date_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../../constants/colors/colors.dart';
import '../../../../constants/enums/pattren_repeat.dart';
import '../../../../constants/icons/icons.dart';
import '../../../../constants/text_styles/text_styles.dart';
import '../../../../routes/routes_names/routes_names.dart';
import '../../../../routes/routes_provider/routes_provider.dart';
import '../../../../shared_widgets/bottom_sheets/calendar_bottom_sheet/calendar_bottom.dart';
import '../../../../shared_widgets/bottom_sheets/recurrent_bottom_sheets/recurrent_bottom_sheets.dart';
import '../../../../shared_widgets/custom_black_button_with_title.dart';
import '../../business_logic/provider/user_service_subscribe_process_provider.dart';
import '../widgets/service_subscribe_process_screen_header.dart';

class UserServiceProcessRecurrentServiceDateScreen extends StatelessWidget {
  const UserServiceProcessRecurrentServiceDateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 20.h),
          child: Consumer<UserServiceSubscribeProcessProvider>(
            builder: (context, subscribeServiceProvider, child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      const ServiceSubscribeProcessScreenHeader(percent: 0.45),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          RoutingProvider.pushNamed(
                              routeName: Routes.sharedFaqScreeen);
                        },
                        child: SvgPicture.asset(
                          AppIcons.questionBubbleIcon,
                          height: 35.h,
                          width: 35.w,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Text(
                    'Select repeat pattern',
                    style: AppTextStyles.header3Inter,
                  ),
                  SizedBox(height: 20.h),
                  _choose(
                      "To Repeat",
                      "${subscribeServiceProvider.repeatTimes} times",
                      RepeatPattern.toRepeat,
                      context,
                      subscribeServiceProvider),
                  SizedBox(height: 20.h),
                  _choose(
                      "Every",
                      "${subscribeServiceProvider.repeatWeeks} week",
                      RepeatPattern.every,
                      context,
                      subscribeServiceProvider),
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
                              border: Border.all(
                                  color: AppColors.grey40Color, width: 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.r))),
                          child: Padding(
                            padding: EdgeInsetsDirectional.only(start: 15.w),
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                    "${subscribeServiceProvider.oneTimeerviceDuration!.substring(0, 1)} hours")),
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 35.h,
                  ),
                  if (subscribeServiceProvider.repeatTimes != 0)
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
                        ...List.generate(subscribeServiceProvider.repeatTimes,
                            (index) {
                          return Column(
                            children: [
                              _selectDay(index, "Day ${index + 1}", context,
                                  subscribeServiceProvider),
                              SizedBox(
                                height: 25.h,
                              ),
                            ],
                          );
                        })
                      ],
                    ),
                  const Spacer(),
                  CustomButtonBlackWithText(
                    buttonText: "Continue",
                    onPressed: subscribeServiceProvider
                            .isRecurrentTimesBtnEnabled
                        ? () {
                            RoutingProvider.pushNamed(
                                routeName:
                                    Routes.userServiceSubscibeAddAddressScreen);
                          }
                        : null,
                    trailingText:
                        '${subscribeServiceProvider.getServicePrice()}€',
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  // show choose widgets
  Widget _choose(String title, String value, RepeatPattern pattern,
      BuildContext context, UserServiceSubscribeProcessProvider provider) {
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
      UserServiceSubscribeProcessProvider provider) {
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
                    "*  ${provider.repeatDays.length < index + 1 ? 'please select date' : provider.repeatDays[index].mmmdd()}  *  ${provider.oneTimeServiceTimeSlot}",
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
