import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../constants/colors/colors.dart';
import '../../../../constants/text_styles/text_styles.dart';


// This is widget to show details report
class ReportDetails extends StatelessWidget {
  const ReportDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(5.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Corinne Dubois',
                style: AppTextStyles.header4Inter,
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                '1 place Rondelet',
                style: AppTextStyles.robotoRegularBlack(12.sp),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                '34000 Montpellier',
                style: AppTextStyles.robotoRegularBlack(12.sp),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                '06 45 84 12 00',
                style: AppTextStyles.robotoRegularBlack(12.sp),
              ),
            ],
          ),
          const Spacer(),
          Container(
            width: 130.w,
            padding: EdgeInsets.all(10.r),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.r),
              border: Border.all(
                width: 1.w,
                color: AppColors.greyColor,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Start',
                      style: AppTextStyles.robotoRegularBlack(10.sp),
                    ),
                    Text(
                      '19:30',
                      style: AppTextStyles.header4Inter,
                    ),
                  ],
                ),
                Divider(
                  color: AppColors.greyColor,
                  thickness: 1.2.w,
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Duration',
                      style: AppTextStyles.robotoRegularBlack(10.sp),
                    ),
                    Text(
                      '2:00',
                      style: AppTextStyles.header4Inter,
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
