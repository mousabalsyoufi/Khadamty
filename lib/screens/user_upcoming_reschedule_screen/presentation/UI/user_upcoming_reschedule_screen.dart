import 'package:faciltateur_de_vies/core/extensions/date_extensions.dart';
import 'package:faciltateur_de_vies/shared_widgets/bottom_sheets/reservation_confirmation_bottom_sheets/reservation_confirmation_bottom_sheet.dart';
import 'package:faciltateur_de_vies/shared_widgets/custom_button_black.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../constants/colors/colors.dart';
import '../../../../constants/enums/categories_type.dart';
import '../../../../constants/text_styles/text_styles.dart';
import '../../../../shared_widgets/circle_image_with_border.dart';
import '../../../../shared_widgets/custom_appbar.dart';
import '../../../../shared_widgets/custom_category_badge.dart';
import '../../../../shared_widgets/custom_event_time_frame.dart';
import '../../../../shared_widgets/custom_shared_service_duration_widget.dart';
import '../../business_logic/provider/user_upcoming_reschedule_provider.dart';
import '../widgets/service_date_day_picker_reschedule.dart';

class UserUpcomingRescheduleScreen extends StatelessWidget {
  const UserUpcomingRescheduleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('Reschedule service', actions: []),
      body: Consumer<UserUpcomingRescheduleProvider>(
        builder: (BuildContext context,
            UserUpcomingRescheduleProvider userUpComingProvider, _) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    padding: EdgeInsets.all(13.r),
                    decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.all(Radius.circular(5.r))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomEventTimeFrame(
                            width: 55.w,
                            height: 40.h,
                            eventColor: AppColors.blueColor,
                            eventTime: DateTime.now().hhmm()),
                        SizedBox(
                          width: 10.w,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Cleaning',
                              style: AppTextStyles.header4Inter,
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Row(
                              children: [
                                CircleImageWithBorder(
                                  url:
                                      'https://freepngimg.com/thumb/man/10-man-png-image.png',
                                  width: 18.h,
                                  height: 18.h,
                                ),
                                SizedBox(width: 5.w),
                                Text(
                                  'Jhon',
                                  style:
                                      AppTextStyles.robotoRegularBlack(12.sp),
                                )
                              ],
                            )
                          ],
                        ),
                        const Spacer(),
                        Column(
                          children: [
                            const CustomCategoryBadge(
                              categoryType: CategoryType.home,
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Text(
                              DateTime.now().doMMMyyyy(),
                              style: AppTextStyles.interMeduimGrey,
                            )
                          ],
                        )
                      ],
                    )),
                SizedBox(
                  height: 30.h,
                ),
                const ServiceDateDayPickerReschedule(),
                SizedBox(
                  height: 30.h,
                ),
                Text(
                  'Available slots',
                  style: AppTextStyles.interMeduimBlack,
                ),
                SizedBox(
                  height: 9.h,
                ),
                CustomSharedServiceDurationWidget(
                  times: userUpComingProvider.availableTimeSlots,
                  onTap: (index) =>
                      userUpComingProvider.setServiceTimeSlot(index),
                ),
                const Spacer(),
                CustomButtonBlack(
                  buttonContent: const Text("Confirm new Slot"),
                  onPressed:
                      userUpComingProvider.oneTimeServiceDateButtonEnabled
                          ? () {
                              ReservationConfirmationBottomSheets
                                  .showReservationModified(context);
                            }
                          : null,
                ),
                SizedBox(
                  height: 20.h,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
