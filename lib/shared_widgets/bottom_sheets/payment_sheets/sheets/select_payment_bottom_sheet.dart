import 'package:faciltateur_de_vies/constants/enums/payment_types.dart';
import 'package:faciltateur_de_vies/constants/icons/icons.dart';
import 'package:faciltateur_de_vies/core/local_storage/storage_manager.dart';
import 'package:faciltateur_de_vies/routes/routes_provider/routes_provider.dart';
import 'package:faciltateur_de_vies/screens/payment_method_module/bussiness_logic/provider/payment_methods_provider.dart';
import 'package:faciltateur_de_vies/shared_widgets/bottom_sheets/payment_sheets/payment_sheets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../../constants/colors/colors.dart';
import '../../../../constants/text_styles/text_styles.dart';
import '../../../custom_radio_button.dart';
import '../../widgets/bottom_sheet_header.dart';

class SelectPaymentBottomSheet extends StatelessWidget {
  const SelectPaymentBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    PaymentMethodProvider paymentMethodProvider =
        Provider.of<PaymentMethodProvider>(context, listen: false);
    return Wrap(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.r),
                topRight: Radius.circular(20.r)),
            color: AppColors.whiteColor,
          ),
          child: Column(
            children: [
              SizedBox(
                height: 10.h,
              ),
              const BottomSheetHeader(),
              SizedBox(
                height: 30.h,
              ),
              Text(
                'Choose your payment method',
                style: AppTextStyles.header3Inter,
              ),
              SizedBox(
                height: 25.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 35.w, right: 35.w, bottom: 60.h),
                child: Column(
                  children: [
                    const Divider(),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        CustomRadioButton(
                            title: 'Visa',
                            value: 1,
                            groupValue: -1,
                            hasPadding: false,
                            selectedTextStyle: AppTextStyles.header3Inter,
                            unselectedTextStyle:
                                AppTextStyles.robotoRegularBlack(14.sp),
                            onChanged: (value) async {
                              /* BillingDetails billing = const BillingDetails(
                                email: null,
                                phone: null,
                                address: Address(
                                  city: null,
                                  country: null,
                                  line1: null,
                                  line2: null,
                                  state: null,
                                  postalCode: null,
                                ),
                              ); */
                              RoutingProvider.goBackWithResult(
                                  PaymentTypes.visa);
                              /*  await PaymentSheets.stripPaymentSheet(
                                  context: context,
                                  amount: 1,
                                  isRecurrent: false,
                                  currency: 'USD',
                                  billingDetail: billing);
                              Provider.of<PaymentMethodProvider>(context,
                                      listen: false)
                                  .success = false; */
                            }),
                        const Spacer(),
                        SvgPicture.asset(
                          AppIcons.visaIcon,
                          width: 30.w,
                          height: 20.h,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    const Divider(),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        CustomRadioButton(
                            title: 'Paypal',
                            value: 2,
                            groupValue: -1,
                            hasPadding: false,
                            selectedTextStyle: AppTextStyles.header3Inter,
                            unselectedTextStyle:
                                AppTextStyles.robotoRegularBlack(14.sp),
                            onChanged: (value) {
                              RoutingProvider.goBackWithResult(
                                  PaymentTypes.paypal);
                            }),
                        const Spacer(),
                        SvgPicture.asset(
                          AppIcons.paypalIcon,
                          width: 30.w,
                          height: 22.h,
                        ),
                      ],
                    ),
                    if (StorageManager.getUserUrssaf()!)
                      Column(
                        children: [
                          SizedBox(
                            height: 10.h,
                          ),
                          const Divider(),
                          SizedBox(
                            height: 10.h,
                          ),
                          Row(
                            children: [
                              CustomRadioButton(
                                  title: 'Urssaf',
                                  value: 3,
                                  groupValue: -1,
                                  hasPadding: false,
                                  selectedTextStyle: AppTextStyles.header3Inter,
                                  unselectedTextStyle:
                                      AppTextStyles.robotoRegularBlack(14.sp),
                                  onChanged: (value) {
                                    RoutingProvider.goBackWithResult(
                                        PaymentTypes.urssaf);
                                  }),
                              const Spacer(),
                              /* SvgPicture.asset(
                          AppIcons.paypalIcon,
                          width: 30.w,
                          height: 22.h,
                        ), */
                            ],
                          ),
                        ],
                      ),
                    SizedBox(
                      height: 10.h,
                    ),
                    /*  const Divider(),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        CustomRadioButton(
                            title: 'My points',
                            value: 3,
                            groupValue: 1,
                            hasPadding: false,
                            selectedTextStyle: AppTextStyles.header3Inter,
                            unselectedTextStyle:
                                AppTextStyles.robotoRegularBlack(14.sp),
                            onChanged: (value) {}),
                        const Spacer(),
                        Text(
                          '240pts',
                          style: AppTextStyles.robotoRegularBlack(14.sp),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    const Divider(),
                    SizedBox(
                      height: 10.h,
                    ),
                    CustomRadioButton(
                        title: 'URSSAF Immediate Advance Payment',
                        value: 4,
                        groupValue: 1,
                        hasPadding: false,
                        selectedTextStyle: AppTextStyles.header3Inter,
                        unselectedTextStyle:
                            AppTextStyles.robotoRegularBlack(14.sp),
                        onChanged: (value) {}),
                    SizedBox(
                      height: 10.h,
                    ),
                    const Divider(),
                    SizedBox(
                      height: 10.h,
                    ),
                    InkWell(
                      onTap: (() {
                        PaymentSheets.showAddCardBottomSheet(context);
                      }),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.add_circle_outline_rounded,
                            color: AppColors.blackColor,
                          ),
                          SizedBox(
                            width: 9.w,
                          ),
                          Text(
                            'Add payment card',
                            style: AppTextStyles.header3Inter,
                          )
                        ],
                      ),
                    ), */
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
