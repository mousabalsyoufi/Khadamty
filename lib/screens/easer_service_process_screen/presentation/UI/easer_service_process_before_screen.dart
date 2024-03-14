import 'package:faciltateur_de_vies/constants/colors/colors.dart';
import 'package:faciltateur_de_vies/constants/icons/icons.dart';
import 'package:faciltateur_de_vies/constants/text_styles/text_styles.dart';
import 'package:faciltateur_de_vies/routes/routes_provider/routes_provider.dart';
import 'package:faciltateur_de_vies/screens/easer_service_process_screen/business_logic/provider/easer_report_provider.dart';
import 'package:faciltateur_de_vies/screens/easer_service_process_screen/presentation/widgets/custom_upload_photo.dart';
import 'package:faciltateur_de_vies/shared_widgets/bottom_sheets/custom_sheets/custom_sheets.dart';
import 'package:faciltateur_de_vies/shared_widgets/custom_input_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../../constants/enums/easer_report_enum.dart';
import '../../../../routes/routes_names/routes_names.dart';
import '../../../../shared_widgets/bottom_sheets/resource_bottom_sheet/resource_sheet.dart';
import '../widgets/state_of_play_widget.dart';

// This is a first screen in Report process screens
class EaserServiceProcessBeforeScreen extends StatelessWidget {
  const EaserServiceProcessBeforeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    EaserReportProvider provider = Provider.of<EaserReportProvider>(context);
    return Scaffold(
      // STOP action button
      floatingActionButton: provider.reportButton == ReportBtnStatus.yes
          ? FloatingActionButton(
              backgroundColor: AppColors.blackColor,
              onPressed: () {
                CustomSheets.showIconTextTwoButtonBottomSheet(
                    context: context,
                    iconPath: AppIcons.stopIcon,
                    contentText: "Are you sure to stop the service?",
                    acceptButtonText: "Yes",
                    rejectButtonText: "No",
                    acceptButtonColor: AppColors.blackColor,
                    rejectButtonColor: AppColors.blackColor,
                    acceptButtonTapFunction: () {
                      if (provider.percentageStatus ==
                          PercentageStatus.before) {
                        RoutingProvider.pushNamedAndRemoveAllBack(
                            routeName: Routes.mainScreen);
                      } else {
                        // this arguments to detected if first scan or end one
                        RoutingProvider.pushNamed(
                            routeName: Routes.easerQrScanScreen,
                            arguments: true);
                      }
                    },
                    rejectButtonTapFunction: () {
                      RoutingProvider.goBack();
                    },
                    acceptButtonStyle: AppTextStyles.robotoMediumWhite
                        .copyWith(fontSize: 16.sp),
                    rejectButtonStyle: AppTextStyles.robotoMediumWhite
                        .copyWith(fontSize: 16.sp),
                    buttonWidth: 127.w,
                    borderColor: AppColors.blackColor);
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.warning_outlined,
                    color: AppColors.yellowColor,
                    size: 20.r,
                  ),
                  Text(
                    "STOP",
                    style: AppTextStyles.interExtraBold(8.sp),
                  )
                ],
              ),
            )
          : null,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const StateOfPlay(),
          SizedBox(
            height: 20.h,
          ),
          if (provider.reportButton == ReportBtnStatus.yes)
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 150.h,
                  width: 320.w,
                  color: AppColors.whiteColor,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Report", style: AppTextStyles.header4Inter),
                        SizedBox(
                          height: 10.h,
                        ),
                        CustomTextField(
                          textAlign: TextAlign.start,
                          minLines: 5,
                          hintStyle: AppTextStyles.robotoRegularGrey50
                              .copyWith(fontSize: 12.sp),
                          textType: TextInputType.multiline,
                          maxLines: null,
                          prefix: Padding(
                              padding: EdgeInsetsDirectional.only(
                            start: 10.w,
                          )),
                          hint: 'Describe the situation',
                          borderColor: AppColors.grey10Color,
                          fillColor: AppColors.greyColor,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                    height: 145.h,
                    color: AppColors.whiteColor,
                    padding: EdgeInsets.all(10.r),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Photos/Video",
                          style: AppTextStyles.header4Inter,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            UploadPhotoWidget(
                              onTap: () {
                                ResourceBottomSheetImp.showResourcePicker(
                                    context);
                              },
                            ),
                            UploadPhotoWidget(
                              onTap: () {
                                ResourceBottomSheetImp.showResourcePicker(
                                    context);
                              },
                            ),
                            UploadPhotoWidget(
                              onTap: () {
                                ResourceBottomSheetImp.showResourcePicker(
                                    context);
                              },
                            ),
                          ],
                        ),
                      ],
                    )),
              ],
            ),
        ],
      ),
    );
  }
}
