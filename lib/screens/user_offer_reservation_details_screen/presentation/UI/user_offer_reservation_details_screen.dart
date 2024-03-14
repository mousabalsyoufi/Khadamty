import 'package:faciltateur_de_vies/constants/colors/colors.dart';
import 'package:faciltateur_de_vies/constants/icons/icons.dart';
import 'package:faciltateur_de_vies/constants/text_styles/text_styles.dart';
import 'package:faciltateur_de_vies/core/extensions/date_extensions.dart';
import 'package:faciltateur_de_vies/core/utility/utility.dart';
import 'package:faciltateur_de_vies/screens/user_offer_reservation_details_screen/business_logic/user_offer_reservation_details_provider.dart';
import 'package:faciltateur_de_vies/shared_widgets/bottom_sheets/custom_sheets/custom_sheets.dart';
import 'package:faciltateur_de_vies/shared_widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:provider/provider.dart';

import '../../../../core/helpers/date_helper.dart';
import '../../../../routes/routes_names/routes_names.dart';
import '../../../../routes/routes_provider/routes_provider.dart';
import '../../../../shared_widgets/bottom_sheets/cancellation_confirmation_bottom_sheet/cancellation_confirmation_bottom_sheet_impl.dart';
import '../../../../shared_widgets/bottom_sheets/offer_subscriber_upcoming_bottom_sheet/offer_subscriber_upcoming_sheet.dart';
import '../../../../shared_widgets/custom_progress_indicator.dart';
import '../../../../shared_widgets/custom_recursive_circle.dart';
import '../../../../shared_widgets/cancel_icon.dart';
import '../../../../shared_widgets/edit_icon.dart';

class UserOfferReservationDetailsScreen extends StatefulWidget {
  const UserOfferReservationDetailsScreen({super.key, required this.offerId});

  final String offerId;

  @override
  State<UserOfferReservationDetailsScreen> createState() =>
      _UserOfferReservationDetailsScreenState();
}

class _UserOfferReservationDetailsScreenState
    extends State<UserOfferReservationDetailsScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<UserOfferReservationDetailsProvider>(context, listen: false)
          .getUpcomingOfferDetails(id: widget.offerId);
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
      body: Consumer<UserOfferReservationDetailsProvider>(
          builder: (context, provider, _) {
        if (provider.isLoading) {
          return const CustomProgressIndicator(color: AppColors.blackColor);
        } else if (provider.upcomingOffer != null) {
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
                      OfferSubscriberUpcomingSheet.showOfferSubscriberUpcoming(
                          context);
                    },
                    child: Row(
                      children: [
                        const EditIcon(),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          'Edit services',
                          style: AppTextStyles.robotoBoldBlack(12.sp),
                        ),
                      ],
                    ),
                  ),
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
                  /*  SizedBox(
                    height: 50.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 20.h),
                    child: CustomButtonBlack(
                      onPressed: () {},
                      buttonText: 'Reschedule',
                    ),
                  ), */
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

  Container _serviceDetailsCard(UserOfferReservationDetailsProvider provider) =>
      Container(
        padding: EdgeInsets.all(20.r),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(5.r),
        ),
        child: Row(
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
                  'All House',
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
                          provider.upcomingOffer!.lines[0].dateStart)
                      .toLocal()
                      .doMMMyyyy(),
                  style: AppTextStyles.robotoRegularBlack(12.sp),
                ),
                Text(
                  DateHelper.dateFromTimeStamp(
                          provider.upcomingOffer!.lines[0].dateStart)
                      .toLocal()
                      .hhmm(),
                  style: AppTextStyles.robotoRegularBlack(12.sp),
                ),
                SizedBox(
                  height: 10.h,
                ),
                /*  Text(
                  'Easer',
                  style: AppTextStyles.header4Inter,
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
                  ],
                ) */
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
                            '${Utility.getPriceSubString(provider.upcomingOffer!.multicurrencyTotalHt)}€',
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
                            '${((provider.upcomingOffer!.lines[0].dateEnd - provider.upcomingOffer!.lines[0].dateStart) / 3600).toString().substring(0, 1)}:00',
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
                            'Rec.',
                            style: AppTextStyles.robotoRegularBlack(10.sp),
                          ),
                          Text(
                            '3x/ 1 week',
                            style: AppTextStyles.header4Inter,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 23.h,
                ),
                const CustomRecursiveCircle(
                  width: 30,
                  height: 30,
                ),
              ],
            ),
          ],
        ),
      );

  Container _instructionsDetailsCard(
          UserOfferReservationDetailsProvider provider) =>
      Container(
        padding: EdgeInsets.all(20.r),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(5.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /*  Text(
              'My instructions',
              style: AppTextStyles.header4Inter,
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              'You will find the key under the doormat. Attention a dog is in the house.',
              style: AppTextStyles.robotoRegularBlack(12.sp),
            ),
            SizedBox(
              height: 20.h,
            ), */
            Text(
              'Details',
              style: AppTextStyles.header4Inter,
            ),
            SizedBox(
              height: 5.h,
            ),
            Column(
              children: provider.upcomingOffer!.lines
                  .map(
                    (service) => HtmlWidget(
                      '${service.productLabel}: ${service.productDesc}',
                      textStyle: AppTextStyles.robotoRegularBlack(12.sp),
                    ),
                    /* Text(
                      '${service.productLabel}: ${service.productDesc}',
                      style: AppTextStyles.robotoRegularBlack(12.sp),
                    ), */
                  )
                  .toList(),
            ),
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
