import 'package:faciltateur_de_vies/constants/text_styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../constants/colors/colors.dart';
import '../../../../constants/icons/icons.dart';
import '../../../../shared_widgets/bottom_sheets/history_rating_bottom_sheet/presentation/UI/history_rating_sheet.dart';
import '../../../../shared_widgets/custom_back_button.dart';

class UserServiceHistoryDetailsHeaderWidget extends StatelessWidget {
  UserServiceHistoryDetailsHeaderWidget({Key? key, required this.isRated, required this.orderId, required this.serviceId})
      : super(key: key);

  bool isRated;
  final String orderId;
  final String serviceId;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 40.h,
        ),
        Row(
          children: [
            const CustomBackButton(),
            SizedBox(
              width: 17.w,
            ),
            Text(
              "Services details",
              style: AppTextStyles.header4Inter,
            ),
            const Spacer(),
            isRated
                ? Container(
                    width: 117.w,
                    height: 34.h,
                    decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(18.r)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Row(
                        children: [
                          RatingBar(
                            onRatingUpdate: (rating) {},
                            glowRadius: 50,
                            itemPadding: EdgeInsetsDirectional.only(end: 5.w),
                            ratingWidget: RatingWidget(
                                full: SvgPicture.asset(
                                  AppIcons.ratingStar,
                                  height: 20.h,
                                  width: 20.w,
                                  fit: BoxFit.cover,
                                ),
                                half: SvgPicture.asset(
                                  AppIcons.ratingStar,
                                  height: 20.h,
                                  width: 20.w,
                                  fit: BoxFit.cover,
                                ),
                                empty: SvgPicture.asset(
                                  AppIcons.ratingStar,
                                  color: AppColors.greyColor,
                                  height: 13.h,
                                  width: 13.w,
                                  fit: BoxFit.cover,
                                )),
                            maxRating: 4.0,
                            initialRating: 3,
                            itemSize: 14.0.r,
                            itemCount: 4,
                            ignoreGestures: true,
                          ),
                          Text("4.0", style: AppTextStyles.header4Inter)
                        ],
                      ),
                    ),
                  )
                : InkWell(
                    onTap: () {
                      HistoryRatingBottomSheet.showHistoryRatingBottom(
                          context, orderId, serviceId);
                    },
                    child: Container(
                      height: 34.h,
                      width: 52.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(18.r)),
                        color: AppColors.whiteColor,
                      ),
                      child: Center(
                        child: Text(
                          "Rate",
                          style: AppTextStyles.paragraphRobotoMedium,
                        ),
                      ),
                    ),
                  ),
          ],
        ),
      ],
    );
  }
}
