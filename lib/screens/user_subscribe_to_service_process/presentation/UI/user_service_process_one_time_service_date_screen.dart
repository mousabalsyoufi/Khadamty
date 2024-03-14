import 'package:faciltateur_de_vies/routes/routes_names/routes_names.dart';
import 'package:faciltateur_de_vies/routes/routes_provider/routes_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../constants/enums/service_frequency.dart';
import '../../../../constants/text_styles/text_styles.dart';
import '../../../../shared_widgets/custom_black_button_with_title.dart';
import '../../business_logic/provider/user_service_subscribe_process_provider.dart';
import '../widgets/service_date_day_picker.dart';
import '../../../../shared_widgets/custom_shared_service_duration_widget.dart';
import '../widgets/service_subscribe_process_screen_header.dart';

class UserServiceProcessOneTimeServiceDateScreen extends StatelessWidget {
  const UserServiceProcessOneTimeServiceDateScreen({super.key});

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
                  const ServiceSubscribeProcessScreenHeader(percent: 0.45),
                  SizedBox(
                    height: 25.h,
                  ),
                  if (subscribeServiceProvider.serviceFrequency ==
                      ServiceFrequency.oneTime)
                    Text(
                      'Pick the date',
                      style: AppTextStyles.header3Inter,
                    ),
                  if (subscribeServiceProvider.serviceFrequency ==
                      ServiceFrequency.oneTime)
                    SizedBox(
                      height: 15.h,
                    ),
                  if (subscribeServiceProvider.serviceFrequency ==
                      ServiceFrequency.oneTime)
                    const ServiceDateDayPicker(),
                  SizedBox(
                    height: 20.h,
                  ),
                  if (subscribeServiceProvider.oneTimeServiceSelectedDay !=
                          null ||
                      subscribeServiceProvider.serviceFrequency !=
                          ServiceFrequency.oneTime)
                    Text(
                      'Services duration',
                      style: AppTextStyles.interMeduimBlack,
                    ),
                  if (subscribeServiceProvider.oneTimeServiceSelectedDay !=
                          null ||
                      subscribeServiceProvider.serviceFrequency !=
                          ServiceFrequency.oneTime)
                    SizedBox(
                      height: 20.h,
                    ),
                  if (subscribeServiceProvider.oneTimeServiceSelectedDay !=
                          null ||
                      subscribeServiceProvider.serviceFrequency !=
                          ServiceFrequency.oneTime)
                    CustomSharedServiceDurationWidget(
                      times: subscribeServiceProvider.hours,
                      onTap: (index) =>
                          subscribeServiceProvider.setServiceDuration(index),
                    ),
                  SizedBox(
                    height: 30.h,
                  ),
                  if (subscribeServiceProvider.oneTimeerviceDuration != null)
                    Text(
                      'Available slots',
                      style: AppTextStyles.interMeduimBlack,
                    ),
                  if (subscribeServiceProvider.oneTimeerviceDuration != null)
                    SizedBox(
                      height: 20.h,
                    ),
                  if (subscribeServiceProvider.oneTimeerviceDuration != null)
                    CustomSharedServiceDurationWidget(
                      times: subscribeServiceProvider.availableTimeSlots,
                      onTap: (index) =>
                          subscribeServiceProvider.setServiceTimeSlot(index),
                    ),
                  const Spacer(),
                  CustomButtonBlackWithText(
                    buttonText: "Continue",
                    onPressed:
                        subscribeServiceProvider.oneTimeServiceDateButtonEnabled
                            ? () {
                                if (subscribeServiceProvider.serviceFrequency ==
                                    ServiceFrequency.oneTime) {
                                  RoutingProvider.pushNamed(
                                      routeName: Routes
                                          .userServiceSubscibeAddAddressScreen);
                                } else {
                                  RoutingProvider.pushNamed(
                                      routeName: Routes
                                          .userServiceSubscibeRecurrentServiceDateScreen);
                                }
                              }
                            : null,
                    trailingText: '',
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
