import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/constants/consts/consts.dart';
import 'package:faciltateur_de_vies/constants/enums/app_subscribtions.dart';
import 'package:faciltateur_de_vies/constants/enums/payment_types.dart';
import 'package:faciltateur_de_vies/constants/enums/service_frequency.dart';
import 'package:faciltateur_de_vies/core/api_handler/urls.dart';
import 'package:faciltateur_de_vies/core/local_storage/storage_manager.dart';
import 'package:faciltateur_de_vies/core/extensions/date_extensions.dart';
import 'package:faciltateur_de_vies/screens/payment_method_module/bussiness_logic/provider/payment_methods_provider.dart';
import 'package:faciltateur_de_vies/screens/payment_method_module/data/models/paypal_request_payment_model.dart';
import 'package:faciltateur_de_vies/screens/payment_method_module/data/models/paypal_recurrent_request_model.dart';
import 'package:faciltateur_de_vies/screens/user_subscribe_to_service_process/data/model/service_subscribe_request_model.dart';
import 'package:faciltateur_de_vies/shared_models/task_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../../constants/colors/colors.dart';
import '../../../../constants/enums/user_type.dart';
import '../../../../constants/icons/icons.dart';
import '../../../../constants/text_styles/text_styles.dart';
import '../../../../routes/routes_names/routes_names.dart';
import '../../../../routes/routes_provider/routes_provider.dart';
import '../../../../shared_widgets/bottom_sheets/payment_sheets/payment_sheets.dart';
import '../../../../shared_widgets/bottom_sheets/reservation_confirmation_bottom_sheets/reservation_confirmation_bottom_sheet.dart';
import '../../../../shared_widgets/custom_black_button_with_leading_trailing.dart';
import '../../../../shared_widgets/custom_progress_indicator.dart';
import '../../business_logic/provider/user_service_subscribe_process_provider.dart';
import '../widgets/service_subscribe_process_screen_header.dart';

class UserServiceProcessSharedServiceCheckoutScreen extends StatelessWidget {
  UserServiceProcessSharedServiceCheckoutScreen({Key? key}) : super(key: key);
  bool isSuccessfully = false;
  @override
  Widget build(BuildContext context) {
    return Consumer<UserServiceSubscribeProcessProvider>(
        builder: (context, subscribeServiceProvider, child) {
      return SafeArea(
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    const ServiceSubscribeProcessScreenHeader(percent: 0.85),
                    const Spacer(),
                    if (subscribeServiceProvider.serviceFrequency ==
                        ServiceFrequency.recurrent)
                      SvgPicture.asset(
                        AppIcons.refreshIcon,
                        height: 20.r,
                        width: 20.r,
                        fit: BoxFit.cover,
                      ),
                  ],
                ),
                SizedBox(
                  height: 25.h,
                ),
                _detailsBox(subscribeServiceProvider),
                SizedBox(
                  height: 15.h,
                ),
                _priceBox(subscribeServiceProvider),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  "*Indicative rates before tax deductions (50%).",
                  style: AppTextStyles.robotoRegularGrey50,
                ),
                SizedBox(
                  height: 20.h,
                ),
                //_paymentBox(context),
                const Spacer(),
                subscribeServiceProvider.isLoading
                    ? Container(
                        height: 47.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.r),
                            color: AppColors.blackColor),
                        child: const CustomProgressIndicator(
                          color: AppColors.whiteColor,
                        ),
                      )
                    : CustomButtonBlackWithLeadingTrailing(
                        buttonText: "Payer",
                        onPressed: () async {
                          BillingDetails billing = BillingDetails(
                            email: StorageManager.getEmail(),
                            phone: null,
                            address: const Address(
                              city: null,
                              country: null,
                              line1: null,
                              line2: null,
                              state: null,
                              postalCode: null,
                            ),
                          );

                          String tasksIds = '';
                          String tasksLabels = '';
                          List<TaskModel> tasks = subscribeServiceProvider
                              .serviceTasks
                              .where((element) => element.isSelected)
                              .toList();
                          for (var i = 0; i < tasks.length; i++) {
                            if (i != tasks.length - 1) {
                              tasksIds += '${tasks[i].id}/';
                              tasksLabels += '${tasks[i].label},';
                            } else {
                              tasksIds += tasks[i].id;
                              tasksLabels += tasks[i].label;
                            }
                          }

                          List<LineProduct> lines = [];
                          if (subscribeServiceProvider.serviceFrequency ==
                              ServiceFrequency.oneTime) {
                            DateTime startDate = subscribeServiceProvider
                                .oneTimeServiceSelectedDay!
                                .add(Duration(
                                    hours: int.parse(subscribeServiceProvider
                                        .oneTimeServiceTimeSlot!
                                        .split(':')[0]),
                                    minutes: int.parse(subscribeServiceProvider
                                        .oneTimeServiceTimeSlot!
                                        .split(':')[1])))
                                .toLocal();
                            DateTime endDate = subscribeServiceProvider
                                .oneTimeServiceSelectedDay!
                                .add(Duration(
                                    hours: int.parse(subscribeServiceProvider
                                            .oneTimeServiceTimeSlot!
                                            .split(':')[0]) +
                                        int.parse(subscribeServiceProvider
                                            .oneTimeerviceDuration!
                                            .substring(0, 1)),
                                    minutes: int.parse(
                                        subscribeServiceProvider.oneTimeServiceTimeSlot!.split(':')[1])))
                                .toLocal();
                            lines.add(LineProduct(
                                productId: subscribeServiceProvider
                                    .serviceDetailsModel.product.id,
                                qty: '1',
                                tvaTx: '20.00',
                                subprice: subscribeServiceProvider
                                    .getServicePrice()
                                    .toString(),
                                dateStart: startDate
                                    .add(Duration(
                                        hours:
                                            -startDate.timeZoneOffset.inHours))
                                    .millisecondsSinceEpoch
                                    .toString()
                                    .substring(0, 10),
                                dateEnd: endDate
                                    .add(Duration(
                                        hours: -endDate.timeZoneOffset.inHours))
                                    .millisecondsSinceEpoch
                                    .toString()
                                    .substring(0, 10),
                                desc: tasksLabels,
                                arrayOptions: tasksIds));
                          } else {
                            for (var repeatWeekIndex = 0;
                                repeatWeekIndex <
                                    subscribeServiceProvider.repeatWeeks;
                                repeatWeekIndex++) {
                              for (var repeatTimesIndex = 0;
                                  repeatTimesIndex <
                                      subscribeServiceProvider.repeatTimes;
                                  repeatTimesIndex++) {
                                DateTime startDate = subscribeServiceProvider
                                    .repeatDays[repeatTimesIndex]
                                    .add(Duration(
                                        days: repeatWeekIndex * 7,
                                        hours: int.parse(
                                            subscribeServiceProvider
                                                .oneTimeServiceTimeSlot!
                                                .split(':')[0]),
                                        minutes: int.parse(
                                            subscribeServiceProvider
                                                .oneTimeServiceTimeSlot!
                                                .split(':')[1])))
                                    .toLocal();
                                DateTime endDate = subscribeServiceProvider
                                    .repeatDays[repeatTimesIndex]
                                    .add(Duration(
                                        days: repeatWeekIndex * 7,
                                        hours: int.parse(subscribeServiceProvider
                                                .oneTimeServiceTimeSlot!
                                                .split(':')[0]) +
                                            int.parse(subscribeServiceProvider
                                                .oneTimeerviceDuration!
                                                .substring(0, 1)),
                                        minutes: int.parse(
                                            subscribeServiceProvider.oneTimeServiceTimeSlot!.split(':')[1])))
                                    .toLocal();
                                lines.add(LineProduct(
                                    productId: subscribeServiceProvider
                                        .serviceDetailsModel.product.id,
                                    qty: '1',
                                    tvaTx: '20.00',
                                    subprice: subscribeServiceProvider
                                        .getServicePrice()
                                        .toString(),
                                    dateStart: startDate
                                        .add(Duration(
                                            hours: -startDate
                                                .timeZoneOffset.inHours))
                                        .millisecondsSinceEpoch
                                        .toString()
                                        .substring(0, 10),
                                    dateEnd: endDate
                                        .add(Duration(
                                            hours: -endDate
                                                .timeZoneOffset.inHours))
                                        .millisecondsSinceEpoch
                                        .toString()
                                        .substring(0, 10),
                                    desc: tasksLabels,
                                    arrayOptions: tasksIds));
                              }
                            }
                          }

                          DateTime startDate = subscribeServiceProvider
                                      .serviceFrequency ==
                                  ServiceFrequency.oneTime
                              ? subscribeServiceProvider
                                  .oneTimeServiceSelectedDay!
                              : subscribeServiceProvider.repeatDays[0]
                                  .add(Duration(
                                      hours: int.parse(subscribeServiceProvider
                                          .oneTimeServiceTimeSlot!
                                          .split(':')[0]),
                                      minutes: int.parse(
                                          subscribeServiceProvider
                                              .oneTimeServiceTimeSlot!
                                              .split(':')[1])))
                                  .toLocal();

                          String paymentDate =
                              DateTime.fromMillisecondsSinceEpoch(int.parse(
                                      "${lines[lines.length - 1].dateEnd}000"))
                                  .add(const Duration(days: 6))
                                  .millisecondsSinceEpoch
                                  .toString()
                                  .substring(0, 10);
                          PaymentTypes? paymentType =
                              await PaymentSheets.showPaymentMethodBottomSheet(
                                  context);
                          if (paymentType == null) {
                            return -1;
                          }
                          switch (paymentType) {
                            case PaymentTypes.visa:
                              if (subscribeServiceProvider.serviceFrequency ==
                                  ServiceFrequency.recurrent) {
                                if (subscribeServiceProvider.appSubscribtion !=
                                    null) {
                                  await PaymentSheets.stripPaymentSheet(
                                      context: context,
                                      isRecurrent: true,
                                      amount2: subscribeServiceProvider
                                                  .appSubscribtion ==
                                              AppSubscribtion.initial
                                          ? 5.00
                                          : 10.00,
                                      multiplePayment: true,
                                      cancelAt: int.parse(paymentDate),
                                      amount: subscribeServiceProvider
                                              .getServicePrice() -
                                          (subscribeServiceProvider
                                                      .appSubscribtion ==
                                                  AppSubscribtion.initial
                                              ? 5.00
                                              : 10.00),
                                      currency: Consts.euro,
                                      billingDetail: billing);
                                } else {
                                  await PaymentSheets.stripPaymentSheet(
                                      context: context,
                                      isRecurrent: true,
                                      cancelAt: int.parse(paymentDate),
                                      amount: subscribeServiceProvider
                                          .getServicePrice(),
                                      currency: Consts.euro,
                                      billingDetail: billing);
                                }
                              } else {
                                await PaymentSheets.stripPaymentSheet(
                                    context: context,
                                    isRecurrent: false,
                                    amount: subscribeServiceProvider
                                        .getServicePrice(),
                                    currency: Consts.euro,
                                    billingDetail: billing);
                              }
                              break;
                            case PaymentTypes.paypal:
                              if ((subscribeServiceProvider.serviceFrequency ==
                                          ServiceFrequency.recurrent &&
                                      lines.length > 1) ||
                                  (subscribeServiceProvider.serviceFrequency ==
                                          ServiceFrequency.recurrent &&
                                      subscribeServiceProvider
                                              .appSubscribtion !=
                                          null)) {
                                if (subscribeServiceProvider.appSubscribtion !=
                                    null) {
                                  isSuccessfully =
                                      await RoutingProvider.pushNamed(
                                          routeName: Routes.paypal,
                                          arguments: {
                                        "payPalRecurrentRequestModel": null,
                                        "payPalRequestModel": PayPalRequestModel(
                                            amountValue:
                                                subscribeServiceProvider
                                                            .appSubscribtion ==
                                                        AppSubscribtion.initial
                                                    ? '5.00'
                                                    : '10.00',
                                            note: '',
                                            url: Urls.createPayPal,
                                            amountCurrency: Consts.euro)
                                      });
                                  isSuccessfully =
                                      await RoutingProvider.pushNamed(
                                          routeName: Routes.paypal,
                                          arguments: {
                                        "payPalRequestModel": null,
                                        'payPalRecurrentRequestModel':
                                            PayPalRecurrentRequestModel(
                                                amount: (subscribeServiceProvider
                                                            .getServicePrice() -
                                                        (subscribeServiceProvider
                                                                    .appSubscribtion ==
                                                                AppSubscribtion
                                                                    .initial
                                                            ? 5.00
                                                            : 10.00))
                                                    .toString(),
                                                cycle: subscribeServiceProvider
                                                    .repeatWeeks
                                                    .toString(),
                                                url: Urls
                                                    .createPaypalSubscription,
                                                currency: Consts.euro)
                                      });
                                } else {
                                  isSuccessfully =
                                      await RoutingProvider.pushNamed(
                                          routeName: Routes.paypal,
                                          arguments: {
                                        "payPalRequestModel": null,
                                        'payPalRecurrentRequestModel':
                                            PayPalRecurrentRequestModel(
                                                amount: subscribeServiceProvider
                                                    .getServicePrice()
                                                    .toString(),
                                                cycle: subscribeServiceProvider
                                                    .repeatWeeks
                                                    .toString(),
                                                url: Urls
                                                    .createPaypalSubscription,
                                                currency: Consts.euro)
                                      });
                                }
                              } else {
                                isSuccessfully =
                                    await RoutingProvider.pushNamed(
                                        routeName: Routes.paypal,
                                        arguments: {
                                      "payPalRecurrentRequestModel": null,
                                      "payPalRequestModel": PayPalRequestModel(
                                          amountValue: subscribeServiceProvider
                                              .getServicePrice()
                                              .toString(),
                                          note: '',
                                          url: Urls.createPayPal,
                                          amountCurrency: Consts.euro)
                                    });
                              }
                              break;
                            case PaymentTypes.urssaf:
                              isSuccessfully = true;
                              break;
                            default:
                          }

                          PaymentMethodProvider _provider =
                              Provider.of<PaymentMethodProvider>(context,
                                  listen: false);
                          bool isSuccess = _provider.success;
                          if (isSuccess || isSuccessfully) {
                            _provider.success = false;
                            isSuccessfully = false;
                            bool subscriptionType = true;
                            if (StorageManager.getUserType() ==
                                UserType.subscribedUser) {
                              subscriptionType =
                                  StorageManager.getUserSubscription() ==
                                      AppSubscribtion.premuim;
                            } else {
                              if (subscribeServiceProvider.appSubscribtion !=
                                  null) {
                                subscriptionType =
                                    subscribeServiceProvider.appSubscribtion ==
                                        AppSubscribtion.premuim;
                              }
                            }
                            ServiceSubscribeRequestModel requesrModel =
                                ServiceSubscribeRequestModel(
                                    socid: StorageManager.getUserSocId(),
                                    date: startDate
                                        .add(Duration(
                                            hours: -startDate
                                                .timeZoneOffset.inHours))
                                        .millisecondsSinceEpoch
                                        .toString()
                                        .substring(0, 10),
                                    type: 0,
                                    instructions: subscribeServiceProvider
                                        .serviceInstructions,
                                    contactId: subscribeServiceProvider
                                        .serviceAddress!.id,
                                    extraInfoForPayment: PaymentInfo(
                                        accountid: '1664811661',
                                        numPayment:
                                            'REFERENCE FOURNIE PAR PRESTA MONETIQUE',
                                        closepaidinvoices: 'yes',
                                        comment:
                                            'Dispo pour enregistrer un lien ou plus info technique',
                                        datepaye: DateTime.now()
                                            .millisecondsSinceEpoch,
                                        paymentid: '6'),
                                    lines: lines,
                                    subscriptionType: subscriptionType);
                            int orderId = 0;
                            if (subscribeServiceProvider.appSubscribtion !=
                                null) {
                              if (subscribeServiceProvider.appSubscribtion ==
                                  AppSubscribtion.initial) {
                                requesrModel.lines.add(LineProduct(
                                    productId: '14',
                                    qty: '1',
                                    tvaTx: '20.00',
                                    subprice: '5.00000000',
                                    dateStart: DateTime.now()
                                        /* .add(Duration(
                                            hours: -DateTime.now()
                                                .timeZoneOffset
                                                .inHours)) */
                                        .millisecondsSinceEpoch
                                        .toString()
                                        .substring(0, 10),
                                    dateEnd: DateTime.now()
                                        .add(const Duration(
                                          days: 30,
                                          /* hours: -DateTime.now()
                                                .timeZoneOffset
                                                .inHours */
                                        ))
                                        .millisecondsSinceEpoch
                                        .toString()
                                        .substring(0, 10),
                                    desc: '',
                                    arrayOptions: ''));
                              } else {
                                requesrModel.lines.add(LineProduct(
                                    productId: '13',
                                    qty: '1',
                                    tvaTx: '20.00',
                                    subprice: '10.00000000',
                                    dateStart: DateTime.now()
                                        .add(Duration(
                                            hours: -DateTime.now()
                                                .timeZoneOffset
                                                .inHours))
                                        .millisecondsSinceEpoch
                                        .toString()
                                        .substring(0, 10),
                                    dateEnd: DateTime.now()
                                        .add(Duration(
                                            days: 30,
                                            hours: -DateTime.now()
                                                .timeZoneOffset
                                                .inHours))
                                        .millisecondsSinceEpoch
                                        .toString()
                                        .substring(0, 10),
                                    desc: '',
                                    arrayOptions: ''));
                              }
                              // await Future.delayed(const Duration(seconds: 3));
                              orderId = await subscribeServiceProvider
                                  .subscribeWithSubscription(
                                      serviceSubscribeRequestModel:
                                          requesrModel);
                            } else {
                              orderId = await subscribeServiceProvider
                                  .subscribeToService(
                                      serviceSubscribeRequestModel:
                                          requesrModel);
                              orderId =
                                  await subscribeServiceProvider.saveService(
                                      serviceSubscribeRequestModel:
                                          requesrModel,
                                      serviceId: orderId);
                            }

                            if (orderId != 0) {
                              if (subscribeServiceProvider.appSubscribtion !=
                                  null) {
                                StorageManager.setUserType(
                                    UserType.subscribedUser);
                                StorageManager.setUserSubscription(
                                    AppSubscribtion.values.indexOf(
                                        subscribeServiceProvider
                                            .appSubscribtion!));
                              }
                              subscribeServiceProvider.clearData();
                              ReservationConfirmationBottomSheets
                                  .showReservationConfirmation(
                                context: context,
                                onTapFirstButton: () {
                                  if (subscribeServiceProvider
                                          .serviceFrequency ==
                                      ServiceFrequency.oneTime) {
                                    RoutingProvider.pushNamed(
                                        routeName: Routes
                                            .userUpcomingOneTimeServiceDetailsScreen,
                                        arguments: orderId.toString());
                                  } else {
                                    RoutingProvider.pushNamed(
                                        routeName: Routes
                                            .userUpcomingRecurrentServiceDetailsScreen,
                                        arguments: orderId.toString());
                                  }
                                },
                                headerText: 'Confirmed reservation !',
                                contentText:
                                    'Your service has been successfully booked',
                                firstButtonText: 'Reservation details',
                              );
                            }
                          }
                        },
                        trailingText:
                            '${subscribeServiceProvider.getServicePrice()}€',
                      ),
              ],
            ),
          ),
        ),
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
              ),
            ),
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
                SvgPicture.asset(
                  AppIcons.visaIcon,
                  height: 20.h,
                  width: 20.w,
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
  Widget _detailsBox(UserServiceSubscribeProcessProvider provider) {
    String servicePrice = StorageManager.getUserType() ==
                UserType.subscribedUser ||
            provider.appSubscribtion != null
        ? provider
            .serviceDetailsModel.product.multipricesIncludesTax.secondPrice
            .substring(0, 5)
        : provider.serviceDetailsModel.product.multipricesIncludesTax.firstPrice
            .substring(0, 5);
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
                  key: 'Service',
                  value: provider.serviceDetailsModel.product.label,
                  isSpace: true),
              _tableDetailsLeftSide(
                  key: 'Date',
                  value: provider.serviceFrequency == ServiceFrequency.oneTime
                      ? '${DateFormat.E().format(provider.oneTimeServiceSelectedDay!)} ${provider.oneTimeServiceSelectedDay!.doMMMyyyy()}'
                      : '${DateFormat.E().format(provider.repeatDays[0])} ${provider.repeatDays[0].doMMMyyyy()}',
                  isSpace: false),
              Text(
                provider.oneTimeServiceTimeSlot!,
                style: AppTextStyles.robotoRegularBlack(12.sp),
              ),
              SizedBox(height: 15.h),
              _tableDetailsLeftSide(
                  key: 'Address',
                  value:
                      '${provider.serviceAddress!.address} ${provider.serviceAddress!.zip} ${provider.serviceAddress!.town}',
                  isSpace: false),
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
                  value: '$servicePrice€',
                ),
                _tableDetailsRightSide(
                    key: 'Duration', value: provider.oneTimeerviceDuration!),
                if (provider.serviceFrequency == ServiceFrequency.recurrent)
                  _tableDetailsRightSide(
                      key: 'subscription',
                      value: provider.appSubscribtion == AppSubscribtion.initial
                          ? '5€'
                          : '10€'),
                if (provider.serviceFrequency == ServiceFrequency.recurrent)
                  _tableDetailsRightSide(
                      key: 'Rec',
                      value:
                          '${provider.repeatTimes}x/${provider.repeatWeeks}week'),
                // The  'isDivider' to not add any divider after last item
                _tableDetailsRightSide(
                    key: 'VAT',
                    value: '${(double.tryParse(servicePrice)! * 20) / 100}€',
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
        if (isSpace)
          SizedBox(
            height: 15.h,
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
  Widget _priceBox(UserServiceSubscribeProcessProvider provider) {
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
              "Total Price (All Taxes Included)",
              style: AppTextStyles.header4Inter,
            ),
            Text(
              '${provider.getServicePrice()}€',
              style: AppTextStyles.robotoBoldBlack(16.sp),
            )
          ],
        ),
      ),
    );
  }
}
