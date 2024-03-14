import 'package:faciltateur_de_vies/constants/text_styles/text_styles.dart';
import 'package:faciltateur_de_vies/routes/routes_provider/routes_provider.dart';
import 'package:faciltateur_de_vies/shared_widgets/custom_button_black.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/colors/colors.dart';
import '../widgets/bottom_sheet_header.dart';
import 'offer_subscriber_widget.dart';

class OfferSubscriberUpcomingSheet {
  static void showOfferSubscriberUpcoming(BuildContext context) {
    // show select offer subscriber [Edit]
    showModalBottomSheet(
        backgroundColor: AppColors.transparentColor,
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
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
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
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
                          padding: EdgeInsets.symmetric(horizontal: 50.w),
                          child: Text(
                            'Customize included tasks in the service [Name of Service]',
                            style: AppTextStyles.header3Inter,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        const ServiceTasksEditWidget(),
                        SizedBox(height: 5.h),
                        Text(
                          "To continue, please choose the subtasks you want for each selected service.",
                          style: AppTextStyles.paragraph3Roboto,
                        ),
                        SizedBox(height: 30.h),
                        CustomButtonBlack(
                            buttonContent: const Text( 'Save Changes') ,
                            onPressed: () {
                              RoutingProvider.goBack();
                            }),
                        SizedBox(height: 30.h),
                      ],
                    ),
                  )),
            ],
          );
        });
  }
}
