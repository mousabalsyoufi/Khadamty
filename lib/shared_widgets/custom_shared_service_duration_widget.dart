import 'package:faciltateur_de_vies/constants/colors/colors.dart';
import 'package:faciltateur_de_vies/constants/icons/icons.dart';
import 'package:faciltateur_de_vies/constants/text_styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../screens/user_subscribe_to_service_process/data/model/service_time_model.dart';

class CustomSharedServiceDurationWidget extends StatelessWidget {
  const CustomSharedServiceDurationWidget(
      {Key? key, required this.times, required this.onTap})
      : super(key: key);

  final List<ServiceTimeModel> times;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 47.h,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: times.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          ServiceTimeModel item = times[index];
          return Padding(
            padding: EdgeInsetsDirectional.only(end: 11.w, top: 10.h),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                InkWell(
                  onTap: () => onTap(index),
                  child: Container(
                    height: 40.h,
                    width: 47.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5.r)),
                        color: item.isSelected
                            ? AppColors.blackColor
                            : AppColors.whiteColor),
                    child: Center(
                      child: Text(item.time,
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
