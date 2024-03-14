import 'package:faciltateur_de_vies/routes/routes_provider/routes_provider.dart';
import 'package:faciltateur_de_vies/screens/shared_help_form_screen/business_logic/provider/shared_help_form_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../constants/colors/colors.dart';
import '../../../../constants/text_styles/text_styles.dart';
import '../../../../shared_widgets/bottom_sheets/widgets/bottom_sheet_header.dart';
import '../../../../shared_widgets/custom_radio_button.dart';

class HelpTopicBottomSheet extends StatelessWidget {
  const HelpTopicBottomSheet({super.key});

  final List<String> topics = const [
    'I\'m having a problem with the app',
    'Our services',
    'Aids and benefits',
    'Rates, payment and invoicing',
    'Speakers',
    'Other',
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<SharedHelpFormProvider>(builder: (context, provider, _) {
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 10.h,
                ),
                const BottomSheetHeader(),
                SizedBox(
                  height: 30.h,
                ),
                Text(
                  'Select category',
                  style: AppTextStyles.header3Inter,
                ),
                SizedBox(
                  height: 30.h,
                ),
                SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      children: [
                        Column(
                          children: topics
                              .map(
                                (topic) => Column(
                                  children: [
                                    CustomRadioButton(
                                        title: topic,
                                        value: topics.indexOf(topic),
                                        groupValue: provider.selectedTypeIndex,
                                        hasPadding: false,
                                        selectedTextStyle:
                                            AppTextStyles.header3Inter,
                                        unselectedTextStyle:
                                            AppTextStyles.robotoRegularBlack(
                                                14.sp),
                                        onChanged: (value) {
                                          provider.setTicketType(
                                              topics.indexOf(topic),
                                              topics[topics.indexOf(topic)]);
                                          RoutingProvider.goBack();
                                        }),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    const Divider(),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                  ],
                                ),
                              )
                              .toList(),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      );
    });
  }
}
