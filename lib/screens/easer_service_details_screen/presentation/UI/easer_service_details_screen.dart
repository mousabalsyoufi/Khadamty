import 'package:faciltateur_de_vies/constants/colors/colors.dart';
import 'package:faciltateur_de_vies/constants/icons/icons.dart';
import 'package:faciltateur_de_vies/constants/text_styles/text_styles.dart';
import 'package:faciltateur_de_vies/core/extensions/date_extensions.dart';
import 'package:faciltateur_de_vies/core/utility/utility.dart';
import 'package:faciltateur_de_vies/routes/routes_names/routes_names.dart';
import 'package:faciltateur_de_vies/routes/routes_provider/routes_provider.dart';
import 'package:faciltateur_de_vies/screens/easer_service_details_screen/business_logic/provider/easer_service_details_provider.dart';
import 'package:faciltateur_de_vies/shared_widgets/custom_appbar.dart';
import 'package:faciltateur_de_vies/shared_widgets/custom_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:provider/provider.dart';

import '../../../../core/helpers/date_helper.dart';

class EaserServiceDetailsScreen extends StatefulWidget {
  const EaserServiceDetailsScreen({super.key, required this.serviceId});

  final String serviceId;

  @override
  State<EaserServiceDetailsScreen> createState() =>
      _EaserServiceDetailsScreenState();
}

class _EaserServiceDetailsScreenState extends State<EaserServiceDetailsScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<EaserServiceDetailsProvider>(context, listen: false)
          .getServiceDetails(id: widget.serviceId);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<EaserServiceDetailsProvider>(
        builder: (context, provider, _) {
      if (provider.isLoading) {
        return const Scaffold(
          body: CustomProgressIndicator(color: AppColors.blackColor),
        );
      } else if (provider.serviceDetails != null) {
        return Scaffold(
          appBar: customAppBar('Service details', actions: [
            GestureDetector(
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
            Padding(
              padding: EdgeInsetsDirectional.only(start: 10.w, end: 20.w),
              child: GestureDetector(
                onTap: () {
                  Utility.launchDirectionMap(
                      double.parse(
                          provider.serviceDetails!.contact!.arrayOptions.lat),
                      double.parse(
                          provider.serviceDetails!.contact!.arrayOptions.long));
                },
                child: SvgPicture.asset(
                  AppIcons.locationInServiceIcon,
                  width: 35.r,
                  height: 35.r,
                ),
              ),
            ),
          ]),
          /* bottomNavigationBar: Padding(
            padding: EdgeInsets.all(20.r),
            child: CustomButtonBlack(
              onPressed: () {
                // this arguments to detected if first scan or end one
                RoutingProvider.pushNamed(
                    routeName: Routes.easerQrScanScreen, arguments: true);
              },
              buttonContent: const Text("Start"),
            ),
          ), */
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(20.r),
              child: Column(
                children: [
                  _serviceDetailsCard(provider),
                  SizedBox(
                    height: 15.h,
                  ),
                  _customerDetailsCard(provider),
                  SizedBox(
                    height: 15.h,
                  ),
                  _instructionsDetailsCard(provider),
                ],
              ),
            ),
          ),
        );
      } else {
        return Scaffold(
          body: Container(),
        );
      }
    });
  }

  Container _serviceDetailsCard(EaserServiceDetailsProvider provider) =>
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
                  provider.serviceDetails!.lines[0].productLabel,
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
                          provider.serviceDetails!.lines[0].dateStart)
                      .toLocal()
                      .doMMMyyyy(),
                  style: AppTextStyles.robotoRegularBlack(12.sp),
                ),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Start',
                        style: AppTextStyles.robotoRegularBlack(10.sp),
                      ),
                      Text(
                        DateHelper.dateFromTimeStamp(
                                provider.serviceDetails!.lines[0].dateStart)
                            .toLocal()
                            .hhmm(),
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
                        '${((provider.serviceDetails!.lines[0].dateEnd - provider.serviceDetails!.lines[0].dateStart) / 3600).toString().substring(0, 1)}:00',
                        style: AppTextStyles.header4Inter,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      );

  Container _customerDetailsCard(EaserServiceDetailsProvider provider) =>
      Container(
        padding: EdgeInsets.all(20.r),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(5.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Customer',
                  style: AppTextStyles.header4Inter,
                ),
                /* const Spacer(),
                Text(
                  '06 45 84 12 00',
                  style: AppTextStyles.header4Inter,
                ), */
              ],
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              provider.serviceDetails!.contact!.lastname,
              style: AppTextStyles.robotoRegularBlack(12.sp),
            ),
            SizedBox(
              height: 15.h,
            ),
            Text(
              'Address',
              style: AppTextStyles.header4Inter,
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              provider.serviceDetails!.contact!.address,
              style: AppTextStyles.robotoRegularBlack(12.sp),
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              '${provider.serviceDetails!.contact!.zip} ${provider.serviceDetails!.contact!.town}',
              style: AppTextStyles.robotoRegularBlack(12.sp),
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              '${provider.serviceDetails!.contact!.arrayOptions.surface} m2',
              style: AppTextStyles.robotoRegularBlack(12.sp),
            ),
          ],
        ),
      );

  Container _instructionsDetailsCard(EaserServiceDetailsProvider provider) =>
      Container(
        padding: EdgeInsets.all(20.r),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(5.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (provider.serviceDetails!.instructions != null &&
                provider.serviceDetails!.instructions!.isNotEmpty)
              Text(
                'Customer\'s instructions',
                style: AppTextStyles.header4Inter,
              ),
            if (provider.serviceDetails!.instructions != null &&
                provider.serviceDetails!.instructions!.isNotEmpty)
              SizedBox(
                height: 5.h,
              ),
            if (provider.serviceDetails!.instructions != null &&
                provider.serviceDetails!.instructions!.isNotEmpty)
              Text(
                provider.serviceDetails!.instructions!,
                style: AppTextStyles.robotoRegularBlack(12.sp),
              ),
            if (provider.serviceDetails!.instructions != null &&
                provider.serviceDetails!.instructions!.isNotEmpty)
              SizedBox(
                height: 20.h,
              ),
            Text(
              'Service details',
              style: AppTextStyles.header4Inter,
            ),
            SizedBox(
              height: 5.h,
            ),
            Column(
              children: provider.serviceDetails!.lines
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
              'Agency instructions',
              style: AppTextStyles.header4Inter,
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              'Vous trouverez la clef sous le paillasson. Attention un chien se trouve dans la maison.',
              style: AppTextStyles.robotoRegularBlack(12.sp),
            ),
          ],
        ),
      );
}
