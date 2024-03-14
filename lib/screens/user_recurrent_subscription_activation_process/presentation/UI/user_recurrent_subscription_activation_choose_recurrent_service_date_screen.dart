import 'package:faciltateur_de_vies/core/extensions/date_extensions.dart';
import 'package:faciltateur_de_vies/shared_widgets/custom_appbar.dart';
import 'package:faciltateur_de_vies/shared_widgets/custom_button_black.dart';
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
import '../../business_logic/provider/user_recurrent_subscription_activation_provider.dart';

class UserRecurrentSubscriptionActivationChooseDateScreen
    extends StatelessWidget {
  const UserRecurrentSubscriptionActivationChooseDateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('Subscription activation', actions: [
        Padding(
          padding: EdgeInsetsDirectional.only(end: 15.w),
          child: GestureDetector(
            onTap: (() {
              RoutingProvider.pushNamed(routeName: Routes.sharedFaqScreeen);
            }),
            child: SvgPicture.asset(
              AppIcons.questionBubbleIcon,
              width: 35.r,
              height: 35.r,
            ),
          ),
        ),
      ]),
      body: Padding(
        padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 20.h),
        child: Consumer<UserRecurrentSubscriptionActivationProvider>(
          builder: (context, subscribeActivationProvider, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 25.h,
                ),
                Text(
                  'Select repeat pattern',
                  style: AppTextStyles.header3Inter,
                ),
                SizedBox(height: 20.h),
                _choose(
                    "To Repeat", "3 times", RepeatPattern.toRepeat, context),
                SizedBox(height: 20.h),
                _choose("Every", "1 week", RepeatPattern.every, context),
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
                          child: const Align(
                              alignment: Alignment.centerLeft,
                              child: Text("2 hours")),
                        ))
                  ],
                ),
                SizedBox(
                  height: 35.h,
                ),
                Text(
                  "Select days",
                  style: AppTextStyles.header3Inter,
                ),
                SizedBox(
                  height: 20.h,
                ),
                _selectDay("Day 1", context),
                SizedBox(
                  height: 25.h,
                ),
                _selectDay("Day 2", context),
                SizedBox(
                  height: 25.h,
                ),
                _selectDay("Day 3", context),
                const Spacer(),
                CustomButtonBlack(
                  buttonContent: const Text( "Continue") ,
                  onPressed: () {
                    RoutingProvider.pushNamed(
                        routeName: Routes
                            .userRecurrentSubscriptionActivationPickSubscriptionScreen);
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  // show choose widgets
  Widget _choose(
      String title, String value, RepeatPattern pattern, BuildContext context) {
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
              RecurrentBottomSheets.showRecurrentTimeBottomSheet(context, 1, (time){});
            } else if (pattern == RepeatPattern.every) {
              RecurrentBottomSheets.showRecurrentPeriodBottomSheet(context, 1, (week){});
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
  Widget _selectDay(String title, BuildContext context) {
    return InkWell(
      onTap: () {
        CalendarBottomSheet.showCalendarDaysDottedDialog(context, (date){});
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
                    "*  ${DateTime.now().mmmdd()}  *  ${DateTime.now().hhmm()}",
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
