import 'package:faciltateur_de_vies/shared_widgets/custom_appbar.dart';
import 'package:faciltateur_de_vies/shared_widgets/custom_black_button_with_leading_trailing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../../constants/colors/colors.dart';
import '../../../../constants/enums/app_subscribtions.dart';
import '../../../../constants/icons/icons.dart';
import '../../../../constants/text_styles/text_styles.dart';
import '../../../../routes/routes_names/routes_names.dart';
import '../../../../routes/routes_provider/routes_provider.dart';
import '../../../../shared_widgets/bottom_sheets/payment_sheets/payment_sheets.dart';
import '../../../../shared_widgets/bottom_sheets/reservation_confirmation_bottom_sheets/reservation_confirmation_bottom_sheet.dart';
import '../../../../shared_widgets/custom_radio_button.dart';
import '../../business_logic/provider/user_recurrent_subscription_activation_provider.dart';

class UserRecurrentSubscriptionActivationPickSubscriptionScreen
    extends StatelessWidget {
  const UserRecurrentSubscriptionActivationPickSubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('Subscription activation', actions: [
        Padding(
          padding: EdgeInsetsDirectional.only(end: 15.w),
          child: GestureDetector(
            onTap: () {
              RoutingProvider.pushNamed(routeName: Routes.sharedFaqScreeen);
            },
            child: SvgPicture.asset(
              AppIcons.questionBubbleIcon,
              width: 35.r,
              height: 35.r,
            ),
          ),
        ),
      ]),
      body: Padding(
        padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 20.h),
        child: Consumer<UserRecurrentSubscriptionActivationProvider>(
          builder: (context, subscribeActivationProvider, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 25.h,
                ),
                Text(
                  'Subscriptions',
                  style: AppTextStyles.header3Inter,
                ),
                SizedBox(height: 10.h),
                Text(
                  'Regularly take advantage of our services at preferential prices.',
                  style: AppTextStyles.paragraph3Roboto
                      .copyWith(color: AppColors.blackColor),
                ),
                SizedBox(
                  height: 25.h,
                ),
                _subscriptionWidget(subscribeActivationProvider),
                SizedBox(
                  height: 15.h,
                ),
                _paymentBox(context),
                const Spacer(),
                CustomButtonBlackWithLeadingTrailing(
                  buttonText: "Pay",
                  onPressed: () {
                    ReservationConfirmationBottomSheets
                        .showReservationConfirmation(
                      context: context,
                      onTapFirstButton: () {
                        RoutingProvider.pushNamed(
                            routeName: Routes
                                .userUpcomingRecurrentServiceDetailsScreen);
                      },
                      headerText: 'Subscription confirmed!',
                      contentText: 'Your service has been successfully revived',
                      firstButtonText: 'OK',
                    );
                  },
                  trailingText: '5€',
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _subscriptionWidget(
      UserRecurrentSubscriptionActivationProvider subscribeActivationProvider) {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GestureDetector(
            onTap: () {
              subscribeActivationProvider
                  .setAppSubscribtion(AppSubscribtion.initial);
            },
            child: Opacity(
              opacity: subscribeActivationProvider.appSubscribtion ==
                      AppSubscribtion.premuim
                  ? 0.5
                  : 1,
              child: Container(
                width: 155.w,
                padding: EdgeInsets.all(20.r),
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(5.r),
                  border: subscribeActivationProvider.appSubscribtion ==
                          AppSubscribtion.initial
                      ? Border.all(color: AppColors.greenColor)
                      : null,
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CustomRadioButton(
                              hasPadding: false,
                              title: 'Initial',
                              value: 0,
                              textSpacing: 5,
                              groupValue:
                                  subscribeActivationProvider.appSubscribtion !=
                                          null
                                      ? AppSubscribtion.values.indexOf(
                                          subscribeActivationProvider
                                              .appSubscribtion!)
                                      : -1,
                              selectedTextStyle: AppTextStyles.header4Inter,
                              unselectedTextStyle:
                                  AppTextStyles.interMeduimBlack,
                              onChanged: (value) {
                                subscribeActivationProvider.setAppSubscribtion(
                                    AppSubscribtion.initial);
                              }),
                          const Spacer(),
                          Text(
                            '5€',
                            style: AppTextStyles.header2Inter,
                          ),
                        ],
                      ),
                      const Divider(),
                      SizedBox(height: 5.h),
                      Text(
                        'Priority access to service reservation',
                        style: AppTextStyles.paragraph3Roboto,
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        'Reduced hourly rates',
                        style: AppTextStyles.paragraph3Roboto,
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        'Global Service offer',
                        style: AppTextStyles.paragraph3Roboto,
                      ),
                    ]),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              subscribeActivationProvider
                  .setAppSubscribtion(AppSubscribtion.premuim);
            },
            child: Opacity(
              opacity: subscribeActivationProvider.appSubscribtion ==
                      AppSubscribtion.initial
                  ? 0.5
                  : 1,
              child: Container(
                width: 155.w,
                padding: EdgeInsets.all(20.r),
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(5.r),
                  border: subscribeActivationProvider.appSubscribtion ==
                          AppSubscribtion.premuim
                      ? Border.all(color: AppColors.greenColor)
                      : null,
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CustomRadioButton(
                              hasPadding: false,
                              title: 'Premium',
                              value: 1,
                              textSpacing: 5,
                              groupValue:
                                  subscribeActivationProvider.appSubscribtion !=
                                          null
                                      ? AppSubscribtion.values.indexOf(
                                          subscribeActivationProvider
                                              .appSubscribtion!)
                                      : -1,
                              selectedTextStyle: AppTextStyles.header4Inter,
                              unselectedTextStyle:
                                  AppTextStyles.interMeduimBlack,
                              onChanged: (value) {
                                subscribeActivationProvider.setAppSubscribtion(
                                    AppSubscribtion.premuim);
                              }),
                          const Spacer(),
                          Text(
                            '10€',
                            style: AppTextStyles.header2Inter,
                          ),
                        ],
                      ),
                      const Divider(),
                      SizedBox(height: 5.h),
                      Text(
                        'Priority access to service reservation',
                        style: AppTextStyles.paragraph3Roboto,
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        'Reduced hourly rates',
                        style: AppTextStyles.paragraph3Roboto,
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        'Global Service offer',
                        style: AppTextStyles.paragraph3Roboto,
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        'Loyauty program',
                        style: AppTextStyles.paragraph3Roboto,
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        'Access to service “mode mandataire”',
                        style: AppTextStyles.paragraph3Roboto,
                      ),
                    ]),
              ),
            ),
          ),
        ],
      ),
    );
  }

  //split widget to show payment container
  Widget _paymentBox(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Payment",
              style: AppTextStyles.header3Inter,
            ),
            InkWell(
              onTap: (){
                PaymentSheets.showPaymentMethodBottomSheet(context);
              },
              child: Text(
                "Change",
                style: AppTextStyles.header4Inter,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 15.h,
        ),
        Container(
          width: 320.w,
          height: 45.h,
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.all(Radius.circular(5.r)),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.only(start: 15.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  AppIcons.visaIcon,
                  height: 20.h,
                  width: 20.w,
                ),
                SizedBox(
                  width: 15.w,
                ),
                Text(
                  "Visa ****** 0000",
                  style: AppTextStyles.header4Inter,
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
