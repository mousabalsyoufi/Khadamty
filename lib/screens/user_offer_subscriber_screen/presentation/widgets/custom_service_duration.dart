import 'package:faciltateur_de_vies/constants/colors/colors.dart';
import 'package:faciltateur_de_vies/constants/icons/icons.dart';
import 'package:faciltateur_de_vies/constants/text_styles/text_styles.dart';
import 'package:faciltateur_de_vies/screens/user_offer_subscriber_screen/business_logic/provider/user_offer_subscriber_provider.dart';
import 'package:faciltateur_de_vies/screens/user_offer_subscriber_screen/data/models/slot_hour_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class CustomServiceDurationWidget extends StatelessWidget {
  const CustomServiceDurationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserOfferSubscriberProvider provider =
        Provider.of<UserOfferSubscriberProvider>(context, listen: true);
    return SizedBox(
      height: 47.h,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: provider.hours.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          SlotHour item = provider.hours[index];
          return Padding(
            padding: EdgeInsetsDirectional.only(end: 11.w, top: 10.h),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                InkWell(
                  onTap: () {
                    provider.setDurationService(index);
                  },
                  child: Container(
                    height: 40.h,
                    width: 47.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5.r)),
                        color: item.isSelected
                            ? AppColors.blackColor
                            : AppColors.whiteColor),
                    child: Center(
                      child: Text("${item.hour}h",
                          style: item.isSelected
                              ? AppTextStyles.robotoBoldWhite
                              : AppTextStyles.header5Inter),
                    ),
                  ),
                ),
                if (item.isSelected)
                  Positioned(
                      top: -12.h,
                      left: 14.w,
                      child: SvgPicture.asset(
                        AppIcons.successMarkIcon,
                        height: 20.h,
                        width: 20.w,
                        fit: BoxFit.cover,
                      )),
              ],
            ),
          );
        },
      ),
    );
  }
}
