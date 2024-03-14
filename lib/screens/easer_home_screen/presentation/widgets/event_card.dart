import 'package:faciltateur_de_vies/constants/colors/colors.dart';
import 'package:faciltateur_de_vies/routes/routes_names/routes_names.dart';
import 'package:faciltateur_de_vies/routes/routes_provider/routes_provider.dart';
import 'package:faciltateur_de_vies/screens/user_bookings_screen/data/model/upcoming_orders_model.dart';
import 'package:faciltateur_de_vies/shared_widgets/custom_event_time_frame.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/text_styles/text_styles.dart';
import '../../../../core/helpers/date_helper.dart';
import '../../../../core/utility/utility.dart';
import '../../../../shared_widgets/custom_category_badge.dart';
import '../../../../shared_widgets/custom_recursive_circle.dart';

class EventCard extends StatelessWidget {
  const EventCard({Key? key, required this.event}) : super(key: key);
  final UpcomingOrdersModel event;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() {
        RoutingProvider.pushNamed(
            routeName: Routes.easerServiceDetailsScreen, arguments: event.id);
      }),
      child: Stack(
        children: [
          Container(
              padding: EdgeInsets.all(8.r),
              margin: EdgeInsetsDirectional.only(bottom: 20.h),
              decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.all(Radius.circular(5.r))),
              height: 77.h,
              width: 320.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomEventTimeFrame(
                      width: 55.w,
                      height: 76.h,
                      eventColor: Utility.hexColor(event.category!.color),
                      eventTime: DateHelper.hhmm(event.lines![0].startDate!)),
                  SizedBox(
                    width: 12.w,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        event.lines![0].productLabel!,
                        style: AppTextStyles.header4Inter,
                      ),
                      /*  Text(
                        "${event.eventPlace}\n${event.eventCost}",
                        style: AppTextStyles.paragraph2Roboto
                            .copyWith(color: AppColors.blackColor),
                      ), */
                    ],
                  ),
                  const Spacer(),
                  CustomCategoryBadgeExtended(
                    color: Utility.hexColor(event.category!.color),
                    label: event.category!.label,
                  )
                ],
              )),
          if (event.isRecurrent!)
            Positioned(
                top: 1.h, left: 25.w, child: const CustomRecursiveCircle())
        ],
      ),
    );
  }
}
