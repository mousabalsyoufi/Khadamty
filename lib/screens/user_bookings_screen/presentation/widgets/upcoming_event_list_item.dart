import 'package:faciltateur_de_vies/constants/colors/colors.dart';
import 'package:faciltateur_de_vies/core/helpers/date_helper.dart';
import 'package:faciltateur_de_vies/routes/routes_names/routes_names.dart';
import 'package:faciltateur_de_vies/routes/routes_provider/routes_provider.dart';
import 'package:faciltateur_de_vies/screens/user_bookings_screen/data/model/upcoming_orders_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/text_styles/text_styles.dart';
import '../../../../core/utility/utility.dart';
import '../../../../shared_widgets/custom_category_badge.dart';
import '../../../../shared_widgets/custom_event_time_frame.dart';
import '../../../../shared_widgets/custom_recursive_circle.dart';

class UpcomingEventListItem extends StatelessWidget {
  final UpcomingOrdersModel upcomingOrdersModel;
  const UpcomingEventListItem({Key? key, required this.upcomingOrdersModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color cardColor = Utility.hexColor(upcomingOrdersModel.category!.color);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          DateHelper.yyyyMMdd(upcomingOrdersModel.date.toString()),
          style: AppTextStyles.interMeduimGrey,
        ),
        SizedBox(
          height: 5.h,
        ),
        GestureDetector(
          onTap: () {
            RoutingProvider.pushNamed(
                routeName: Routes.userUpcomingOneTimeServiceDetailsScreen,
                arguments: upcomingOrdersModel.id.toString());
          },
          child: Stack(
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
                          eventTime: DateHelper.hhmm(
                              upcomingOrdersModel.lines![0].startDate!)),
                      SizedBox(
                        width: 10.w,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            upcomingOrdersModel.lines?[0].productLabel ??
                                "No Title",
                            style: AppTextStyles.header4Inter,
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          // Row(
                          //   children: [
                          //     CircleImageWithBorder(
                          //       url:
                          //           'https://freepngimg.com/thumb/man/10-man-png-image.png',
                          //       width: 18.h,
                          //       height: 18.h,
                          //     ),
                          //     SizedBox(width: 5.w),
                          //     Text(
                          //       'Jhon',
                          //       style: AppTextStyles.robotoRegularBlack(12.sp),
                          //     )
                          //   ],
                          // )
                        ],
                      ),
                      const Spacer(),
                      Column(
                        children: [
                          CustomCategoryBadgeExtended(
                              color: cardColor,
                              label: upcomingOrdersModel.category!.label
                                  .toString()),
                          SizedBox(
                            height: 10.h,
                          ),
                        ],
                      )
                    ],
                  )),
              if (upcomingOrdersModel.isRecurrent!)
                Positioned(
                    top: 6.h, left: 30.w, child: const CustomRecursiveCircle()),
            ],
          ),
        ),
      ],
    );
  }
}
