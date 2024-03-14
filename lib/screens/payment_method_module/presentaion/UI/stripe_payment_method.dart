import 'dart:io';

import 'package:faciltateur_de_vies/routes/routes_provider/routes_provider.dart';
import 'package:faciltateur_de_vies/screens/payment_method_module/bussiness_logic/provider/payment_methods_provider.dart';
import 'package:faciltateur_de_vies/screens/payment_method_module/data/models/stripe_recurrent_model.dart';
import 'package:faciltateur_de_vies/screens/payment_method_module/data/models/stripe_response_model.dart';
import 'package:faciltateur_de_vies/screens/payment_method_module/data/models/stripe_request_model.dart';
import 'package:faciltateur_de_vies/screens/payment_method_module/presentaion/widgets/stripe_loading_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import 'package:provider/provider.dart';
import '../../../../constants/colors/colors.dart';
import '../../../../shared_widgets/bottom_sheets/widgets/bottom_sheet_header.dart';

class StripePaymentScreen extends StatefulWidget {
  final double amount;
  final double? amount2;
  final String currency;
  final BillingDetails billingDetails;
  final bool isRecurrent;
  final bool multiblePayment;
  final int? cancelAt;
  const StripePaymentScreen(
      {Key? key,
      this.cancelAt,
      this.isRecurrent = false,
      this.multiblePayment = false,
      required this.currency,
      required this.amount,
      this.amount2,
      required this.billingDetails})
      : super(key: key);

  @override
  StripePaymentScreenState createState() => StripePaymentScreenState();
}

class StripePaymentScreenState extends State<StripePaymentScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // init card controller
  // final controller = CardEditController();
  final controller = CardFormEditController();

  // declaration  the provider of payment
  late PaymentMethodProvider provider;

  // declaration  the two models one for confirm result and another one for create the payment
  StripeResponseModel? confirmResponseModel;
  StripeResponseModel? createResponseModel;

  // init the state [ Provider Payment method , controller listener ]
  @override
  void initState() {
    provider = Provider.of<PaymentMethodProvider>(context, listen: false);
    controller.addListener(update);
    super.initState();
  }

  // update the state of this widget
  void update() => setState(() {});

  // dispose the listener and remove it
  @override
  void dispose() {
    controller.removeListener(update);
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.r),
                topRight: Radius.circular(20.r)),
            color: AppColors.whiteColor,
          ),
          child: Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 10.h),
              child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10.h,
                        ),
                        const BottomSheetHeader(),
                        SizedBox(
                          height: 20.h,
                        ),
                        CardFormField(
                          controller: controller,
                          countryCode: 'FR',
                          enablePostalCode: false,
                          style: CardFormStyle(
                            borderRadius: 0,
                            borderColor: Colors.transparent,
                            backgroundColor: SchedulerBinding
                                            .instance
                                            .platformDispatcher
                                            .platformBrightness ==
                                        Brightness.dark
                                ? Colors.black
                                : Colors.transparent,
                            textColor: Colors.black,
                            fontSize: 18,
                            borderWidth: 0,
                            placeholderColor: Colors.blueGrey,
                          ),
                        ),
                        LoadingButton(
                          text: 'Pay',
                          onPressed: controller.details.complete
                              ? _handlePayPressTrigger
                              : null,
                        ),
                        SizedBox(
                          height: 70.h,
                        )
                      ],
                    ),
                  )),
            ),
          ),
        )
      ],
    );
  }

  // This function to handle the Logic of payment
  /*
     1- filling billing info as step [1]
     2- create payment method as step [2]
     3- call API to create paymentIntent as step [3]
     4- then if needed to confirmation or not depended on the status of payment
   */
  Future<void> _handlePayPressTrigger() async {
    bool success = false;
    if (!controller.details.complete) return;

    // 1. set customer billing information (ex. email)
    BillingDetails billingDetails =
        widget.billingDetails; // mocked data for tests

    // set stripe request information (ex : amount , currency )
    StripeRequestModel stripeRequestModel = StripeRequestModel(
        amount: widget.amount, currency: widget.currency, useStripeSdk: true);
    StripeRequestRecurrentModel stripeRequestRecurrentModel =
        StripeRequestRecurrentModel(
            price: widget.amount,
            intervalCount: 1,
            cancelAt: widget.cancelAt,
            email: billingDetails.email);
    // call trigger to payment flow
    if (widget.isRecurrent) {
      if (widget.multiblePayment) {
        StripeRequestModel stripeRequestModelSubscribton = StripeRequestModel(
            amount: widget.amount2,
            currency: widget.currency,
            useStripeSdk: true);
        success = await provider.triggerOneTimePayment(
            billingDetails: billingDetails,
            stripeRequestModel: stripeRequestModelSubscribton);
        success = await provider.triggerRecurrentPayment(
            billingDetails: billingDetails,
            stripeRequestRecurrentModel: stripeRequestRecurrentModel);
      } else {
        success = await provider.triggerRecurrentPayment(
            billingDetails: billingDetails,
            stripeRequestRecurrentModel: stripeRequestRecurrentModel);
      }
      RoutingProvider.goBack();
    } else {
      success = await provider.triggerOneTimePayment(
          billingDetails: billingDetails,
          stripeRequestModel: stripeRequestModel);
      RoutingProvider.goBack();
    }
  }
}
