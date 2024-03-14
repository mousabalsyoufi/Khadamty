import 'package:faciltateur_de_vies/constants/colors/colors.dart';
import 'package:faciltateur_de_vies/constants/enums/easer_service_history_enum.dart';
import 'package:faciltateur_de_vies/core/extensions/date_extensions.dart';
import 'package:faciltateur_de_vies/core/helpers/date_helper.dart';
import 'package:faciltateur_de_vies/core/utility/utility.dart';
import 'package:faciltateur_de_vies/routes/routes_names/routes_names.dart';
import 'package:faciltateur_de_vies/routes/routes_provider/routes_provider.dart';
import 'package:faciltateur_de_vies/screens/easer_services_history_screen/data/model/service_history_model.dart';
import 'package:faciltateur_de_vies/screens/user_bookings_screen/data/model/history_orders_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../constants/icons/icons.dart';
import '../../../../constants/text_styles/text_styles.dart';
import '../../../../shared_widgets/circle_image_with_border.dart';
import '../../../../shared_widgets/custom_category_badge.dart';

@Deprecated(
    "This is class deprecated please use this 'HistoryListItem' instanded.")
class HistoryEventListItem extends StatelessWidget {
  final ServiceHistoryModel serviceHistory;
  final bool bottomSheet;
  const HistoryEventListItem(
      {Key? key, required this.serviceHistory, this.bottomSheet = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (!bottomSheet)
          Text(
            serviceHistory.serviceHistoryDate.doMMMyyyy(),
            style: AppTextStyles.header5InterGrey90,
          ),
        SizedBox(
          height: 6.h,
        ),
        GestureDetector(
          onTap: () {
            bottomSheet
                ? null
                : RoutingProvider.pushNamed(
                    routeName: Routes.userHistoryReviewScreen,
                    arguments: false);
          },
          child: Container(
            padding: EdgeInsets.all(13.r),
            decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.all(Radius.circular(5.r))),
            child: Row(
              children: [
                Container(
                  height: 40.h,
                  width: 55.w,
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.greyColor, width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(5.r))),
                  child: Center(
                    child: Text(
                      (serviceHistory.serviceHistoryDate.hhmm()),
                      style: AppTextStyles.header5InterGrey90.copyWith(
                          fontSize: 14.sp,
                          decoration: serviceHistory.serviceHistoryStatus ==
                                  ServiceHistoryStatusEnum.canceled
                              ? TextDecoration.lineThrough
                              : null),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      serviceHistory.serviceHistoryName,
                      style: AppTextStyles.header4Inter,
                    ),
                    SizedBox(
                      height: 6.h,
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
                          serviceHistory.serviceProvidingName,
                          style: AppTextStyles.robotoRegularBlack(12.sp),
                        )
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomCategoryBadge(
                        categoryType: serviceHistory.categoryType),
                    SizedBox(
                      height: 5.h,
                    ),
                    _bottomLeftSide()
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _bottomLeftSide() {
    if (!bottomSheet) {
      if (serviceHistory.serviceHistoryStatus ==
          ServiceHistoryStatusEnum.rated) {
        return Row(
          children: [
            SvgPicture.asset(
              AppIcons.ratingStar,
              width: 15.r,
              height: 15.r,
            ),
            SizedBox(
              width: 9.w,
            ),
            Text(
              serviceHistory.ratingValue.toString(),
              style: AppTextStyles.robotoMediumBlack,
            )
          ],
        );
      }
      if (serviceHistory.serviceHistoryStatus !=
          ServiceHistoryStatusEnum.rated) {
        return Text(
          serviceHistory.serviceHistoryStatus.name,
          style: AppTextStyles.paragraphRobotoMedium.copyWith(
              fontSize: 12.sp,
              color: serviceHistory.serviceHistoryStatus ==
                      ServiceHistoryStatusEnum.canceled
                  ? AppColors.redColor
                  : AppColors.blackColor),
        );
      }
      return Container();
    } else {
      return Text(
        serviceHistory.serviceHistoryDate.doMMMyyyy(),
        style: AppTextStyles.header5InterGrey90,
      );
    }
  }
}

class HistoryListItem extends StatelessWidget {
  final HistoryOrdersModel historyOrdersModel;
  final bool bottomSheet;
  const HistoryListItem(
      {Key? key, required this.historyOrdersModel, this.bottomSheet = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color cardColor = Utility.hexColor(historyOrdersModel.category!.color);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (!bottomSheet)
          Text(
            DateHelper.yyyyMMdd(historyOrdersModel.date.toString()),
            style: AppTextStyles.header5InterGrey90,
          ),
        SizedBox(
          height: 6.h,
        ),
        GestureDetector(
          onTap: () {
            bottomSheet
                ? null
                : RoutingProvider.pushNamed(
                    routeName: Routes.userHistoryReviewScreen,
                    arguments: {
                        'orderId': historyOrdersModel.id,
                        'serviceId': historyOrdersModel.lines![0].id
                      });
          },
          child: Container(
            padding: EdgeInsets.all(13.r),
            decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.all(Radius.circular(5.r))),
            child: Row(
              children: [
                Container(
                  height: 40.h,
                  width: 55.w,
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.greyColor, width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(5.r))),
                  child: Center(
                    child: Text(
                      (DateHelper.hhmm(historyOrdersModel.lines![0].startDate!)),
                      style: AppTextStyles.header5InterGrey90.copyWith(
                          fontSize: 14.sp,
                          decoration: historyOrdersModel.status ==
                                  ServiceHistoryStatusEnum.canceled
                              ? TextDecoration.lineThrough
                              : null),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      historyOrdersModel.lines?[0].productLabel ?? "No Title",
                      style: AppTextStyles.header4Inter,
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    // Row(
                    //   children: [
                    //     CircleImageWithBorder(
                    //       url:
                    //       'https://freepngimg.com/thumb/man/10-man-png-image.png',
                    //       width: 18.h,
                    //       height: 18.h,
                    //     ),
                    //     SizedBox(width: 5.w),
                    //     Text(
                    //       "Alain Rance",
                    //       style: AppTextStyles.robotoRegularBlack(12.sp),
                    //     )
                    //   ],
                    // ),
                  ],
                ),
                const Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomCategoryBadgeExtended(
                        color: cardColor,
                        label: historyOrdersModel.category!.label),
                    SizedBox(
                      height: 5.h,
                    ),
                    _bottomLeftSide()
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _bottomLeftSide() {
    if (!bottomSheet) {
      //historyOrdersModel.status == ServiceHistoryStatusEnum.rated
      if (historyOrdersModel.lines![0].rating > -1) {
        return Row(
          children: [
            SvgPicture.asset(
              AppIcons.ratingStar,
              width: 15.r,
              height: 15.r,
            ),
            SizedBox(
              width: 9.w,
            ),
            Text(
              historyOrdersModel.lines![0].rating.toString(),
              style: AppTextStyles.robotoMediumBlack,
            )
          ],
        );
      }
      //serviceHistory.serviceHistoryStatus != ServiceHistoryStatusEnum.rated
      if (historyOrdersModel.lines![0].rating < 0) {
        return Text(
          "No Rating ",
          style: AppTextStyles.paragraphRobotoMedium.copyWith(
              fontSize: 12.sp,
              color:
                  historyOrdersModel.status == ServiceHistoryStatusEnum.canceled
                      ? AppColors.redColor
                      : AppColors.blackColor),
        );
      }
      return Container();
    } else {
      return Text(
        DateHelper.yyyyMMdd(historyOrdersModel.date.toString()),
        style: AppTextStyles.header5InterGrey90,
      );
    }
  }
}
