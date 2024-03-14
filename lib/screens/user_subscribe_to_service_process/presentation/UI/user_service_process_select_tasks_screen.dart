import 'package:faciltateur_de_vies/constants/colors/colors.dart';
import 'package:faciltateur_de_vies/constants/text_styles/text_styles.dart';
import 'package:faciltateur_de_vies/routes/routes_names/routes_names.dart';
import 'package:faciltateur_de_vies/routes/routes_provider/routes_provider.dart';
import 'package:faciltateur_de_vies/screens/shared_service_details_screen/data/models/service_details_model.dart';
import 'package:faciltateur_de_vies/screens/user_subscribe_to_service_process/business_logic/provider/user_service_subscribe_process_provider.dart';
import 'package:faciltateur_de_vies/shared_widgets/custom_button_black.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../widgets/service_subscribe_process_screen_header.dart';

class UserServiceProcessSelectTasksScreen extends StatefulWidget {
  const UserServiceProcessSelectTasksScreen(
      {super.key, required this.serviceDetailsModel});

  final ServiceDetailsModel serviceDetailsModel;

  @override
  State<UserServiceProcessSelectTasksScreen> createState() =>
      _UserServiceProcessSelectTasksScreenState();
}

class _UserServiceProcessSelectTasksScreenState
    extends State<UserServiceProcessSelectTasksScreen> {
  @override
  void initState() {
    Provider.of<UserServiceSubscribeProcessProvider>(context, listen: false)
        .setServiceDetails(widget.serviceDetailsModel);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 20.h),
          child: Consumer<UserServiceSubscribeProcessProvider>(
              builder: (context, subscribeServiceProvider, child) {
            return Column(
              children: [
                SizedBox(
                  height: 10.h,
                ),
                const ServiceSubscribeProcessScreenHeader(percent: 0.2),
                SizedBox(
                  height: 25.h,
                ),
                Row(
                  children: [
                    Text(
                      'Select services tasks',
                      style: AppTextStyles.header3Inter,
                    ),
                    const Spacer(),
                    GestureDetector(
                        onTap: () {
                          subscribeServiceProvider.setAllTasksActive();
                        },
                        child: Text(
                          'All',
                          style: AppTextStyles.header3Inter,
                        )),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  padding: EdgeInsets.all(20.r),
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                  child: Column(
                    children: subscribeServiceProvider.serviceTasks.isEmpty
                        ? [
                            const Center(
                              child: Text(
                                'sorry there is no tasks for the selected service please try again later',
                                textAlign: TextAlign.center,
                              ),
                            )
                          ]
                        : [
                            ...List.generate(
                              subscribeServiceProvider.serviceTasks.length,
                              ((index) => Column(
                                    children: [
                                      Row(
                                        children: [
                                          Checkbox(
                                              value: subscribeServiceProvider
                                                  .serviceTasks[index]
                                                  .isSelected,
                                              activeColor: AppColors.blackColor,
                                              checkColor: AppColors.greenColor,
                                              onChanged: (value) {
                                                subscribeServiceProvider
                                                    .setServiceTaskActive(
                                                        index);
                                              }),
                                          Text(
                                            subscribeServiceProvider
                                                .serviceTasks[index].label,
                                            style:
                                                AppTextStyles.interMeduimBlack,
                                          )
                                        ],
                                      ),
                                      if (index !=
                                          subscribeServiceProvider
                                                  .serviceTasks.length -
                                              1)
                                        const Divider(),
                                    ],
                                  )),
                            )
                          ],
                  ),
                ),
                const Spacer(),
                CustomButtonBlack(
                    buttonContent: const Text('Continue'),
                    onPressed:
                        subscribeServiceProvider.serviceTasksButtonEnabled
                            ? () {
                                RoutingProvider.pushNamed(
                                    routeName: Routes
                                        .userServiceSubscibeChooseServiceFrequencyScreen);
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
