import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:faciltateur_de_vies/constants/colors/colors.dart';
import 'package:faciltateur_de_vies/constants/enums/user_type.dart';
import 'package:faciltateur_de_vies/constants/text_styles/text_styles.dart';
import 'package:faciltateur_de_vies/core/local_storage/storage_manager.dart';
import 'package:faciltateur_de_vies/core/utility/utility.dart';
import 'package:faciltateur_de_vies/routes/routes_names/routes_names.dart';
import 'package:faciltateur_de_vies/routes/routes_provider/routes_provider.dart';
import 'package:faciltateur_de_vies/shared_models/category_service_model.dart';
import 'package:faciltateur_de_vies/shared_models/task_model.dart';
import 'package:faciltateur_de_vies/shared_widgets/custom_progress_indicator.dart';
import 'package:faciltateur_de_vies/shared_widgets/custom_user_divider.dart';
import 'package:faciltateur_de_vies/shared_widgets/custom_button_black.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../../shared_widgets/custom_user_app_bar.dart';
import 'package:flutter/material.dart';

import '../../business_logic/shared_serivce_details_provider/shared_service_details_provider.dart';

// This is screen to show user service Details
class SharedServiceDetailsScreen extends StatefulWidget {
  const SharedServiceDetailsScreen({
    Key? key,
    required this.service,
    required this.color,
  }) : super(
          key: key,
        );

  final CategoryServiceModel service;
  final String color;

  @override
  State<SharedServiceDetailsScreen> createState() =>
      _SharedServiceDetailsScreenState();
}

class _SharedServiceDetailsScreenState
    extends State<SharedServiceDetailsScreen> {
  @override
  void initState() {
    Utility.changeStatusBarToTransparent();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<SharedServiceDetailsProvider>(context, listen: false)
          .getServiceDetails(id: widget.service.id);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Color serviceColor = Utility.hexColor(widget.color);
    UserType userType = StorageManager.getUserType();
    return Scaffold(
      backgroundColor: AppColors.greyColor,
      body: Consumer<SharedServiceDetailsProvider>(
          builder: (context, sharedServiceDetailsProvider, child) {
        if (sharedServiceDetailsProvider.isLoading) {
          return const CustomProgressIndicator(color: AppColors.blackColor);
        } else {
          if (sharedServiceDetailsProvider.serviceDetailsModel != null) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomHeaderWithImage(
                      url: widget.service.photo.isNotEmpty
                          ? widget.service.photo[0].fullname
                          : widget.service.images.isNotEmpty
                              ? Utility.getServiceImageURL(
                                  widget.service.images[0].share)
                              : 'https://picsum.photos/360/200?random=${widget.service.id}',
                      imageHeight: 200.h,
                      imageWidth: 360.w,
                      hasBackButton: true),
                  SizedBox(
                    height: 18.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            widget.service.label,
                            style: AppTextStyles.header2Inter,
                          ),
                        ),
                      
                        if (userType != UserType.guest)
                          Text(
                            '${Utility.getPriceSubString(widget.service.multipricesIncludesTax.firstPrice)}€/H',
                            style: userType == UserType.subscribedUser
                                ? AppTextStyles.header4InterGrey50.copyWith(
                                    decoration: TextDecoration.lineThrough)
                                : AppTextStyles.header2Inter,
                          ),
                        if (userType != UserType.guest)
                          SizedBox(
                            width: 5.w,
                          ),
                        if (userType == UserType.subscribedUser)
                          Text(
                              '${Utility.getPriceSubString(widget.service.multipricesIncludesTax.secondPrice)}€/H',
                              style: AppTextStyles.header2Inter),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: CustomDivider(
                      color: serviceColor,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Consumer<SharedServiceDetailsProvider>(
                    builder: (BuildContext context,
                        SharedServiceDetailsProvider provider, _) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Container(
                          decoration: BoxDecoration(
                              color: AppColors.whiteColor,
                              borderRadius: BorderRadius.circular(5.r)),
                          height: 420.h,
                          width: 320.w,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 10.h,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20.w),
                                child: DefaultTabController(
                                  length: 2,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        constraints: const BoxConstraints(
                                            maxHeight: 40.0),
                                        child: TabBar(
                                          labelColor: AppColors.blackColor,
                                          unselectedLabelColor:
                                              AppColors.grey70Color,
                                          indicatorSize:
                                              TabBarIndicatorSize.tab,
                                          splashBorderRadius:
                                              BorderRadius.circular(20.r),
                                          indicator: BubbleTabIndicator(
                                            insets: EdgeInsets.symmetric(
                                                horizontal: 17.w),
                                            indicatorColor: serviceColor,
                                            indicatorHeight: 39.h,
                                            tabBarIndicatorSize:
                                                TabBarIndicatorSize.tab,
                                            indicatorRadius: 20.r,
                                          ),
                                          overlayColor:
                                              MaterialStateProperty.all(
                                                  Colors.transparent),
                                          onTap: (int value) {
                                            provider.changeTabIndex(value);
                                          },
                                          indicatorColor: AppColors.redColor,
                                          labelStyle: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                          tabs: [
                                            Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              20.r)),
                                                  border: provider.tabIndex != 0
                                                      ? Border.all(width: 0.1)
                                                      : null,
                                                  color: provider.tabIndex != 0
                                                      ? AppColors.whiteColor
                                                      : Colors.transparent),
                                              width: 135.w,
                                              child: const Tab(
                                                text: 'Details',
                                              ),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              20.r)),
                                                  border: provider.tabIndex != 1
                                                      ? Border.all(width: 0.1)
                                                      : null,
                                                  color: provider.tabIndex != 1
                                                      ? AppColors.whiteColor
                                                      : Colors.transparent),
                                              width: 135.w,
                                              child: const Tab(
                                                text: 'Conditions',
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20.h,
                                      ),
                                      provider.tabIndex == 1
                                          ? _conditions(
                                              text: sharedServiceDetailsProvider
                                                  .serviceDetailsModel!
                                                  .condition)
                                          : _taskList(
                                              sharedServiceDetailsProvider,
                                              serviceColor),
                                      SizedBox(height: 20.h),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  //const Spacer(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: CustomButtonBlack(
                        buttonContent: const Text("Continue"),
                        onPressed: userType == UserType.guest
                            ? null
                            : () {
                                RoutingProvider.pushNamed(
                                    routeName: Routes
                                        .userServiceSubscibeSelectTasksScreen,
                                    arguments: sharedServiceDetailsProvider
                                        .serviceDetailsModel!);
                              }),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                ],
              ),
            );
          } else {
            return Container();
          }
        }
      }),
    );
  }

  // Widget to Display text refer to conditions ...
  Widget _conditions({required String text}) {
    return Text(
      text,
      style: AppTextStyles.paragraph3Roboto,
    );
  }

  // Widget to Display List of tasks
  Widget _taskList(SharedServiceDetailsProvider provider, Color serviceColor) {
    return SizedBox(
      height: 325.h,
      child: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: provider.serviceDetailsModel!.tasks.length,
          itemBuilder: (BuildContext context, int index) {
            TaskModel task = provider.serviceDetailsModel!.tasks[index];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 12.h,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 11.w,
                    ),
                    Container(
                      height: 5.h,
                      width: 5.w,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: serviceColor),
                    ),
                    SizedBox(
                      width: 12.w,
                    ),
                    Text(
                      task.label,
                      style: AppTextStyles.paragraph3Roboto,
                    ),
                  ],
                ),
                /* Text(
                  task.label,
                  style: AppTextStyles.header4Inter,
                ), */
                SizedBox(
                  height: 12.h,
                ),
                /* ...List.generate(
                  service.options.length,
                  (i) => Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.h),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 11.w,
                        ),
                        Container(
                          height: 5.h,
                          width: 5.w,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: serviceColor),
                        ),
                        SizedBox(
                          width: 12.w,
                        ),
                        Text(
                          service.options[i],
                          style: AppTextStyles.paragraph3Roboto,
                        ),
                      ],
                    ),
                  ),
                ), */
              ],
            );
          }),
    );
  }
}
