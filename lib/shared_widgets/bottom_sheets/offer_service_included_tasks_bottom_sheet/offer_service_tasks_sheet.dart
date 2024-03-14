import 'package:faciltateur_de_vies/constants/text_styles/text_styles.dart';
import 'package:faciltateur_de_vies/routes/routes_provider/routes_provider.dart';
import 'package:faciltateur_de_vies/shared_models/task_model.dart';
import 'package:faciltateur_de_vies/shared_widgets/custom_button_black.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../constants/colors/colors.dart';
import '../../../screens/user_offer_subscriber_screen/business_logic/provider/user_offer_subscriber_provider.dart';
import '../widgets/bottom_sheet_header.dart';

class OfferServiceTasksIncludedBottomSheet {
  static void showOfferServiceTasks(BuildContext context, int serviceIndex,
      String serviceName, List<TaskModel> tasks) {
    // show select included tasks in service for offer
    showModalBottomSheet(
        backgroundColor: AppColors.transparentColor,
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return ServiceTasksWidget(
            serviceName: serviceName,
            tasks: tasks,
            serviceIndex: serviceIndex,
          );
        });
  }
}

class ServiceTasksWidget extends StatefulWidget {
  const ServiceTasksWidget({
    Key? key,
    required this.serviceName,
    required this.tasks,
    required this.serviceIndex,
  }) : super(key: key);

  final String serviceName;
  final List<TaskModel> tasks;
  final int serviceIndex;

  @override
  State<ServiceTasksWidget> createState() => _ServiceTasksWidgetState();
}

class _ServiceTasksWidgetState extends State<ServiceTasksWidget> {
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
            child: Column(
              children: [
                SizedBox(
                  height: 10.h,
                ),
                const BottomSheetHeader(),
                SizedBox(
                  height: 30.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 70.w),
                  child: Text(
                    'Select included tasks in the service ${widget.serviceName}',
                    style: AppTextStyles.header3Inter,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: 20.w, right: 20.w, bottom: 20.h),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 300.h,
                        child: ListView.builder(
                          itemBuilder: (context, index) => Column(
                            children: [
                              Row(
                                children: [
                                  Checkbox(
                                      value: widget.tasks[index].isSelected,
                                      activeColor: AppColors.blackColor,
                                      checkColor: AppColors.greenColor,
                                      onChanged: (value) {
                                        Provider.of<UserOfferSubscriberProvider>(
                                                context,
                                                listen: false)
                                            .setServiceTaskSelected(
                                                widget.serviceIndex, index);
                                        setState(() {});
                                      }),
                                  Text(
                                    widget.tasks[index].label,
                                    style: AppTextStyles.header4Inter,
                                  )
                                ],
                              ),
                              if (index != widget.tasks.length - 1)
                                const Divider(),
                            ],
                          ),
                          itemCount: widget.tasks.length,
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      CustomButtonBlack(
                          buttonContent: const Text('OK'),
                          onPressed: () {
                            RoutingProvider.goBack();
                          }),
                    ],
                  ),
                ),
              ],
            )),
      ],
    );
  }
}
