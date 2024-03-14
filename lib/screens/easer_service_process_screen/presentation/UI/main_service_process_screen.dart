import 'package:faciltateur_de_vies/core/utility/utility.dart';
import 'package:faciltateur_de_vies/routes/routes_provider/routes_provider.dart';
import 'package:faciltateur_de_vies/screens/easer_service_process_screen/business_logic/provider/easer_report_provider.dart';
import 'package:faciltateur_de_vies/screens/easer_service_process_screen/presentation/UI/easer_service_process_confirmation_screen.dart';
import 'package:faciltateur_de_vies/shared_widgets/custom_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';
import '../../../../constants/colors/colors.dart';
import '../../../../constants/enums/easer_report_enum.dart';
import '../../../../constants/icons/icons.dart';
import '../../../../routes/routes_names/routes_names.dart';
import '../../../../shared_widgets/custom_button_black.dart';
import '../widgets/report_details_widget.dart';
import 'easer_service_process_before_screen.dart';
import 'easer_service_process_after_screen.dart';

// This is a main screen to manage Report screens flow
class MainServiceProcessScreen extends StatefulWidget {
  const MainServiceProcessScreen({Key? key}) : super(key: key);

  @override
  State<MainServiceProcessScreen> createState() =>
      _MainServiceProcessScreenState();
}

class _MainServiceProcessScreenState extends State<MainServiceProcessScreen> {
  double percent = 0.4;

  @override
  Widget build(BuildContext context) {
    Utility.changeStatusBarToTransparent();
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
        child: Column(
          children: [
            SizedBox(
              height: 30.h,
            ),
            // one header to Three Report Screen
            _header(),
            SizedBox(
              height: 20.h,
            ),
            // change body of report screens depended on progress status [ Before , After , Confirmation]
            Selector<EaserReportProvider, PercentageStatus>(
                selector:
                    (BuildContext context, EaserReportProvider provider) =>
                        provider.percentageStatus,
                builder: (BuildContext context,
                    PercentageStatus percentageStatus, child) {
                  if (percentageStatus == PercentageStatus.before) {
                    return const Expanded(child:  EaserServiceProcessBeforeScreen());
                  } else if (percentageStatus == PercentageStatus.after) {
                    return const Expanded(
                        child: EaserServiceProcessAfterScreen());
                  } else if (percentageStatus ==
                      PercentageStatus.confirmation) {
                    return Expanded(
                        child: EaserConfirmationServiceProcessScreen());
                  }
                  return const SizedBox(
                    height: 0,
                    width: 0,
                  );
                }),
            // Bottom Bar Button unified for Three Screens
            _bottom()
          ],
        ),
      ),
    );
  }

  Widget _header() {
    return Consumer<EaserReportProvider>(
      builder: (BuildContext context, EaserReportProvider provider, _) {
        return Column(
          children: [
            Row(
              children: [
                CustomBackButton(
                  callBack: () {
                    if (provider.percent > 0.3) {
                      provider.changePercentBack();
                    } else {
                      RoutingProvider.goBack();
                    }
                  },
                ),
                SizedBox(
                  width: 10.w,
                ),
                SizedBox(
                  height: 10.h,
                  width: 216.w,
                  child: LinearPercentIndicator(
                    padding: EdgeInsets.zero,
                    animation: false,
                    lineHeight: 25.h,
                    animationDuration: 2500,
                    percent: provider.percent,
                    backgroundColor: AppColors.whiteColor,
                    barRadius: Radius.circular(15.r),
                    progressColor: AppColors.greenColor,
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    // if chat refer to history set the arguments True otherwise false
                    RoutingProvider.pushNamed(
                        routeName: Routes.sharedChatScreen, arguments: false);
                  },
                  child: SvgPicture.asset(
                    AppIcons.chatInServiceIcon,
                    width: 35.r,
                    height: 35.r,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            const ReportDetails(),
          ],
        );
      },
    );
  }

  Widget _bottom() {
    return Consumer<EaserReportProvider>(
        builder: (BuildContext context, EaserReportProvider provider, child) {
      return Column(
        children: [
          CustomButtonBlack(
              buttonContent:  Text(getTextButton(provider)), 
              onPressed: () {
                // if last page should be nav into scanning screen
                if (provider.percentageStatus ==
                    PercentageStatus.confirmation) {
                  // this arguments to detected if first scan or end one
                  RoutingProvider.pushNamed(
                      routeName: Routes.easerQrScanScreen, arguments: false);
                } else {
                  // TODO 2 update here should be reduce to one only :( ` updateUi()` called two time
                  provider.changePercent();
                  provider.isReporting(ReportBtnStatus.base);
                }
              })
        ],
      );
    });
  }

  String getTextButton(EaserReportProvider provider) {
    if (provider.reportButton == ReportBtnStatus.yes &&
        provider.percentageStatus == PercentageStatus.before) {
      return "Report";
    } else if (provider.percentageStatus == PercentageStatus.after ||
        provider.reportButton == ReportBtnStatus.no) {
      return "Next";
    } else if (provider.percentageStatus == PercentageStatus.confirmation) {
      return "Send and close";
    }
    return "Next";
  }
}
