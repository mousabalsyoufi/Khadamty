import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../../constants/colors/colors.dart';
import '../../../../constants/text_styles/text_styles.dart';
import '../../../../shared_widgets/bottom_sheets/payment_sheets/payment_sheets.dart';
import '../../../../shared_widgets/custom_back_button.dart';
import '../../../../shared_widgets/custom_black_button_with_leading_trailing.dart';


// TODO LATER This screen we need to link with the bottom sheet and other screen seniors .


/// @Mohamad
class UserBusinessServiceCheckoutScreen extends StatelessWidget {
  const UserBusinessServiceCheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyColor,
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(20.r),
        child: CustomButtonBlackWithLeadingTrailing(
          trailingText: "61.80\$",
          onPressed: () {
            // this arguments to detected if first scan or end one
          },
          buttonText: 'Pay',
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Row(
                  children: [
                    const CustomBackButton(),
                    SizedBox(
                      width: 17.w,
                    ),
                    SizedBox(
                      height: 10.h,
                      width: 216.w,
                      child: LinearPercentIndicator(
                        padding: EdgeInsets.zero,
                        animation: false,
                        lineHeight: 25.h,
                        animationDuration: 2500,
                        percent: 0.8,
                        backgroundColor: AppColors.whiteColor,
                        barRadius: Radius.circular(15.r),
                        progressColor: AppColors.greenColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25.h,
                ),
                Text("Order Summary",style: AppTextStyles.header3Inter,),
                SizedBox(
                  height: 10.h,
                ),
                _serviceDetailsCard(),
                SizedBox(
                  height: 15.h,
                ),
                _priceBox(),
                SizedBox(
                  height: 15.h,
                ),
                _paymentBox(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

//split widget to show payment container
  Widget _paymentBox(BuildContext context){
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Payment",style: AppTextStyles.header3Inter,),
            InkWell(
                onTap: (){
                  PaymentSheets.showPaymentMethodBottomSheet(context);
                },
                child: Text("Change",style: AppTextStyles.header4Inter,)),
          ],
        ),
        SizedBox(height: 15.h,),
        Container(
          width: 320.w,
          height: 70.h,
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.all(Radius.circular(5.r)),
          ),
          child: Padding(
            padding:  EdgeInsetsDirectional.only(start: 15.w,top: 15.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("SEPA Direct Debit",style: AppTextStyles.header4Inter,),
                SizedBox(height: 5.w,),
                Text("FR9610096000302233591472U69",style: AppTextStyles.header4InterGrey50,)
              ],
            ),
          ),
        )
      ],
    );
  }
  Widget _priceBox() {
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
              "Total Price",
              style: AppTextStyles.header4Inter,
            ),
            Text(
              "55.80€",
              style: AppTextStyles.robotoBoldBlack(16.sp),
            )
          ],
        ),
      ),
    );
  }

  Container _serviceDetailsCard() => Container(
        padding: EdgeInsets.all(20.r),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(5.r),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
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
                    'Offre A la maison',
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
                    'Tuesday 19th June 2022',
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
                    height: 5.h,
                  ),
                  Text(
                    '1 rue de Paris 34000 Montpellier',
                    style: AppTextStyles.robotoRegularBlack(12.sp),
                  ),
                ],
              ),
            ),
            // const Spacer(),
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
                        '19:30',
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
                        '2:00',
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
                        'VAT',
                        style: AppTextStyles.robotoRegularBlack(10.sp),
                      ),
                      Text(
                        '00€',
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

  Container _customerDetailsCard() => Container(
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
                const Spacer(),
                Text(
                  '06 45 84 12 00',
                  style: AppTextStyles.header4Inter,
                ),
              ],
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              'Corinne Dubois',
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
              '1 place Rondelet',
              style: AppTextStyles.robotoRegularBlack(12.sp),
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              '34000 Montpellier',
              style: AppTextStyles.robotoRegularBlack(12.sp),
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              '100 m²',
              style: AppTextStyles.robotoRegularBlack(12.sp),
            ),
          ],
        ),
      );
  Container _instructionsDetailsCard() => Container(
        padding: EdgeInsets.all(20.r),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(5.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Customer\'s instructions',
              style: AppTextStyles.header4Inter,
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              'Vous trouverez la clef sous le paillasson. Attention un chien se trouve dans la maison.',
              style: AppTextStyles.robotoRegularBlack(12.sp),
            ),
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
            Text(
              'Menage : entretien des surfaces et sols, entretien des sanitaires, nettoyage des vitres Garde d’animaux : nourrir les animaux, entretien, déplacement Aide aux taches quotidiennes : repas, aide a la mobilité, aide administrative',
              style: AppTextStyles.robotoRegularBlack(12.sp),
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
