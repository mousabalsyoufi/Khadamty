import 'package:faciltateur_de_vies/constants/text_styles/text_styles.dart';
import 'package:faciltateur_de_vies/screens/user_offer_subscriber_screen/business_logic/provider/user_offer_subscriber_provider.dart';
import 'package:faciltateur_de_vies/screens/user_offer_subscriber_screen/presentation/widgets/custom_service_duration.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../shared_widgets/custom_shared_service_duration_widget.dart';
import '../widgets/services_tasks_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserOfferSubscriberFillDataScreen extends StatelessWidget {
  const UserOfferSubscriberFillDataScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Customize your offer",
            style: AppTextStyles.header3Inter,
          ),
          SizedBox(
            height: 15.h,
          ),
          Text("Service duration", style: AppTextStyles.header5Inter),
          SizedBox(
            height: 5.h,
          ),
          const CustomServiceDurationWidget(),
          SizedBox(
            height: 15.h,
          ),
          Text(
            'Available slots',
            style: AppTextStyles.interMeduimBlack,
          ),
          SizedBox(
            height: 5.h,
          ),
          Consumer<UserOfferSubscriberProvider>(
              builder: (context, provider, child) {
            return CustomSharedServiceDurationWidget(
              times: provider.availableTimeSlots,
              onTap: (index) => provider.setServiceTimeSlot(index),
            );
          }),
          SizedBox(height: 15.h),
          Text(
            "Services and tasks included",
            style: AppTextStyles.header5Inter,
          ),
          SizedBox(height: 15.h),
          const ServiceTasksWidget(),
          SizedBox(height: 15.h),
          Text(
            "To continue, please choose the subtasks you want for each selected service.",
            style: AppTextStyles.paragraph3Roboto,
          )
        ],
      ),
    );
  }
}
