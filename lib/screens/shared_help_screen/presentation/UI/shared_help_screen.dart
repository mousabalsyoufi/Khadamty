import 'package:faciltateur_de_vies/constants/colors/colors.dart';
import 'package:faciltateur_de_vies/constants/icons/icons.dart';
import 'package:faciltateur_de_vies/constants/terms_and_conditions/terms_and_conditions.dart';
import 'package:faciltateur_de_vies/constants/text_styles/text_styles.dart';
import 'package:faciltateur_de_vies/routes/routes_names/routes_names.dart';
import 'package:faciltateur_de_vies/routes/routes_provider/routes_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../shared_widgets/custom_list_tile_card.dart';

class SharedHelpScreen extends StatelessWidget {
  const SharedHelpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20.h,
        ),
        _getHelpHeaderWidget(),
        SizedBox(
          height: 20.h,
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: ListView(
              children: [
                CustomListTileCardWidget(
                  onPress: () {
                    RoutingProvider.pushNamed(
                      routeName: Routes.sharedFaqScreeen,
                    );
                  },
                  isLastItem: false,
                  title: 'FAQ',
                  trailingIcon: true,
                  iconName: AppIcons.personalDataIcon,
                ),
                CustomListTileCardWidget(
                  isLastItem: false,
                  onPress: () {
                    RoutingProvider.pushNamed(
                        routeName: Routes.sharedTermsAndConditionsScreeen,
                        arguments: {
                          'title': 'Use terms and conditions',
                          'data': useTermsAndConditions,
                        });
                  },
                  title: 'Use Terms ans Conditions',
                  trailingIcon: true,
                  iconName: AppIcons.termsIcon,
                ),
                CustomListTileCardWidget(
                  isLastItem: true,
                  onPress: () {
                    RoutingProvider.pushNamed(
                        routeName: Routes.sharedTermsAndConditionsScreeen,
                        arguments: {
                          'title': 'Sell terms and conditions',
                          'data': sellTermsAndConditions,
                        });
                  },
                  title: 'Sell Terms ans Conditions',
                  trailingIcon: true,
                  iconName: AppIcons.termsIcon,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

_getHelpHeaderWidget() {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 20.w),
    child: GestureDetector(
      onTap: () {
        RoutingProvider.pushNamed(routeName: Routes.sharedHelpFormScreeen);
      },
      child: Container(
        padding: EdgeInsets.all(20.r),
        decoration: BoxDecoration(
          color: AppColors.blackColor,
          borderRadius: BorderRadius.circular(5.r),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              AppIcons.helpRoundedIcon,
              width: 48.r,
              height: 48.r,
            ),
            SizedBox(
              width: 15.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Needs help?',
                  style: AppTextStyles.robotoMediumWhite,
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  'Contact our help center',
                  style: AppTextStyles.robotoRegularWhite,
                ),
              ],
            ),
            const Spacer(),
            SvgPicture.asset(
              AppIcons.messageIcon,
              width: 15.r,
              height: 15.r,
            ),
          ],
        ),
      ),
    ),
  );
}
