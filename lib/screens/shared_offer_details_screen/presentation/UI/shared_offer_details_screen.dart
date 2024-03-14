import 'package:faciltateur_de_vies/constants/colors/colors.dart';
import 'package:faciltateur_de_vies/constants/enums/user_type.dart';
import 'package:faciltateur_de_vies/constants/text_styles/text_styles.dart';
import 'package:faciltateur_de_vies/core/local_storage/storage_manager.dart';
import 'package:faciltateur_de_vies/core/utility/utility.dart';
import 'package:faciltateur_de_vies/routes/routes_provider/routes_provider.dart';
import 'package:faciltateur_de_vies/shared_widgets/custom_user_divider.dart';
import 'package:faciltateur_de_vies/shared_widgets/custom_button_black.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../../routes/routes_names/routes_names.dart';
import '../../../../shared_models/category_service_model.dart';
import '../../../../shared_widgets/custom_progress_indicator.dart';
import '../../../../shared_widgets/custom_user_app_bar.dart';
import 'package:flutter/material.dart';

import '../../business_logic/shared_offer_details_provider/shared_offer_details_provider.dart';
import '../../data/model/offer_details_model.dart';

// This is screen to show user offer Details
class SharedOfferDetailsScreen extends StatefulWidget {
  const SharedOfferDetailsScreen({
    Key? key,
    required this.service,
    required this.color,
  }) : super(key: key);

  final CategoryServiceModel service;
  final String color;

  @override
  State<SharedOfferDetailsScreen> createState() =>
      _SharedOfferDetailsScreenState();
}

class _SharedOfferDetailsScreenState extends State<SharedOfferDetailsScreen> {
  @override
  void initState() {
    Utility.changeStatusBarToTransparent();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<SharedOfferDetailsProvider>(context, listen: false)
          .getofferDetails(id: widget.service.id);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Color color = Utility.hexColor(widget.color);
    UserType userType = StorageManager.getUserType();
    return Scaffold(
      backgroundColor: AppColors.greyColor,
      body: Consumer<SharedOfferDetailsProvider>(
          builder: (context, userOfferDetailsProvider, child) {
        if (userOfferDetailsProvider.isLoading) {
          return const CustomProgressIndicator(color: AppColors.blackColor);
        } else {
          if (userOfferDetailsProvider.offerDetails.isNotEmpty) {
            return Column(
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
                  child: const CustomDivider(
                    color: AppColors.blackColor,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
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
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              /* Container(
                                constraints:
                                    const BoxConstraints(maxHeight: 40.0),
                                child: TabBar(
                                  labelColor: AppColors.whiteColor,
                                  unselectedLabelColor: AppColors.grey70Color,
                                  indicatorSize: TabBarIndicatorSize.tab,
                                  splashBorderRadius:
                                      BorderRadius.circular(20.r),
                                  indicator: BubbleTabIndicator(
                                    insets: EdgeInsets.symmetric(
                                        horizontal: 17.w),
                                    indicatorColor:
                                        Utility.hexColor(widget.color),
                                    indicatorHeight: 39.h,
                                    tabBarIndicatorSize:
                                        TabBarIndicatorSize.tab,
                                    indicatorRadius: 20.r,
                                  ),
                                  overlayColor: MaterialStateProperty.all(
                                      Colors.transparent),
                                  onTap: (int value) {
                                    userOfferDetailsProvider
                                        .changeTabIndex(value);
                                  },
                                  indicatorColor: AppColors.redColor,
                                  labelStyle: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                  labelPadding:
                                      EdgeInsets.symmetric(horizontal: 0.w),
                                  indicatorPadding:
                                      EdgeInsets.symmetric(horizontal: -10.w),
                                  tabs: [
                                    ...List.generate(
                                        userOfferDetailsProvider
                                            .offerDetails.length, (index) {
                                      return Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 15.w),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20.r)),
                                            border: userOfferDetailsProvider
                                                        .tabIndex !=
                                                    index
                                                ? Border.all(width: 0.1)
                                                : null,
                                            color: userOfferDetailsProvider
                                                        .tabIndex !=
                                                    index
                                                ? AppColors.whiteColor
                                                : Colors.transparent),
                                        child: Tab(
                                          text: userOfferDetailsProvider
                                              .offerDetails[index].label,
                                        ),
                                      );
                                    }),
                                    /*  Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 15.w),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20.r)),
                                          border: userOfferDetailsProvider
                                                      .tabIndex !=
                                                  0
                                              ? Border.all(width: 0.1)
                                              : null,
                                          color: userOfferDetailsProvider
                                                      .tabIndex !=
                                                  0
                                              ? AppColors.whiteColor
                                              : Colors.transparent),
                                      child: const Tab(
                                        text: 'Home',
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 15.w),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20.r)),
                                          border: userOfferDetailsProvider
                                                      .tabIndex !=
                                                  1
                                              ? Border.all(width: 0.1)
                                              : null,
                                          color: userOfferDetailsProvider
                                                      .tabIndex !=
                                                  1
                                              ? AppColors.whiteColor
                                              : Colors.transparent),
                                      child: const Tab(
                                        text: 'Family',
                                      ),
                                    ), */
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.w),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20.r)),
                                          border: userOfferDetailsProvider
                                                      .tabIndex !=
                                                  userOfferDetailsProvider
                                                      .offerDetails.length
                                              ? Border.all(width: 0.1)
                                              : null,
                                          color: userOfferDetailsProvider
                                                      .tabIndex !=
                                                  userOfferDetailsProvider
                                                      .offerDetails.length
                                              ? AppColors.whiteColor
                                              : Colors.transparent),
                                      child: const Tab(
                                        text: 'Les conditions',
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20.h,
                              ), */
                              SizedBox(
                                height: 42.h,
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    ...List.generate(
                                        userOfferDetailsProvider
                                            .offerDetails.length, (index) {
                                      return Row(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              userOfferDetailsProvider
                                                  .changeTabIndex(index);
                                            },
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 30.w),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(Radius
                                                          .circular(20.r)),
                                                  border:
                                                      userOfferDetailsProvider
                                                                  .tabIndex !=
                                                              index
                                                          ? Border.all(
                                                              width: 0.1)
                                                          : null,
                                                  color:
                                                      userOfferDetailsProvider
                                                                  .tabIndex !=
                                                              index
                                                          ? AppColors.whiteColor
                                                          : color),
                                              child: Center(
                                                child: Text(
                                                  userOfferDetailsProvider
                                                      .offerDetails[index]
                                                      .label,
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color:
                                                          userOfferDetailsProvider
                                                                      .tabIndex !=
                                                                  index
                                                              ? AppColors
                                                                  .grey70Color
                                                              : AppColors
                                                                  .whiteColor,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 20.w,
                                          ),
                                        ],
                                      );
                                    }),
                                    GestureDetector(
                                      onTap: () {
                                        userOfferDetailsProvider.changeTabIndex(
                                            userOfferDetailsProvider
                                                .offerDetails.length);
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 30.w),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20.r)),
                                            border: userOfferDetailsProvider
                                                        .tabIndex !=
                                                    userOfferDetailsProvider
                                                        .offerDetails.length
                                                ? Border.all(width: 0.1)
                                                : null,
                                            color: userOfferDetailsProvider
                                                        .tabIndex !=
                                                    userOfferDetailsProvider
                                                        .offerDetails.length
                                                ? AppColors.whiteColor
                                                : color),
                                        child: Center(
                                          child: Text(
                                            'Les Conditions',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: userOfferDetailsProvider
                                                            .tabIndex !=
                                                        userOfferDetailsProvider
                                                            .offerDetails.length
                                                    ? AppColors.grey70Color
                                                    : AppColors.whiteColor,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(height: 20.h),
                              userOfferDetailsProvider.tabIndex ==
                                      userOfferDetailsProvider
                                          .offerDetails.length
                                  ? _conditions(
                                      text:
                                          "You must provide the material and consumables necessary for the good realisation of the service. The minimum duration of the intervention is 2 hours.\n\n\nMaintenance of windows accessible after a height of 2 steps maximum.")
                                  : _taskList(userOfferDetailsProvider,
                                      userOfferDetailsProvider.tabIndex),
                              SizedBox(height: 20.h),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: CustomButtonBlack(
                      buttonContent: const Text("Continue"),
                      onPressed: userType == UserType.guest
                          ? null
                          : () {
                              RoutingProvider.pushNamed(
                                  routeName:
                                      Routes.userMainOfferSubscriberScreen,
                                  arguments: {
                                    'offer': widget.service,
                                    'offerDetails':
                                        userOfferDetailsProvider.offerDetails,
                                  });
                            }),
                ),
                SizedBox(
                  height: 20.h,
                ),
              ],
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
  Widget _taskList(SharedOfferDetailsProvider provider, int index) {
    return SizedBox(
      height: 325.h,
      child: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: provider.offerDetails[index].products.length,
          itemBuilder: (BuildContext context, int productsIndex) {
            OfferProduct product =
                provider.offerDetails[index].products[productsIndex];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 12.h,
                ),
                Text(
                  product.label,
                  style: AppTextStyles.header4Inter,
                ),
                SizedBox(
                  height: 12.h,
                ),
                ...List.generate(
                  product.tasks.length,
                  (tasksIndex) => Padding(
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
                              color: Utility.hexColor(widget.color)),
                        ),
                        SizedBox(
                          width: 12.w,
                        ),
                        Text(
                          product.tasks[tasksIndex].label,
                          style: AppTextStyles.paragraph3Roboto,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }
}
