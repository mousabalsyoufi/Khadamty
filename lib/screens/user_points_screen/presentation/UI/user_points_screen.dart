import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:faciltateur_de_vies/constants/colors/colors.dart';
import 'package:faciltateur_de_vies/shared_widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../../constants/text_styles/text_styles.dart';
import '../widgets/transaction_list_item.dart';

class UserPointsScreen extends StatelessWidget {
  const UserPointsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('My points'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: DefaultTabController(
          length: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.h,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(5.r),
                ),
                child: Row(
                  children: [
                    CircularPercentIndicator(
                      radius: 60.r,
                      percent: 0.4,
                      lineWidth: 10.r,
                      backgroundColor: AppColors.greyColor,
                      progressColor: AppColors.greenColor,
                      center: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("240",
                              style: AppTextStyles.robotoBoldBlack(30.sp)),
                          Text("points",
                              style: AppTextStyles.robotoMediumBlack
                                  .copyWith(fontSize: 16.sp)),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 25.w,
                    ),
                    Icon(
                      Icons.arrow_forward,
                      size: 15.r,
                      color: AppColors.blackColor,
                    ),
                    SizedBox(
                      width: 25.w,
                    ),
                    Flexible(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("00:00",
                              style: AppTextStyles.robotoBoldBlack(30.sp)),
                          Text("service offered",
                              style: AppTextStyles.robotoMediumBlack
                                  .copyWith(fontSize: 16.sp)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                'You must reach 480 points to benefit from 1 hour of service.',
                style: AppTextStyles.robotoRegularBlack(10.sp),
              ),
              SizedBox(
                height: 30.h,
              ),
              Text(
                'Transaction history',
                style: AppTextStyles.header3Inter,
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                constraints: const BoxConstraints(maxHeight: 40.0),
                child: Material(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.r),
                  child: TabBar(
                    labelColor: AppColors.whiteColor,
                    unselectedLabelColor: AppColors.grey70Color,
                    indicatorSize: TabBarIndicatorSize.tab,
                    splashBorderRadius: BorderRadius.circular(25.r),
                    indicator: BubbleTabIndicator(
                      indicatorColor: AppColors.blackColor,
                      indicatorHeight: 30.h,
                      tabBarIndicatorSize: TabBarIndicatorSize.tab,
                      indicatorRadius: 25.r,
                    ),
                    labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                    tabs: const [
                      Tab(
                        text: 'Received',
                      ),
                      Tab(
                        text: 'Spent',
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Expanded(
                child: TabBarView(children: [
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                    child: ListView.builder(
                      padding: EdgeInsets.all(15.r),
                      itemBuilder: (context, index) => Column(
                        children: [
                          const TransactionListItem(),
                          SizedBox(height: 5.h),
                          const Divider(),
                          SizedBox(height: 5.h),
                        ],
                      ),
                      shrinkWrap: true,
                      itemCount: 10,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                    child: ListView.builder(
                      padding: EdgeInsets.all(15.r),
                      itemBuilder: (context, index) => Column(
                        children: [
                          const TransactionListItem(),
                          SizedBox(height: 5.h),
                          const Divider(),
                          SizedBox(height: 5.h),
                        ],
                      ),
                      shrinkWrap: true,
                      itemCount: 10,
                    ),
                  ),
                ]),
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
