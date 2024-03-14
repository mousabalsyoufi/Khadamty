import 'package:faciltateur_de_vies/constants/colors/colors.dart';
import 'package:faciltateur_de_vies/constants/icons/icons.dart';
import 'package:faciltateur_de_vies/constants/text_styles/text_styles.dart';
import 'package:faciltateur_de_vies/core/extensions/date_extensions.dart';
import 'package:faciltateur_de_vies/shared_widgets/custom_progress_indicator.dart';
import 'package:faciltateur_de_vies/shared_widgets/photos_view_dialog.dart';
import 'package:faciltateur_de_vies/shared_widgets/custom_appbar.dart';
import 'package:faciltateur_de_vies/shared_widgets/custom_expantion_tile.dart';
import 'package:faciltateur_de_vies/shared_widgets/custom_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:provider/provider.dart';

import '../../../../core/helpers/date_helper.dart';
import '../../business_logic/provider/easer_service_history_details_provider.dart';

class EaserServiceHistoryDetailsScreen extends StatefulWidget {
  const EaserServiceHistoryDetailsScreen({super.key, required this.serviceId});

  final String serviceId;

  @override
  State<EaserServiceHistoryDetailsScreen> createState() =>
      _EaserServiceHistoryDetailsScreenState();
}

class _EaserServiceHistoryDetailsScreenState
    extends State<EaserServiceHistoryDetailsScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<EaserServiceHistoryDetailsProvider>(context, listen: false)
          .getServiceHistoryDetails(id: widget.serviceId);
    });
    super.initState();
  }

  final Map ratings = {
    'Efficacity': 3.0,
    'Punctuality': 3.0,
    'Presentation': 3.0,
  };

  final List<String> images = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        'Service details',
      ),
      body: Consumer<EaserServiceHistoryDetailsProvider>(
          builder: (context, provider, _) {
        if (provider.isLoading) {
          return const CustomProgressIndicator(color: AppColors.blackColor);
        } else if (provider.serviceDetails != null) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(20.r),
              child: Column(
                children: [
                  _serviceDetailsCard(provider),
                  SizedBox(
                    height: 15.h,
                  ),
                  _customerDetailsAndRatingCard(provider),
                  SizedBox(
                    height: 15.h,
                  ),
                  if (provider.serviceDetails!.lines[0].orderArrayOptions!
                          .optionsAvisgeneral !=
                      null)
                    if (provider.serviceDetails!.lines[0].orderArrayOptions!
                        .optionsAvisgeneral!.isNotEmpty)
                      _ratingDetailsCard(context, provider),
                  SizedBox(
                    height: 15.h,
                  ),
                  /* InkWell(
                  onTap: () {
                    // argument is to determain if it's chat history
                    RoutingProvider.pushNamed(
                        routeName: Routes.sharedChatScreen, arguments: true);
                  },
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        AppIcons.easerChatIconActive,
                        color: AppColors.blackColor,
                        width: 15.r,
                        height: 15.r,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        'Open chat history',
                        style: AppTextStyles.robotoBoldBlack(12.sp),
                      ),
                    ],
                  ),
                ) */
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

  Widget _serviceDetailsCard(EaserServiceHistoryDetailsProvider provider) =>
      CustomExpansionTile(
        tilePadding: const EdgeInsets.all(0),
        title: Container(
          padding: EdgeInsetsDirectional.only(
              top: 20.h, start: 20.w, end: 20.w, bottom: 10.h),
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
                              'Start',
                              style: AppTextStyles.robotoRegularBlack(10.sp),
                            ),
                            Text(
                              DateHelper.dateFromTimeStamp(provider
                                      .serviceDetails!.lines[0].dateStart)
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
                  SizedBox(
                    height: 5.h,
                  ),
                  Icon(
                    Icons.keyboard_arrow_down_outlined,
                    color: AppColors.blackColor,
                    size: 15.r,
                  ),
                ],
              ),
            ],
          ),
        ),
        children: [
          Container(
              padding: EdgeInsetsDirectional.only(
                  top: 5.h, start: 20.w, end: 20.w, bottom: 20.h),
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(5.r)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(
                    height: 1.h,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
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
              ))
        ],
      );

  Container _customerDetailsAndRatingCard(
          EaserServiceHistoryDetailsProvider provider) =>
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
                  'Customer',
                  style: AppTextStyles.header4Inter,
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
              ],
            ),
            const Spacer(),
            if (provider.serviceDetails!.lines[0].orderArrayOptions!
                        .optionsEfficacite !=
                    null &&
                provider.serviceDetails!.lines[0].orderArrayOptions!
                        .optionsPonctualite !=
                    null &&
                provider.serviceDetails!.lines[0].orderArrayOptions!
                        .optionsPresentation !=
                    null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Rating',
                    style: AppTextStyles.header4Inter,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: ratings.keys
                        .map(
                          (ratingName) => Padding(
                            padding: EdgeInsets.only(bottom: 10.h),
                            child: Text(
                              ratingName,
                              style: AppTextStyles.robotoRegularBlack(12.sp),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
            if (provider.serviceDetails!.lines[0].orderArrayOptions!
                        .optionsEfficacite !=
                    null &&
                provider.serviceDetails!.lines[0].orderArrayOptions!
                        .optionsPonctualite !=
                    null &&
                provider.serviceDetails!.lines[0].orderArrayOptions!
                        .optionsPresentation !=
                    null)
              SizedBox(width: 15.w),
            if (provider.serviceDetails!.lines[0].orderArrayOptions!
                        .optionsEfficacite !=
                    null &&
                provider.serviceDetails!.lines[0].orderArrayOptions!
                        .optionsPonctualite !=
                    null &&
                provider.serviceDetails!.lines[0].orderArrayOptions!
                        .optionsPresentation !=
                    null)
              Padding(
                padding: EdgeInsets.only(top: 20.h),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 10.h),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            provider.serviceDetails!.lines[0].orderArrayOptions!
                                .optionsEfficacite!,
                            style: AppTextStyles.header4Inter,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          _ratingWidget(double.parse(provider.serviceDetails!
                              .lines[0].orderArrayOptions!.optionsEfficacite!)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10.h),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            provider.serviceDetails!.lines[0].orderArrayOptions!
                                .optionsPonctualite!,
                            style: AppTextStyles.header4Inter,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          _ratingWidget(double.parse(provider
                              .serviceDetails!
                              .lines[0]
                              .orderArrayOptions!
                              .optionsPonctualite!)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10.h),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            provider.serviceDetails!.lines[0].orderArrayOptions!
                                .optionsPresentation!,
                            style: AppTextStyles.header4Inter,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          _ratingWidget(double.parse(provider
                              .serviceDetails!
                              .lines[0]
                              .orderArrayOptions!
                              .optionsPresentation!)),
                        ],
                      ),
                    ),
                  ],
                ),
              )
          ],
        ),
      );

  Widget _ratingWidget(double rating) {
    return RatingBar(
      onRatingUpdate: (rating) {},
      itemPadding: EdgeInsetsDirectional.only(end: 5.w),
      ratingWidget: RatingWidget(
          full: SvgPicture.asset(AppIcons.ratingStar),
          half: SvgPicture.asset(AppIcons.ratingStar),
          empty: SvgPicture.asset(
            AppIcons.ratingStar,
            color: AppColors.greyColor,
          )),
      maxRating: 4.0,
      initialRating: rating,
      itemSize: 10.0.r,
      itemCount: 4,
      ignoreGestures: true,
    );
  }

  Container _ratingDetailsCard(
          BuildContext context, EaserServiceHistoryDetailsProvider provider) =>
      Container(
        width: double.infinity,
        padding: EdgeInsets.all(20.r),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(5.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Customer rating',
              style: AppTextStyles.header4Inter,
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              provider.serviceDetails!.lines[0].orderArrayOptions!
                  .optionsAvisgeneral!,
              style: AppTextStyles.robotoRegularBlack(12.sp),
            ),
            /*  SizedBox(
              height: 20.h,
            ),
            Text(
              'Final debriefing',
              style: AppTextStyles.header4Inter,
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              'Everything went well',
              style: AppTextStyles.robotoRegularBlack(12.sp),
            ), */
            SizedBox(
              height: 20.h,
            ),
            /* Row(
              mainAxisAlignment: images.length > 2
                  ? MainAxisAlignment.spaceBetween
                  : MainAxisAlignment.start,
              children: images
                  .map((image) => Padding(
                        padding: EdgeInsetsDirectional.only(
                            end: images.length > 2 ? 0.0 : 15.w),
                        child: GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) => PhotosViewDialog(
                                  photos: images,
                                  currentIndex: images.indexOf(image)),
                            );
                          },
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(5.r),
                              child: CustomNetworkImage(
                                imageUrl: image,
                                width: 85.r,
                                height: 85.r,
                                fit: BoxFit.cover,
                              )),
                        ),
                      ))
                  .toList(),
            ) */
          ],
        ),
      );
}
