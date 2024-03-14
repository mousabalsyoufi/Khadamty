import 'package:faciltateur_de_vies/core/extensions/date_extensions.dart';
import 'package:faciltateur_de_vies/core/helpers/date_helper.dart';
import 'package:faciltateur_de_vies/screens/user_upcoming_one_time_service_details_screen/business_logic/provider/user_upcoming_one_time_service_details_provider.dart';
import 'package:faciltateur_de_vies/shared_widgets/bottom_sheets/widgets/small_bottom_sheet_button.dart';
import 'package:faciltateur_de_vies/shared_widgets/custom_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:provider/provider.dart';

import '../../../../constants/colors/colors.dart';
import '../../../../constants/icons/icons.dart';
import '../../../../constants/text_styles/text_styles.dart';
import '../../../../core/utility/utility.dart';
import '../../../../routes/routes_names/routes_names.dart';
import '../../../../routes/routes_provider/routes_provider.dart';
import '../../../../shared_widgets/bottom_sheets/cancellation_confirmation_bottom_sheet/cancellation_confirmation_bottom_sheet_impl.dart';
import '../../../../shared_widgets/bottom_sheets/custom_sheets/custom_sheets.dart';
import '../../../../shared_widgets/circle_image_with_border.dart';
import '../../../../shared_widgets/custom_appbar.dart';
import '../../../../shared_widgets/custom_button_black.dart';
import '../../../../shared_widgets/cancel_icon.dart';

class UserUpcomingOneTimeServiceDetailsScreen extends StatefulWidget {
  const UserUpcomingOneTimeServiceDetailsScreen(
      {super.key, required this.serviceId});

  final String serviceId;

  @override
  State<UserUpcomingOneTimeServiceDetailsScreen> createState() =>
      _UserUpcomingOneTimeServiceDetailsScreenState();
}

class _UserUpcomingOneTimeServiceDetailsScreenState
    extends State<UserUpcomingOneTimeServiceDetailsScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<UserUpcomingOneTimeServiceDetailsProvider>(context,
              listen: false)
          .getUpcomingServiceDetails(id: widget.serviceId);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Utility.changeStatusBarToTransparent();
    return Scaffold(
      appBar: customAppBar('Service details', actions: [
        Padding(
          padding: EdgeInsetsDirectional.only(end: 15.w),
          child: GestureDetector(
            onTap: (() {
              // argument is to determain if it's chat history
              RoutingProvider.pushNamed(
                  routeName: Routes.sharedChatScreen, arguments: false);
            }),
            child: SvgPicture.asset(
              AppIcons.chatInServiceIcon,
              width: 35.r,
              height: 35.r,
            ),
          ),
        ),
      ]),
      body: Consumer<UserUpcomingOneTimeServiceDetailsProvider>(
          builder: (context, provider, _) {
        if (provider.isLoading) {
          return const CustomProgressIndicator(color: AppColors.blackColor);
        } else if (provider.upcomingService != null) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(20.r),
              child: Column(
                children: [
                  _serviceDetailsCard(provider),
                  SizedBox(
                    height: 15.h,
                  ),
                  _instructionsDetailsCard(provider),
                  SizedBox(
                    height: 15.h,
                  ),
                  InkWell(
                    onTap: () {
                      CustomSheets.showIconTextTextTwoButtonBottomSheet(
                          context: context,
                          height: 331.h,
                          headlineText:
                              'Are you sure you will cancel the service?',
                          contentText:
                              'Cancellation is possible by contacting the Group Facilitateudevies.com at least 2 working days before the date of execution of the planned intervention. Any service not cancelled will be considered due and invoiced at the rate in force (except in cases of force majeure).',
                          acceptButtonText: 'Yes',
                          rejectButtonText: 'No',
                          acceptButtonColor: AppColors.whiteColor,
                          rejectButtonColor: AppColors.blackColor,
                          acceptButtonTapFunction: () {
                            CancellationConfirmationBottomSheet
                                .showCancellationConfirmationBottomSheet(
                                    context);
                          },
                          rejectButtonTapFunction: () {
                            RoutingProvider.goBack();
                          },
                          acceptButtonStyle: AppTextStyles.robotoMediumBlack
                              .copyWith(fontSize: 16.sp),
                          rejectButtonStyle: AppTextStyles.robotoMediumWhite
                              .copyWith(fontSize: 16.sp),
                          buttonWidth: 150.w,
                          borderColor: AppColors.blackColor,
                          iconPath: AppIcons.cacheImageWarningIcon);
                    },
                    child: Row(
                      children: [
                        const CancelIcon(),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          'Cancel service offer',
                          style: AppTextStyles.robotoBoldBlack(12.sp),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 20.h),
                    child: CustomButtonBlack(
                      onPressed: () {
                        if (1 == 1) {
                          CustomSheets
                              .showIconTextTextTwoButtonColumnBottomSheet(
                                  context: context,
                                  headlineText:
                                      'Oops! It’s too late to reschedule',
                                  contentText:
                                      'You have reached the 48 hour limit to reschedule the service, please cancel if you cannot attend.',
                                  acceptButtonText: 'OK',
                                  rejectButtonText: 'Cancel',
                                  acceptButtonColor: AppColors.blackColor,
                                  rejectButtonColor: AppColors.whiteColor,
                                  acceptButtonTapFunction: () {},
                                  rejectButtonTapFunction: () {
                                    CustomSheets
                                        .showIconTextTextTwoButtonBottomSheet(
                                            context: context,
                                            height: 331.h,
                                            headlineText:
                                                'Are you sure you will cancel the service?',
                                            contentText:
                                                'Cancellation is possible by contacting the Group Facilitateudevies.com at least 2 working days before the date of execution of the planned intervention. Any service not cancelled will be considered due and invoiced at the rate in force (except in cases of force majeure).',
                                            acceptButtonText: 'Yes',
                                            rejectButtonText: 'No',
                                            acceptButtonColor:
                                                AppColors.whiteColor,
                                            rejectButtonColor:
                                                AppColors.blackColor,
                                            acceptButtonTapFunction: () {
                                              CancellationConfirmationBottomSheet
                                                  .showCancellationConfirmationBottomSheet(
                                                      context);
                                            },
                                            rejectButtonTapFunction: () {
                                              RoutingProvider.goBack();
                                            },
                                            acceptButtonStyle: AppTextStyles
                                                .robotoMediumBlack
                                                .copyWith(fontSize: 16.sp),
                                            rejectButtonStyle: AppTextStyles
                                                .robotoMediumWhite
                                                .copyWith(fontSize: 16.sp),
                                            buttonWidth: 150.w,
                                            borderColor: AppColors.blackColor,
                                            iconPath:
                                                AppIcons.cacheImageWarningIcon);
                                  },
                                  acceptButtonStyle: AppTextStyles
                                      .robotoMediumWhite
                                      .copyWith(fontSize: 16.sp),
                                  rejectButtonStyle: AppTextStyles
                                      .robotoMediumBlack
                                      .copyWith(fontSize: 16.sp),
                                  borderColor: AppColors.blackColor,
                                  iconPath: AppIcons.stopIcon);
                        } else {}
                      },
                      buttonContent: const Text('Reschedule'),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return Container();
        }
      }),
    );
  }

  Container _serviceDetailsCard(
          UserUpcomingOneTimeServiceDetailsProvider provider) =>
      Container(
        padding: EdgeInsets.all(20.r),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(5.r),
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Service',
                      style: AppTextStyles.header4Inter,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      provider.upcomingService!.lines[0].productLabel,
                      style: AppTextStyles.robotoRegularBlack(12.sp),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Text(
                      'Date',
                      style: AppTextStyles.header4Inter,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      DateHelper.dateFromTimeStamp(
                              provider.upcomingService!.lines[0].dateStart)
                          .toLocal()
                          .doMMMyyyy(),
                      style: AppTextStyles.robotoRegularBlack(12.sp),
                    ),
                    Text(
                      DateHelper.dateFromTimeStamp(
                              provider.upcomingService!.lines[0].dateStart)
                          .toLocal()
                          .hhmm(),
                      style: AppTextStyles.robotoRegularBlack(12.sp),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      'Easer',
                      style: AppTextStyles.header4Inter,
                    ),
                  ],
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      width: 130.w,
                      padding: EdgeInsets.all(10.r),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.r),
                        border: Border.all(
                          width: 1.w,
                          color: AppColors.greyColor,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Price ATI',
                                style: AppTextStyles.robotoRegularBlack(10.sp),
                              ),
                              Text(
                                '${Utility.getPriceSubString(provider.upcomingService!.multicurrencyTotalHt)}€',
                                style: AppTextStyles.header4Inter,
                              ),
                            ],
                          ),
                          Divider(
                            color: AppColors.greyColor,
                            thickness: 1.2.w,
                            height: 20.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Duration',
                                style: AppTextStyles.robotoRegularBlack(10.sp),
                              ),
                              Text(
                                '${((provider.upcomingService!.lines[0].dateEnd - provider.upcomingService!.lines[0].dateStart) / 3600).toString().substring(0, 1)}:00',
                                style: AppTextStyles.header4Inter,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 8.h,
            ),
            Row(
              children: [
                CircleImageWithBorder(
                    url:
                        'https://freepngimg.com/thumb/man/10-man-png-image.png',
                    width: 30.r,
                    height: 30.r),
                SizedBox(width: 13.w),
                Text(
                  'Jhon',
                  style: AppTextStyles.robotoRegularBlack(12.sp),
                ),
                const Spacer(),
                SmallBottomSheetButton(
                    buttonText: 'Activate recurrence',
                    onPressed: () {
                      RoutingProvider.pushNamed(
                          routeName: Routes
                              .userRecurrentSubscriptionActivationChooseDateScreen);
                    },
                    buttonTextStyle:
                        AppTextStyles.robotoBoldWhite.copyWith(fontSize: 12.sp),
                    buttonColor: AppColors.blackColor,
                    buttonWidth: 135.w,
                    borderColor: AppColors.blackColor)
              ],
            )
          ],
        ),
      );

  Container _instructionsDetailsCard(
          UserUpcomingOneTimeServiceDetailsProvider provider) =>
      Container(
        padding: EdgeInsets.all(20.r),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(5.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (provider.upcomingService!.instructions != null &&
                provider.upcomingService!.instructions!.isNotEmpty)
              Text(
                'My instructions',
                style: AppTextStyles.header4Inter,
              ),
            if (provider.upcomingService!.instructions != null &&
                provider.upcomingService!.instructions!.isNotEmpty)
              SizedBox(
                height: 5.h,
              ),
            if (provider.upcomingService!.instructions != null &&
                provider.upcomingService!.instructions!.isNotEmpty)
              Text(
                provider.upcomingService!.instructions!,
                style: AppTextStyles.robotoRegularBlack(12.sp),
              ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              'Details',
              style: AppTextStyles.header4Inter,
            ),
            SizedBox(
              height: 5.h,
            ),
            HtmlWidget(
              '${provider.upcomingService!.lines[0].productLabel}: ${provider.upcomingService!.lines[0].productDesc}',
              textStyle: AppTextStyles.robotoRegularBlack(12.sp),
            ),
            /* Text(
              '${provider.upcomingService!.lines[0].productLabel}: ${provider.upcomingService!.lines[0].productDesc}',
              style: AppTextStyles.robotoRegularBlack(12.sp),
            ), */
            SizedBox(
              height: 20.h,
            ),
            Text(
              'Conditions',
              style: AppTextStyles.header4Inter,
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              'You must provide the equipment and consumables necessary for the proper performance of the service.',
              style: AppTextStyles.robotoRegularBlack(12.sp),
            ),
          ],
        ),
      );
}
