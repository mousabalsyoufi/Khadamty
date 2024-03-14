import 'package:faciltateur_de_vies/constants/enums/app_subscribtions.dart';
import 'package:faciltateur_de_vies/constants/enums/service_frequency.dart';
import 'package:faciltateur_de_vies/constants/enums/user_type.dart';
import 'package:faciltateur_de_vies/core/local_storage/storage_manager.dart';
import 'package:faciltateur_de_vies/routes/routes_names/routes_names.dart';
import 'package:faciltateur_de_vies/routes/routes_provider/routes_provider.dart';
import 'package:faciltateur_de_vies/shared_widgets/custom_radio_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../constants/colors/colors.dart';
import '../../../../constants/text_styles/text_styles.dart';
import '../../../../shared_widgets/custom_button_black.dart';
import '../../business_logic/provider/user_service_subscribe_process_provider.dart';
import '../widgets/service_subscribe_process_screen_header.dart';

// ignore: must_be_immutable
class UserServiceProcessChooseServiceFrequencyScreen extends StatelessWidget {
  UserServiceProcessChooseServiceFrequencyScreen({super.key});

  UserType userType = StorageManager.getUserType();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 20.h),
          child: Consumer<UserServiceSubscribeProcessProvider>(
              builder: (context, subscribeServiceProvider, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10.h,
                ),
                const ServiceSubscribeProcessScreenHeader(percent: 0.3),
                SizedBox(
                  height: 25.h,
                ),
                Text(
                  'Select frequency',
                  style: AppTextStyles.header3Inter,
                ),
                SizedBox(
                  height: 20.h,
                ),
                GestureDetector(
                  onTap: () {
                    subscribeServiceProvider
                        .setServiceFrequency(ServiceFrequency.oneTime);
                  },
                  child: Opacity(
                    opacity: subscribeServiceProvider.serviceFrequency ==
                            ServiceFrequency.recurrent
                        ? 0.5
                        : 1,
                    child: Container(
                      padding: EdgeInsets.all(20.r),
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(5.r),
                        border: subscribeServiceProvider.serviceFrequency ==
                                ServiceFrequency.oneTime
                            ? Border.all(color: AppColors.greenColor)
                            : null,
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              CustomRadioButton(
                                  title: 'Ponctuai service',
                                  value: 0,
                                  groupValue: subscribeServiceProvider
                                              .serviceFrequency !=
                                          null
                                      ? ServiceFrequency.values.indexOf(
                                          subscribeServiceProvider
                                              .serviceFrequency!)
                                      : -1,
                                  selectedTextStyle: AppTextStyles.header4Inter,
                                  unselectedTextStyle:
                                      AppTextStyles.interMeduimBlack,
                                  onChanged: (value) {
                                    subscribeServiceProvider
                                        .setServiceFrequency(
                                            ServiceFrequency.oneTime);
                                  }),
                              const Spacer(),
                              Text(
                                StorageManager.getUserType() ==
                                        UserType.subscribedUser
                                    ? '${subscribeServiceProvider.serviceDetailsModel.product.multipricesIncludesTax.secondPrice.substring(0, 5)}€'
                                    : '${subscribeServiceProvider.serviceDetailsModel.product.multipricesIncludesTax.firstPrice.substring(0, 5)}€',
                                style: AppTextStyles.header2Inter,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            'Discover our non-binding services for your needs punctual.',
                            style: AppTextStyles.paragraph3Roboto,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                GestureDetector(
                  onTap: () {
                    subscribeServiceProvider
                        .setServiceFrequency(ServiceFrequency.recurrent);
                  },
                  child: Opacity(
                    opacity: subscribeServiceProvider.serviceFrequency ==
                            ServiceFrequency.oneTime
                        ? 0.5
                        : 1,
                    child: Container(
                      padding: EdgeInsets.all(20.r),
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(5.r),
                        border: subscribeServiceProvider.serviceFrequency ==
                                ServiceFrequency.recurrent
                            ? Border.all(color: AppColors.greenColor)
                            : null,
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              CustomRadioButton(
                                  title: 'Recurrent service',
                                  value: 1,
                                  groupValue: subscribeServiceProvider
                                              .serviceFrequency !=
                                          null
                                      ? ServiceFrequency.values.indexOf(
                                          subscribeServiceProvider
                                              .serviceFrequency!)
                                      : -1,
                                  selectedTextStyle: AppTextStyles.header4Inter,
                                  unselectedTextStyle:
                                      AppTextStyles.interMeduimBlack,
                                  onChanged: (value) {
                                    subscribeServiceProvider
                                        .setServiceFrequency(
                                            ServiceFrequency.recurrent);
                                  }),
                              const Spacer(),
                              Text(
                                '${subscribeServiceProvider.serviceDetailsModel.product.multipricesIncludesTax.secondPrice.substring(0, 5)}€',
                                style: AppTextStyles.header2Inter,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            'Regularly take advantage of our services at preferential prices.',
                            style: AppTextStyles.paragraph3Roboto,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                if (subscribeServiceProvider.serviceFrequency ==
                        ServiceFrequency.recurrent &&
                    userType != UserType.subscribedUser)
                  Text(
                    'Select subscription',
                    style: AppTextStyles.header3Inter,
                  ),
                SizedBox(
                  height: 15.h,
                ),
                if (subscribeServiceProvider.serviceFrequency ==
                        ServiceFrequency.recurrent &&
                    userType != UserType.subscribedUser)
                  IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        GestureDetector(
                          onTap: () {
                            subscribeServiceProvider
                                .setAppSubscribtion(AppSubscribtion.initial);
                          },
                          child: Opacity(
                            opacity: subscribeServiceProvider.appSubscribtion ==
                                    AppSubscribtion.premuim
                                ? 0.5
                                : 1,
                            child: Container(
                              width: 155.w,
                              padding: EdgeInsets.all(20.r),
                              decoration: BoxDecoration(
                                color: AppColors.whiteColor,
                                borderRadius: BorderRadius.circular(5.r),
                                border: subscribeServiceProvider
                                            .appSubscribtion ==
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
                                            textSpacing: 5,
                                            title: 'Initial',
                                            value: 0,
                                            groupValue: subscribeServiceProvider
                                                        .appSubscribtion !=
                                                    null
                                                ? AppSubscribtion.values
                                                    .indexOf(
                                                        subscribeServiceProvider
                                                            .appSubscribtion!)
                                                : -1,
                                            selectedTextStyle:
                                                AppTextStyles.header4Inter,
                                            unselectedTextStyle:
                                                AppTextStyles.interMeduimBlack,
                                            onChanged: (value) {
                                              subscribeServiceProvider
                                                  .setAppSubscribtion(
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
                            subscribeServiceProvider
                                .setAppSubscribtion(AppSubscribtion.premuim);
                          },
                          child: Opacity(
                            opacity: subscribeServiceProvider.appSubscribtion ==
                                    AppSubscribtion.initial
                                ? 0.5
                                : 1,
                            child: Container(
                              width: 155.w,
                              padding: EdgeInsets.all(20.r),
                              decoration: BoxDecoration(
                                color: AppColors.whiteColor,
                                borderRadius: BorderRadius.circular(5.r),
                                border: subscribeServiceProvider
                                            .appSubscribtion ==
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
                                            textSpacing: 5,
                                            title: 'Premium',
                                            value: 1,
                                            groupValue: subscribeServiceProvider
                                                        .appSubscribtion !=
                                                    null
                                                ? AppSubscribtion.values
                                                    .indexOf(
                                                        subscribeServiceProvider
                                                            .appSubscribtion!)
                                                : -1,
                                            selectedTextStyle:
                                                AppTextStyles.header4Inter,
                                            unselectedTextStyle:
                                                AppTextStyles.interMeduimBlack,
                                            onChanged: (value) {
                                              subscribeServiceProvider
                                                  .setAppSubscribtion(
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
                  ),
                const Spacer(),
                CustomButtonBlack(
                    buttonContent: const Text('Continue'),
                    onPressed: subscribeServiceProvider.frequencyButtonEnabled
                        ? () {
                            RoutingProvider.pushNamed(
                                routeName: Routes
                                    .userServiceSubscibeOneTimeServiceDateScreen);
                          }
                        : null)
              ],
            );
          }),
        ),
      ),
    );
  }
}
