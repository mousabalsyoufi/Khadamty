import 'package:faciltateur_de_vies/shared_widgets/custom_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../../../constants/colors/colors.dart';

class ServiceSubscribeProcessScreenHeader extends StatelessWidget {
  const ServiceSubscribeProcessScreenHeader({super.key, required this.percent});

  final double percent;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CustomBackButton(),
        SizedBox(
          width: 17.w,
        ),
        SizedBox(
          height: 10.h,
          width: 216.w,
          child: LinearPercentIndicator(
            padding: EdgeInsets.zero,
            animation: false,
            lineHeight: 25.h,
            animationDuration: 2500,
            percent: percent,
            backgroundColor: AppColors.whiteColor,
            barRadius: Radius.circular(15.r),
            progressColor: AppColors.greenColor,
          ),
        ),
      ],
    );
  }
}
