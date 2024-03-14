import 'package:faciltateur_de_vies/shared_widgets/bottom_sheets/widgets/small_bottom_sheet_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../constants/colors/colors.dart';
import '../../../constants/images/images.dart';
import '../../../constants/text_styles/text_styles.dart';
import '../../../routes/routes_names/routes_names.dart';
import '../../../routes/routes_provider/routes_provider.dart';
import '../../../screens/main_screen/business_logic/provider/main_provider.dart';
import '../widgets/bottom_sheet_header.dart';

class CancellationConfirmationBottom extends StatelessWidget {
  const CancellationConfirmationBottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.r),
                  topRight: Radius.circular(20.r)),
              color: AppColors.whiteColor,
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 20.h),
              child: Column(
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  const BottomSheetHeader(),
                  SizedBox(
                    height: 30.h,
                  ),
                  Column(
                    children: [
                      SvgPicture.asset(
                        AppImages.cancellationImage,
                        height: 180.h,
                        width: 130.w,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        'Cancellation Confirmed',
                        style: AppTextStyles.header1Inter,
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40.w),
                        child: Text(
                          'Your service has been cancelled.',
                          style: AppTextStyles.robotoRegularBlack(12.sp),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      SmallBottomSheetButton(
                          buttonText: 'View our other services',
                          onPressed: () async {
                            await RoutingProvider.pushNamedAndRemoveAllBack(
                                routeName: Routes.mainScreen);
                            Provider.of<MainProvider>(context, listen: false)
                                .changeActiveScreen(1);

                          },
                          buttonTextStyle: AppTextStyles.robotoMediumWhite
                              .copyWith(fontSize: 16.sp),
                          buttonColor: AppColors.blackColor,
                          buttonWidth: double.infinity,
                          borderColor: AppColors.blackColor),
                      SizedBox(
                        height: 15.h,
                      ),
                      SmallBottomSheetButton(
                          buttonText: 'Upcoming services',
                          onPressed: () async {
                            await RoutingProvider.pushNamedAndRemoveAllBack(
                                routeName: Routes.mainScreen);
                            Provider.of<MainProvider>(context, listen: false)
                                .changeActiveScreen(4);
                          },
                          buttonTextStyle: AppTextStyles.robotoMediumBlack.copyWith(fontSize: 16.sp),
                          buttonColor: AppColors.whiteColor,
                          buttonWidth: double.infinity,
                          borderColor: AppColors.blackColor),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ],
              ),
            )),
      ],
    );
  }
}
