import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/colors/colors.dart';
import '../../../../constants/text_styles/text_styles.dart';
import '../../../../shared_widgets/bottom_sheets/widgets/bottom_sheet_header.dart';
import '../../../../shared_widgets/custom_radio_button.dart';
import '../../../routes/routes_names/routes_names.dart';
import '../../../routes/routes_provider/routes_provider.dart';

class TicketCategoryBottomSheetImp extends StatelessWidget {
  const TicketCategoryBottomSheetImp({super.key});

  final List<String> categories = const [
    'Service Performed',
    'Schedule of realization',
    'Loss / breakage / theft',
    'My Easer',
    'Other',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 380.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r), topRight: Radius.circular(20.r)),
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
                    children: categories
                        .map(
                          (topic) => Column(
                        children: [
                          CustomRadioButton(
                              title: topic,
                              value: categories.indexOf(topic) + 1,
                              groupValue: 1,
                              hasPadding: false,
                              selectedTextStyle: AppTextStyles.header3Inter,
                              unselectedTextStyle:
                              AppTextStyles.robotoRegularBlack(14.sp),
                              onChanged: (value) {
                                // TODO pass the value as a parameter later..
                                RoutingProvider.pushNamed(routeName: Routes.userBusinessDataScreen);
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
    );
  }
}
