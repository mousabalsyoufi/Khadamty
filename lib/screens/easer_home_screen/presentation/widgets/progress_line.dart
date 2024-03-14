import 'package:faciltateur_de_vies/constants/colors/colors.dart';
import 'package:faciltateur_de_vies/constants/text_styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// custom progress line
class ProgressIndicatorLine extends StatelessWidget {
  final double percent;
  const ProgressIndicatorLine({Key? key,required this.percent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        LinearPercentIndicator(
          padding: EdgeInsets.zero,
          animation: false,
          lineHeight: 25.h,
          animationDuration: 2500,
          percent: percent,
          backgroundColor: AppColors.whiteColor,
          barRadius: Radius.circular(15.r),
          progressColor:getColor(percent),
        ),
        Positioned(
            top:5.h,
            right: 20.w,
            child: Text("${(percent*10).toStringAsFixed(0)}/10",style: AppTextStyles.paragraph1Roboto.copyWith(fontWeight: FontWeight.w500),))
      ],
    );
  }

  getColor(double percent){
    // return Red color
    if(percent <= 0.3){
      return AppColors.redColor;
    }else if(percent > 0.3 && percent <= 0.5){
     // yellow
      return AppColors.yellowColor;
    }else {
      // green
      return AppColors.greenColor;
    }
  }

}
