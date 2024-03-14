import 'package:faciltateur_de_vies/routes/routes_provider/routes_provider.dart';
import 'package:faciltateur_de_vies/screens/user_offer_subscriber_screen/business_logic/provider/user_offer_subscriber_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../../../../constants/colors/colors.dart';
import '../../../../constants/images/images.dart';
import '../../../../constants/text_styles/text_styles.dart';
import '../../../../routes/routes_names/routes_names.dart';
import '../../../../screens/main_screen/business_logic/provider/main_provider.dart';
import '../../widgets/bottom_sheet_header.dart';
import '../../widgets/small_bottom_sheet_button.dart';

class ReservationConfirmedBottomSheet extends StatelessWidget {
  const ReservationConfirmedBottomSheet(
      {super.key,
      required this.onTapFirstButton,
      required this.headerText,
      required this.contentText,
      required this.firstButtonText});

  final Function onTapFirstButton;

  final String headerText;
  final String contentText;
  final String firstButtonText;

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
                        AppImages.reservationComplete,
                        height: 180.h,
                        width: 155.w,
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Text(
                        headerText,
                        style: AppTextStyles.header1Inter,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        contentText,
                        style: AppTextStyles.robotoRegularBlack(12.sp),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      SmallBottomSheetButton(
                          buttonText: firstButtonText,
                          onPressed: () => onTapFirstButton(),
                          buttonTextStyle: AppTextStyles.robotoMediumWhite
                              .copyWith(fontSize: 16.sp),
                          buttonColor: AppColors.blackColor,
                          buttonWidth: double.infinity,
                          borderColor: AppColors.blackColor),
                      SizedBox(
                        height: 15.h,
                      ),
                      SmallBottomSheetButton(
                          buttonText: 'View our other services',
                          onPressed: () {
                            Provider.of<UserOfferSubscriberProvider>(context,
                                    listen: false)
                                .resetProviderData();
                            Provider.of<MainProvider>(context, listen: false)
                                .changeActiveOffline(1);
                            RoutingProvider.pushNamedAndRemoveAllBack(
                                routeName: Routes.mainScreen);
                          },
                          buttonTextStyle: AppTextStyles.robotoMediumBlack
                              .copyWith(fontSize: 16.sp),
                          buttonColor: AppColors.whiteColor,
                          buttonWidth: double.infinity,
                          borderColor: AppColors.blackColor),
                    ],
                  ),
                ],
              ),
            )),
      ],
    );
  }
}
