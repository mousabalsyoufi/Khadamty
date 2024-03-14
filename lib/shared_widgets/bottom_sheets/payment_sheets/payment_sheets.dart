import 'package:faciltateur_de_vies/shared_widgets/bottom_sheets/payment_sheets/sheets/add_payment_card_bottom_sheet.dart';
import 'package:faciltateur_de_vies/shared_widgets/bottom_sheets/payment_sheets/sheets/select_payment_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import '../../../constants/colors/colors.dart';
import '../../../screens/payment_method_module/presentaion/UI/stripe_payment_method.dart';

class PaymentSheets {
  static showPaymentMethodBottomSheet(BuildContext context) async {
    // show select payment method bottom sheet
    return await showModalBottomSheet(
        backgroundColor: AppColors.transparentColor,
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return const SelectPaymentBottomSheet();
        });
  }

  static void showAddCardBottomSheet(BuildContext context) {
    // show add payment card bottom sheet
    showModalBottomSheet(
        backgroundColor: AppColors.transparentColor,
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return AddPaymentCardBottomSheet();
        });
  }

  static stripPaymentSheet(
      {required BuildContext context,
      required double amount,
      double? amount2,
      bool multiplePayment = false,
      required BillingDetails billingDetail,
      String currency = 'USD',
      bool? isRecurrent = false,
      int? cancelAt}) async {
    return (await showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: AppColors.transparentColor,
        builder: (context) => StripePaymentScreen(
              amount: amount,
              currency: currency,
              billingDetails: billingDetail,
              isRecurrent: isRecurrent!,
              cancelAt: cancelAt,
              amount2: amount2,
              multiblePayment: multiplePayment,
            )));
  }
}
