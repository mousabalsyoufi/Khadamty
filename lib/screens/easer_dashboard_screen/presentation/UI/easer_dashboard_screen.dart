import 'package:faciltateur_de_vies/constants/colors/colors.dart';
import 'package:faciltateur_de_vies/constants/text_styles/text_styles.dart';
import 'package:faciltateur_de_vies/screens/easer_dashboard_screen/data/model/statistics_model.dart';
import 'package:faciltateur_de_vies/screens/easer_dashboard_screen/presentation/widgets/custom_circular_progress_indicator.dart';
import 'package:faciltateur_de_vies/shared_widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../shared_widgets/bottom_sheets/calendar_bottom_sheet/calendar_bottom.dart';
import '../../../../shared_widgets/custom_floating_date_picker_button.dart';
import '../widgets/custom_chart_bar.dart';

class EaserDashboardScreen extends StatelessWidget {
  const EaserDashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Tableau de bord", actions: [
        Padding(
          padding: EdgeInsets.all(8.r),
          child: CustomFloatingDatePickerButton(
            onPress: () {
              CalendarBottomSheet.showCalendarMonthsDialog(context);
            },
          ),
        )
      ]),
      body: Padding(
        padding: EdgeInsetsDirectional.only(start: 20.w, end: 20.w, top: 25.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "June 2022",
              style: AppTextStyles.interMeduimGrey,
            ),
            SizedBox(
              height: 5.h,
            ),
            GridView.builder(
              shrinkWrap: true,
              itemCount: statistics.length,
              itemBuilder: (BuildContext context, int index) {
                StatisticsModel statisticsModel = statistics[index];
                return Container(
                  height: 116.h,
                  width: 155.w,
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.all(Radius.circular(5.r)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.only(
                            start: 10.w, bottom: 13.h, top: 10.h),
                        child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              statisticsModel.title,
                              style: AppTextStyles.robotoRegularBlack(12.sp),
                            )),
                      ),
                      CustomCircularPercentIndicator(
                          percent: statisticsModel.percent)
                    ],
                  ),
                );
              },
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.w,
                  mainAxisSpacing: 10.h,
                  childAspectRatio: 1.4),
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              "Last 6 months",
              style: AppTextStyles.interMeduimGrey,
            ),
            SizedBox(
              height: 7.h,
            ),
            const CustomBarChart(),
          ],
        ),
      ),
    );
  }
}
