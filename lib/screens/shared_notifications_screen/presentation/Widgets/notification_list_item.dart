import 'package:faciltateur_de_vies/constants/colors/colors.dart';
import 'package:faciltateur_de_vies/constants/icons/icons.dart';
import 'package:faciltateur_de_vies/constants/text_styles/text_styles.dart';
import 'package:faciltateur_de_vies/core/extensions/date_extensions.dart';
import 'package:faciltateur_de_vies/core/helpers/date_helper.dart';
import 'package:faciltateur_de_vies/screens/shared_notifications_screen/data/model/notifications_respnse_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class NotificationListItem extends StatelessWidget {
  const NotificationListItem({Key? key, required this.notification})
      : super(
          key: key,
        );

  final NotificationsResponseModel notification;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 15.w,
        right: 10.w,
        top: 10.h,
        bottom: 10.h,
      ),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(5.r),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            AppIcons.myBonusIcon,
            width: 35.r,
            height: 35.r,
          ),
          SizedBox(
            width: 20.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                notification.name,
                style: AppTextStyles.robotoRegularBlack(12.sp),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                notification.description,
                style: AppTextStyles.header4Inter,
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                DateTime.parse(notification.createdAt)
                    .add(Duration(hours: DateTime.now().timeZoneOffset.inHours))
                    .yyyyMMMddhh(),
                style: AppTextStyles.robotoRegularGrey50,
              ),
            ],
          ),
          const Spacer(),
          Container(
            width: 5.r,
            height: 5.r,
            decoration: const BoxDecoration(
                color: AppColors.greenColor, shape: BoxShape.circle),
          )
        ],
      ),
    );
  }
}
