import 'package:faciltateur_de_vies/constants/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/text_styles/text_styles.dart';

class CustomCircularPercentIndicator extends StatelessWidget {
  final double percent;
  const CustomCircularPercentIndicator({Key? key,required this.percent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String result = (percent*10).toStringAsFixed(0);
    return CircularPercentIndicator(
      radius: 30.r,
      percent: percent,
      lineWidth: 8.r,
      backgroundColor: AppColors.greyColor,
      progressColor: AppColors.greenColor,
      center: Text("$result/10",style: AppTextStyles.header3Inter),
    );
  }
}
