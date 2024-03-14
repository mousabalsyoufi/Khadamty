import 'package:faciltateur_de_vies/constants/colors/colors.dart';
import 'package:faciltateur_de_vies/constants/text_styles/text_styles.dart';
import 'package:faciltateur_de_vies/screens/easer_service_process_screen/business_logic/provider/easer_report_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../constants/enums/easer_report_enum.dart';
import '../../../../shared_widgets/bottom_sheets/widgets/small_bottom_sheet_button.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class StateOfPlay extends StatelessWidget {
  const StateOfPlay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    EaserReportProvider provider = Provider.of<EaserReportProvider>(context, listen: true);
    return Container(
      height: 129.h,
      width: 320.w,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.all(
          Radius.circular(5.r),
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.only(start: 16.w, end: 16.w, top: 16.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "State of play",
              style: AppTextStyles.header4Inter,
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              "Do you have something to report?",
              style: AppTextStyles.robotoRegularBlack(12.sp),
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Button Yes
                SmallBottomSheetButton(
                  buttonText: "Yes",
                  onPressed: () {
                    // set status as Yes
                    provider.isReporting(ReportBtnStatus.yes);
                  },
                  buttonTextStyle: getButtonStyle(provider, true),
                  buttonColor: getButtonColor(provider, true),
                  buttonWidth: 127.w,
                  borderColor: AppColors.transparentColor,
                ),
                // Button No
                SmallBottomSheetButton(
                    buttonText: "No",
                    onPressed: () {
                      // set status as No
                      provider.isReporting(ReportBtnStatus.no);
                    },
                    borderColor: AppColors.transparentColor,
                    buttonTextStyle: getButtonStyle(provider, false),
                    buttonColor: getButtonColor(provider, false),
                    buttonWidth: 127.w),
              ],
            )
          ],
        ),
      ),
    );
  }

  // get TextStyle of buttons  ( Yes or No )
  TextStyle getButtonStyle(EaserReportProvider provider, bool isYes) {
    if (provider.reportButton == ReportBtnStatus.yes && isYes ||
        provider.reportButton == ReportBtnStatus.no && !isYes) {
      return AppTextStyles.robotoMediumBlack;
    }
    return AppTextStyles.robotoMediumWhite;
  }

  // get Color of buttons (Yes or No)
  Color getButtonColor(EaserReportProvider provider, bool isYes) {
    if (provider.reportButton == ReportBtnStatus.yes && isYes) {
      return AppColors.redColor;
    } else if (provider.reportButton == ReportBtnStatus.no && !isYes) {
      return AppColors.greenColor;
    }
    return AppColors.blackColor;
  }
}
