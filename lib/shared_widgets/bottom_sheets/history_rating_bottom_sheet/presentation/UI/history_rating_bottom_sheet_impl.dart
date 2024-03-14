import 'package:faciltateur_de_vies/routes/routes_provider/routes_provider.dart';
import 'package:faciltateur_de_vies/shared_widgets/bottom_sheets/history_rating_bottom_sheet/business_logic/rating_sheet_provider.dart';
import 'package:faciltateur_de_vies/shared_widgets/bottom_sheets/history_rating_bottom_sheet/data/model/rating_request_model.dart';
import 'package:faciltateur_de_vies/shared_widgets/bottom_sheets/rating_history_confirmation_bottom_sheet/rating_history_bottom_sheet.dart';
import 'package:faciltateur_de_vies/shared_widgets/custom_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../../../constants/colors/colors.dart';
import '../../../../../constants/icons/icons.dart';
import '../../../../../constants/text_styles/text_styles.dart';
import '../../../../custom_button_black.dart';
import '../../../../custom_input_text.dart';
import '../../../widgets/bottom_sheet_header.dart';

class HistoryRatingBottomSheetImp extends StatefulWidget {
  const HistoryRatingBottomSheetImp(
      {Key? key, required this.orderId, required this.serviceProductId})
      : super(key: key);

  final String orderId;
  final String serviceProductId;

  @override
  State<HistoryRatingBottomSheetImp> createState() =>
      _HistoryRatingBottomSheetImpState();
}

class _HistoryRatingBottomSheetImpState
    extends State<HistoryRatingBottomSheetImp> {
  final TextEditingController generalOptionController = TextEditingController();
  double efficencyRating = 1;
  double punctualityRating = 1;
  double presentaionRating = 1;

  @override
  void dispose() {
    generalOptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.r),
                  topRight: Radius.circular(20.r)),
              color: AppColors.whiteColor,
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  const BottomSheetHeader(),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    'Service Evaluation',
                    style: AppTextStyles.header3Inter,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  // bottom sheet 'True' To customize Ui
                  /* Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColors.greyColor),
                          borderRadius: BorderRadius.all(Radius.circular(1.r))),
                      child: HistoryEventListItem(
                        serviceHistory: serviceHistoryList[0],
                        bottomSheet: true,
                      )), */
                  SizedBox(
                    height: 20.h,
                  ),
                  ratingRow('Efficiency', (rating) {
                    efficencyRating = rating;
                  }),
                  ratingRow('Punctuality', (rating) {
                    punctualityRating = rating;
                  }),
                  ratingRow('Presentation', (rating) {
                    presentaionRating = rating;
                  }),
                  SizedBox(
                    width: double.infinity,
                    child: Text("General opinion",
                        textAlign: TextAlign.left,
                        style: AppTextStyles.robotoBoldBlack(14.sp)),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  CustomTextField(
                    controller: generalOptionController,
                    maxCharacters: 280,
                    hint: 'Type your review here',
                    prefix: SizedBox(width: 5.w),
                    fillColor: AppColors.greyColor,
                    hintStyle: AppTextStyles.robotoRegularGrey50
                        .copyWith(fontSize: 12.sp),
                    textType: TextInputType.multiline,
                    minLines: 8,
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  Consumer<RatingSheetProvider>(
                      builder: (context, provider, _) {
                    return CustomButtonBlack(
                        buttonContent: provider.isLoading
                            ? SizedBox(
                                height: 47.h,
                                child: const CustomProgressIndicator(
                                    color: AppColors.whiteColor),
                              )
                            : const Text('Send'),
                        onPressed: provider.isLoading
                            ? () {}
                            : () async {
                                String ratingResult =
                                    await provider.rateService(
                                        requestModel: RatingRequestModel(
                                            orderId: widget.orderId,
                                            serviceId: widget.serviceProductId,
                                            efficacite:
                                                efficencyRating.toString(),
                                            ponctualite:
                                                punctualityRating.toString(),
                                            presentation:
                                                presentaionRating.toString(),
                                            avisgeneral:
                                                generalOptionController.text,
                                            iseval: DateTime.now().toString()));
                                if (ratingResult.isNotEmpty) {
                                  RoutingProvider.goBack();
                                  // ignore: use_build_context_synchronously
                                  RatingHistoryBottomSheet
                                      .showRatingHistoryConfirmationBottomSheet(
                                          context);
                                }
                              });
                  }),
                  SizedBox(
                    height: 10.h,
                  )
                ],
              ),
            )),
      ),
    );
  }

  Widget ratingRow(String title, Function(double) onChange) {
    return Padding(
      padding: EdgeInsets.only(bottom: 35.h),
      child: Row(
        children: [
          Text(
            title,
            style: AppTextStyles.robotoBoldBlack(14.sp),
          ),
          const Spacer(),
          RatingBar(
            onRatingUpdate: (rating) {
              onChange(rating);
            },
            glowRadius: 50,
            itemPadding: EdgeInsetsDirectional.only(end: 5.w),
            ratingWidget: RatingWidget(
                full: SvgPicture.asset(
                  AppIcons.ratingStar,
                  height: 23.h,
                  width: 23.w,
                  fit: BoxFit.cover,
                ),
                half: SvgPicture.asset(
                  AppIcons.ratingStar,
                  height: 23.h,
                  width: 23.w,
                  fit: BoxFit.cover,
                ),
                empty: SvgPicture.asset(
                  AppIcons.ratingStar,
                  color: AppColors.greyColor,
                  height: 23.h,
                  width: 23.w,
                  fit: BoxFit.cover,
                )),
            maxRating: 4.0,
            initialRating: 1,
            minRating: 1,
            itemSize: 23.r,
            itemCount: 4,
            ignoreGestures: false,
          ),
        ],
      ),
    );
  }
}
