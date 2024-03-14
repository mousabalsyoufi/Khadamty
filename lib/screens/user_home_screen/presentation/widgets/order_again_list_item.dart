import 'package:faciltateur_de_vies/routes/routes_names/routes_names.dart';
import 'package:faciltateur_de_vies/routes/routes_provider/routes_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/colors/colors.dart';
import '../../../../constants/enums/categories_type.dart';
import '../../../../constants/text_styles/text_styles.dart';
import '../../../../shared_widgets/circle_image_with_border.dart';
import '../../../../shared_widgets/custom_category_badge.dart';

class OrderAgainListItem extends StatelessWidget {
  const OrderAgainListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        RoutingProvider.pushNamed(routeName: Routes.userHistoryReviewScreen,arguments: false);
      },
      child: Container(
          width: 260.w,
          padding: EdgeInsets.all(13.r),
          decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.all(Radius.circular(5.r))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 10.w,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Cleaning',
                    style: AppTextStyles.header4Inter,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Row(
                    children: [
                      CircleImageWithBorder(
                        url:
                            'https://freepngimg.com/thumb/man/10-man-png-image.png',
                        width: 18.h,
                        height: 18.h,
                      ),
                      SizedBox(width: 5.w),
                      Text(
                        'Jhon',
                        style: AppTextStyles.robotoRegularBlack(12.sp),
                      )
                    ],
                  )
                ],
              ),
              const Spacer(),
              Column(
                children: [
                  const CustomCategoryBadge(
                    categoryType: CategoryType.home,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    'Rate',
                    style: AppTextStyles.robotoMediumBlack,
                  )
                ],
              )
            ],
          )),
    );
  }
}
