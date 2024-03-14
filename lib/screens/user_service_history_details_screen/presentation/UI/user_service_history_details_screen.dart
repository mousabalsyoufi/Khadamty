import 'package:faciltateur_de_vies/core/extensions/date_extensions.dart';
import 'package:faciltateur_de_vies/core/utility/utility.dart';
import 'package:faciltateur_de_vies/screens/user_service_history_details_screen/business_logic/provider/user_service_history_details_provider.dart';
import 'package:faciltateur_de_vies/shared_widgets/custom_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:provider/provider.dart';

import '../../../../constants/colors/colors.dart';
import '../../../../constants/text_styles/text_styles.dart';
import '../../../../core/helpers/date_helper.dart';
import '../../../../shared_widgets/circle_image_with_border.dart';
import '../widgets/user_service_history_details_header_widget.dart';

class UserServiceHistoryDetailsScreen extends StatefulWidget {
  const UserServiceHistoryDetailsScreen({Key? key, required this.orderId, required this.serviceId})
      : super(key: key);

  final bool? isRated = false;
  final String orderId;
  final String serviceId;

  @override
  State<UserServiceHistoryDetailsScreen> createState() =>
      _UserServiceHistoryDetailsScreenState();
}

class _UserServiceHistoryDetailsScreenState
    extends State<UserServiceHistoryDetailsScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<UserServiceHistoryDetailsProvider>(context, listen: false)
          .getServiceHistoryDetails(id: widget.orderId);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Utility.changeStatusBarToTransparent();
    return Consumer<UserServiceHistoryDetailsProvider>(
        builder: (context, provider, _) {
      if (provider.isLoading) {
        return const Scaffold(
          body: CustomProgressIndicator(color: AppColors.blackColor),
        );
      } else if (provider.serviceHistory != null) {
        return Scaffold(
          /* bottomNavigationBar: Padding(
            padding: EdgeInsets.all(20.r),
            child: CustomButtonBlack(
              onPressed: () {
                RoutingProvider.pushNamed(
                    routeName: Routes.userServiceSubscibeSelectTasksScreen);
              },
              buttonContent: const Text('Order again'),
            ),
          ), */
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                UserServiceHistoryDetailsHeaderWidget(
                  isRated: widget.isRated!,
                  orderId: widget.orderId,
                  serviceId: widget.serviceId,
                ),
                SizedBox(
                  height: 26.h,
                ),
                _detailsBox(provider),
                SizedBox(
                  height: 10.h,
                ),
                _instructions(provider),
                /* SizedBox(
                  height: 25.h,
                ),
                InkWell(
                    onTap: () {
                      RoutingProvider.pushNamed(
                          routeName: Routes.userReportIssueScreen);
                    },
                    child: option(
                        title: "Report a problem", icon: AppIcons.attentionIcon)),
                SizedBox(
                  height: 22.h,
                ),
                InkWell(
                    onTap: () {
                      // argument is to define if chat is history or not
                      RoutingProvider.pushNamed(
                          routeName: Routes.sharedChatScreen, arguments: true);
                    },
                    child: option(
                        title: "Open chat History",
                        icon: AppIcons.easerChatIconActive,
                        iconColor: AppColors.blackColor)), */
              ],
            ),
          ),
        );
      } else {
        return Container();
      }
    });
  }

  ///options  [ Report a problem , open chat ]
  ///
// widget for option [ icon , Text ]
  Widget option(
      {required String icon, required String title, Color? iconColor}) {
    return Row(
      children: [
        SvgPicture.asset(icon,
            height: 12.h, width: 12.w, fit: BoxFit.cover, color: iconColor),
        SizedBox(
          width: 9.w,
        ),
        Text(
          title,
          style: AppTextStyles.robotoBoldBlack(12.sp),
        )
      ],
    );
  }

  /// Instructions Part
  /// The Second section in screen contain [ my instructions , Details , Review ]
  Widget _instructions(UserServiceHistoryDetailsProvider provider) {
    return Container(
      height: 207.h,
      width: 320.w,
      color: AppColors.whiteColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (provider.serviceHistory!.instructions != null &&
              provider.serviceHistory!.instructions!.isNotEmpty)
            instructionRow(
                title: "My instructions",
                value: provider.serviceHistory!.instructions!),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Text(
              'Details',
              style: AppTextStyles.header4Inter,
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: HtmlWidget(
              '${provider.serviceHistory!.lines[0].productLabel}: ${provider.serviceHistory!.lines[0].productDesc}',
              textStyle: AppTextStyles.robotoRegularBlack(12.sp),
            ),
          ),
          /* instructionRow(
              title: "Review",
              value: widget.isRated!
                  ? "John was super nice with the kids! I am satisfied with his service."
                  : "No Review yet") */
        ],
      ),
    );
  }

  Widget instructionRow({required String title, required String value}) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
        start: 15.w,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 15.h,
          ),
          Text(
            title,
            style: AppTextStyles.header4Inter,
          ),
          SizedBox(
            height: 5.h,
          ),
          Text(
            value,
            style: AppTextStyles.robotoRegularBlack(12.sp),
          ),
          SizedBox(
            height: 5.h,
          ),
        ],
      ),
    );
  }

  ///@Table View
  ///Table left Side Widget

  //split widget to show service details container
  Widget _detailsBox(UserServiceHistoryDetailsProvider provider) {
    return Container(
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
              // The 'isSpace' to add space after each row
              _tableDetailsLeftSide(
                  key: 'Services',
                  value: provider.serviceHistory!.lines[0].productLabel,
                  isSpace: false),
              _tableDetailsLeftSide(
                key: 'Date',
                value:
                    '${DateHelper.dateFromTimeStamp(provider.serviceHistory!.lines[0].dateStart).toLocal().doMMMyyyy()} ${DateHelper.dateFromTimeStamp(provider.serviceHistory!.lines[0].dateStart).toLocal().hhmm()}',
              ),
              /* _tableDetailsLeftSide(
                key: 'Easer',
                value: "John",
                includeImage: true,
              ), */
            ],
          ),
          const Spacer(),
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
                _tableDetailsRightSide(
                  key: 'Price ATI',
                  value:
                      '${Utility.getPriceSubString(provider.serviceHistory!.multicurrencyTotalHt)}€',
                ),
                _tableDetailsRightSide(
                  key: 'Duration',
                  value:
                      '${((provider.serviceHistory!.lines[0].dateEnd - provider.serviceHistory!.lines[0].dateStart) / 3600).toString().substring(0, 1)}:00',
                  isDivider: false,
                ),
                /* _tableDetailsRightSide(key: 'Start', value: '12:34'),
                // The  'isDivider' to not add any divider after last item
                _tableDetailsRightSide(
                    key: 'End', value: '14:24€', isDivider: false), */
              ],
            ),
          ),
        ],
      ),
    );
  }

  // left side table information
  Widget _tableDetailsLeftSide(
      {required String key,
      required String value,
      bool isSpace = true,
      bool includeImage = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (isSpace)
          SizedBox(
            height: 5.h,
          ),
        Text(
          key,
          style: AppTextStyles.header4Inter,
        ),
        SizedBox(
          height: 5.h,
        ),
        includeImage
            ? Row(
                children: [
                  CircleImageWithBorder(
                    url:
                        'https://freepngimg.com/thumb/man/10-man-png-image.png',
                    width: 30.w,
                    height: 30.h,
                    borderColor: AppColors.transparentColor,
                    borderWidth: 0.r,
                  ),
                  SizedBox(
                    width: 13.w,
                  ),
                  Text(
                    value,
                    style: AppTextStyles.robotoRegularBlack(12.sp),
                  )
                ],
              )
            : SizedBox(
                width: 130.w,
                child: Text(
                  value,
                  style: AppTextStyles.robotoRegularBlack(12.sp),
                ),
              ),
      ],
    );
  }

  // right side table information
  Widget _tableDetailsRightSide(
      {required String key, required String value, bool isDivider = true}) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              key,
              style: AppTextStyles.robotoRegularBlack(10.sp),
            ),
            Text(
              value,
              style: AppTextStyles.header4Inter,
            ),
          ],
        ),
        if (isDivider)
          Divider(
            color: AppColors.greyColor,
            thickness: 1.2.w,
            height: 20.h,
          ),
      ],
    );
  }
}
