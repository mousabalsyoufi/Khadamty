import 'package:faciltateur_de_vies/core/extensions/date_extensions.dart';
import 'package:faciltateur_de_vies/core/utility/utility.dart';
import 'package:faciltateur_de_vies/screens/user_offer_subscriber_screen/business_logic/provider/user_offer_subscriber_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../../constants/colors/colors.dart';
import '../../../../constants/text_styles/text_styles.dart';
import '../../../../shared_widgets/bottom_sheets/payment_sheets/payment_sheets.dart';

class UserOfferServiceDetailsScreen extends StatelessWidget {
  const UserOfferServiceDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<UserOfferSubscriberProvider>(
        builder: (context, userOfferSubscriberProvider, child) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Récapitulatif de votre service",
            style: AppTextStyles.header3Inter,
          ),
          SizedBox(
            height: 10.h,
          ),
          _detailsBox(userOfferSubscriberProvider),
          SizedBox(
            height: 15.h,
          ),
          _priceBox(userOfferSubscriberProvider),
          SizedBox(
            height: 10.h,
          ),
          Text(
            "*Tarifs indicatifs avant déductions fiscales (50%).",
            style: AppTextStyles.robotoRegularGrey50,
          ),
          SizedBox(
            height: 20.h,
          ),
          // _paymentBox(context),
        ],
      );
    });
  }

  //split widget to show payment container
  Widget _paymentBox(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Payment",
              style: AppTextStyles.header3Inter,
            ),
            InkWell(
                onTap: () {
                  PaymentSheets.showPaymentMethodBottomSheet(context);
                },
                child: Text(
                  "Change",
                  style: AppTextStyles.header4Inter,
                )),
          ],
        ),
        SizedBox(
          height: 15.h,
        ),
        Container(
          width: 320.w,
          height: 45.h,
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.all(Radius.circular(5.r)),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.only(start: 15.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.payment_outlined,
                  size: 20.r,
                ),
                SizedBox(
                  width: 15.w,
                ),
                Text(
                  "Visa ****** 0000",
                  style: AppTextStyles.header4Inter,
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  //split widget to show service details container
  Widget _detailsBox(UserOfferSubscriberProvider provider) {
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
                  key: 'Offer services',
                  value: provider.offer.label,
                  isSpace: false),
              _tableDetailsLeftSide(
                  key: 'Date',
                  value:
                      '${provider.repeatDays[0].doMMMyyyy()} ${provider.serviceTimeSlot}'),
              _tableDetailsLeftSide(
                  key: 'Address', value: '${provider.offerAddress!.address} ${provider.offerAddress!.zip} ${provider.offerAddress!.town}'),
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
                    key: 'Price/h',
                    value: '${Utility.getPriceSubString(provider.offer.priceIcludesTax)}€'),
                _tableDetailsRightSide(
                    key: 'Duration', value: '${provider.serviceDuration}:00'),
                _tableDetailsRightSide(
                    key: 'Rec',
                    value:
                        '${provider.repeatTimes}x/${provider.repeatWeeks}week'),
                // The  'isDivider' to not add any divider after last item
                _tableDetailsRightSide(
                    key: 'VAT',
                    value:
                        '${((double.parse(Utility.getPriceSubString(provider.offer.priceIcludesTax)) * 20 ) / 100)}€',
                    isDivider: false),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // left side table information
  Widget _tableDetailsLeftSide(
      {required String key, required String value, bool isSpace = true}) {
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
        SizedBox(
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

  //split widget to show price container
  Widget _priceBox(UserOfferSubscriberProvider provider) {
    return Container(
      height: 40.h,
      width: 320.w,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(5.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Prix total TTC",
              style: AppTextStyles.header4Inter,
            ),
            Text(
              "${provider.getOfferPaymentPrice()}€",
              style: AppTextStyles.robotoBoldBlack(16.sp),
            )
          ],
        ),
      ),
    );
  }
}
