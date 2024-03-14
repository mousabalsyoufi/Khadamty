import 'package:faciltateur_de_vies/constants/colors/colors.dart';
import 'package:faciltateur_de_vies/constants/enums/easer_service_history_enum.dart';
import 'package:faciltateur_de_vies/core/extensions/date_extensions.dart';
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
import '../../../../core/helpers/date_helper.dart';
import '../../../../shared_widgets/custom_category_badge.dart';

class EaserServiceCard extends StatelessWidget {
  final HistoryOrdersModel serviceHistory;
  const EaserServiceCard({Key? key, required this.serviceHistory})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 6.h,
        ),
        Text(
          DateHelper.yyyyMMdd(serviceHistory.date!),
          style: AppTextStyles.header5InterGrey90,
        ),
        SizedBox(
          height: 6.h,
        ),
        GestureDetector(
          onTap: (() {
            RoutingProvider.pushNamed(
                routeName: Routes.easerServiceHistoryDetailsScreen,
                arguments: serviceHistory.id);
          }),
          child: Container(
            height: 65.h,
            width: 320.w,
            decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.all(Radius.circular(5.r))),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsetsDirectional.only(start: 11.w),
                  height: 40.h,
                  width: 55.w,
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.greyColor, width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(5.r))),
                  child: Center(
                    child: Text(
                      (DateHelper.hhmm(serviceHistory.lines![0].startDate!)),
                      style: AppTextStyles.header5InterGrey90.copyWith(
                          fontSize: 14.sp,
                          decoration: serviceHistory.status ==
                                  ServiceHistoryStatusEnum.canceled
                              ? TextDecoration.lineThrough
                              : null),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(top: 15.h, start: 10.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        serviceHistory.lines?[0].productLabel ?? "No Title",
                        style: AppTextStyles.header4Inter,
                      ),
                      /*  SizedBox(
                        height: 6.h,
                      ),
                      Text(
                        serviceHistory.serviceProvidingName,
                        style: AppTextStyles.paragraph2Roboto
                            .copyWith(fontSize: 12.sp),
                      ), */
                    ],
                  ),
                ),
                const Spacer(),
                Container(
                  width: 80.w,
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomCategoryBadgeExtended(
                        label: serviceHistory.category!.label,
                        color: Utility.hexColor(serviceHistory.category!.color),
                      ),
                      _bottomRightSide(),
                      /* if (serviceHistory.serviceHistoryStatus ==
                          ServiceHistoryStatusEnum.rated)
                        Row(
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
                        ),
                      if (serviceHistory.serviceHistoryStatus !=
                          ServiceHistoryStatusEnum.rated)
                        Text(
                          serviceHistory.serviceHistoryStatus.name,
                          style: AppTextStyles.paragraphRobotoMedium.copyWith(
                              fontSize: 12.sp,
                              color: serviceHistory.serviceHistoryStatus ==
                                      ServiceHistoryStatusEnum.canceled
                                  ? AppColors.redColor
                                  : AppColors.blackColor),
                        ) */
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _bottomRightSide() {
    //historyOrdersModel.status == ServiceHistoryStatusEnum.rated
    if (serviceHistory.lines![0].rating > -1) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
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
            serviceHistory.lines![0].rating.toString(),
            style: AppTextStyles.robotoMediumBlack,
          )
        ],
      );
    }
    //serviceHistory.serviceHistoryStatus != ServiceHistoryStatusEnum.rated
    if (serviceHistory.lines![0].rating < 0) {
      return Text(
        "No Rating ",
        style: AppTextStyles.paragraphRobotoMedium.copyWith(
            fontSize: 12.sp,
            color: serviceHistory.status == ServiceHistoryStatusEnum.canceled
                ? AppColors.redColor
                : AppColors.blackColor),
      );
    }
    return Container();
  }
}
