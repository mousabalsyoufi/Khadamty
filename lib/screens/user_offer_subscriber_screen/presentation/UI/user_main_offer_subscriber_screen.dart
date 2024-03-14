import 'package:faciltateur_de_vies/core/api_handler/urls.dart';
import 'package:faciltateur_de_vies/core/helpers/date_helper.dart';
import 'package:faciltateur_de_vies/core/local_storage/storage_manager.dart';
import 'package:faciltateur_de_vies/core/utility/utility.dart';
import 'package:faciltateur_de_vies/screens/payment_method_module/bussiness_logic/provider/payment_methods_provider.dart';
import 'package:faciltateur_de_vies/screens/payment_method_module/data/models/paypal_recurrent_request_model.dart';
import 'package:faciltateur_de_vies/screens/shared_offer_details_screen/data/model/offer_details_model.dart';
import 'package:faciltateur_de_vies/screens/user_offer_subscriber_screen/business_logic/provider/user_offer_subscriber_provider.dart';
import 'package:faciltateur_de_vies/screens/user_offer_subscriber_screen/data/models/offer_subscribe_request_model.dart';
import 'package:faciltateur_de_vies/screens/user_offer_subscriber_screen/presentation/UI/user_offer_payment_details_screen.dart';
import 'package:faciltateur_de_vies/screens/user_offer_subscriber_screen/presentation/UI/user_offer_subscriber_add_address.dart';
import 'package:faciltateur_de_vies/screens/user_offer_subscriber_screen/presentation/UI/user_offer_subscriber_fill_data_screen.dart';
import 'package:faciltateur_de_vies/screens/user_offer_subscriber_screen/presentation/UI/user_offer_subscriber_select_repeat_screen.dart';
import 'package:faciltateur_de_vies/shared_models/category_service_model.dart';
import 'package:faciltateur_de_vies/shared_models/task_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:provider/provider.dart';

import '../../../../constants/colors/colors.dart';
import '../../../../constants/consts/consts.dart';
import '../../../../constants/enums/payment_types.dart';
import '../../../../constants/enums/user_offer_enum.dart';
import '../../../../routes/routes_names/routes_names.dart';
import '../../../../routes/routes_provider/routes_provider.dart';
import '../../../../shared_widgets/bottom_sheets/payment_sheets/payment_sheets.dart';
import '../../../../shared_widgets/bottom_sheets/reservation_confirmation_bottom_sheets/reservation_confirmation_bottom_sheet.dart';
import '../../../../shared_widgets/custom_black_button_with_title.dart';
import '../../../../shared_widgets/custom_progress_indicator.dart';
import '../../../payment_method_module/data/models/paypal_request_payment_model.dart';
import '../../../payment_method_module/presentaion/UI/paypal_payment_method.dart';
import '../widgets/user_offer_header.dart';

class UserMainOfferSubscriberScreen extends StatefulWidget {
  const UserMainOfferSubscriberScreen(
      {Key? key, required this.offer, required this.offerDetails})
      : super(key: key);

  final CategoryServiceModel offer;
  final List<OfferDetailsModel> offerDetails;

  @override
  State<UserMainOfferSubscriberScreen> createState() =>
      _UserMainOfferSubscriberScreenState();
}

class _UserMainOfferSubscriberScreenState
    extends State<UserMainOfferSubscriberScreen> {
  DateTime? startDate;
  DateTime? endDate;
  List<LineProduct> lines = [];
  late PaymentMethodProvider _provider;
  bool isSuccessfully = false;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
       _provider= Provider.of<PaymentMethodProvider>(context,listen: false);
      Provider.of<UserOfferSubscriberProvider>(context, listen: false)
          .setOfferData(
        offer: widget.offer,
        offerDetails: widget.offerDetails,
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserOfferSubscriberProvider>(
      builder: (BuildContext context, UserOfferSubscriberProvider provider, _) {
        return Scaffold(
          body: Scaffold(
            bottomNavigationBar: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: provider.isLoading
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
                  : CustomButtonBlackWithText(
                      buttonText: provider.userOfferSubscriberStepStatus ==
                              UserOfferSubscriber.detailsServiceStep
                          ? "Payer"
                          : "Continue",
                      onPressed: (provider.isSelectTasksBtnEnabled() &&
                                  provider.percent == 0.2) ||
                              (provider.isRecurrentTimesBtnEnabled() &&
                                  provider.percent == 0.4) ||
                              (provider.addressButtonEnabled &&
                                  provider.percent == 0.6) ||
                              provider.percent > 0.6
                          ? () async {
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
                              if (provider.percent == .8) {
                                int selectedTimeslotHour = int.parse(
                                    provider.serviceTimeSlot!.split(':')[0]);
                                int selectedTimeslotMinutes = int.parse(
                                    provider.serviceTimeSlot!.split(':')[1]);
                                startDate = provider.repeatDays[0]
                                    .add(Duration(
                                        hours: selectedTimeslotHour,
                                        minutes: selectedTimeslotMinutes))
                                    .toLocal();
                                endDate = provider.repeatDays[0]
                                    .add(Duration(
                                        hours: provider.serviceDuration! +
                                            selectedTimeslotHour,
                                        minutes: selectedTimeslotMinutes))
                                    .toLocal();
                                for (var offerService
                                    in provider.offerServices) {
                                  String tasksLabels = '';
                                  String tasksIds = '';
                                  List<TaskModel> selectedTasks = offerService
                                      .tasks
                                      .where((element) => element.isSelected)
                                      .toList();
                                  for (var taskId = 0;
                                      taskId < selectedTasks.length;
                                      taskId++) {
                                    if (taskId != selectedTasks.length - 1) {
                                      tasksIds +=
                                          '${selectedTasks[taskId].id}/';
                                      tasksLabels +=
                                          '${selectedTasks[taskId].label},';
                                    } else {
                                      tasksIds += selectedTasks[taskId].id;
                                      tasksLabels +=
                                          selectedTasks[taskId].label;
                                    }
                                  }
                                  for (var repeatWeeksIndex = 0;
                                      repeatWeeksIndex < provider.repeatWeeks;
                                      repeatWeeksIndex++) {
                                    for (var repeatIndex = 0;
                                        repeatIndex < provider.repeatTimes;
                                        repeatIndex++) {
                                      DateTime startDate = provider
                                          .repeatDays[repeatIndex]
                                          .add(Duration(
                                              days: repeatWeeksIndex * 7,
                                              hours: selectedTimeslotHour,
                                              minutes: selectedTimeslotMinutes))
                                          .toLocal();
                                      DateTime endDate = provider
                                          .repeatDays[repeatIndex]
                                          .add(Duration(
                                              days: repeatWeeksIndex * 7,
                                              hours: provider.serviceDuration! +
                                                  selectedTimeslotHour,
                                              minutes: selectedTimeslotMinutes))
                                          .toLocal();
                                      lines.add(LineProduct(
                                          productId: offerService.id,
                                          qty: '1',
                                          tvaTx: '0',
                                          subprice: '0',
                                          dateStart: startDate
                                              /* .add(Duration(
                                                  hours: -startDate
                                                      .timeZoneOffset.inHours)) */
                                              .millisecondsSinceEpoch
                                              .toString()
                                              .substring(0, 10),
                                          dateEnd: endDate
                                            /*   .add(Duration(
                                                  hours: -endDate
                                                      .timeZoneOffset.inHours)) */
                                              .millisecondsSinceEpoch
                                              .toString()
                                              .substring(0, 10),
                                          desc: tasksLabels,
                                          arrayOptions: ArrayOptions(
                                              optionsIdtasks: tasksIds)));
                                    }
                                  }
                                }
                                String paymentDate = DateTime
                                        .fromMillisecondsSinceEpoch(int.parse(
                                            "${lines[lines.length - 1].dateEnd}000"))
                                    .add(const Duration(days: 6))
                                    .millisecondsSinceEpoch
                                    .toString()
                                    .substring(0, 10);
                                PaymentTypes? paymentType = await PaymentSheets
                                    .showPaymentMethodBottomSheet(context);
                                if (paymentType == null) {
                                  return -1;
                                }
                                switch (paymentType) {
                                  case PaymentTypes.visa:
                                    await PaymentSheets.stripPaymentSheet(
                                        context: context,
                                        amount: double.parse(
                                            provider.getOfferPaymentPrice()),
                                        currency: Consts.euro,
                                        isRecurrent: true,
                                        cancelAt: int.parse(paymentDate),
                                        billingDetail: billing);
                                    break;
                                  case PaymentTypes.paypal:
                                    isSuccessfully =  await RoutingProvider.pushNamed(
                                            routeName: Routes.paypal,
                                            arguments: {
                                              "payPalRequestModel": null,
                                              'payPalRecurrentRequestModel': PayPalRecurrentRequestModel(
                                                  amount: provider
                                                      .getOfferPaymentPrice(),
                                                  cycle: provider.repeatWeeks.toString(),
                                                  url: Urls
                                                      .createPaypalSubscription,
                                                  currency: Consts.euro)});

                                    break;
                                  default:
                                }
                              }
                              PaymentMethodProvider _provider =
                                  Provider.of<PaymentMethodProvider>(context,
                                      listen: false);
                              bool isSuccess = _provider.success;
                              if (isSuccess || isSuccessfully) {
                                _provider.success = false;
                                isSuccessfully  = false;
                                int orderId = await provider.subscribeToService(
                                    offerSubscribeRequestModel: OfferSubscribeRequestModel(
                                        socid: StorageManager.getUserSocId(),
                                        date: startDate!.add(Duration(hours: -startDate!.timeZoneOffset.inHours)).millisecondsSinceEpoch.toString().substring(
                                            0, 10),
                                        contactId: provider.offerAddress!.id,
                                        type: 0,
                                        offer: LineProduct(
                                            productId: provider.offer.id,
                                            qty: '1',
                                            tvaTx: '20.00',
                                            subprice: provider
                                                .offer.multiprices.secondPrice,
                                            dateStart: startDate!
                                                .add(Duration(
                                                    hours: -startDate!
                                                        .timeZoneOffset
                                                        .inHours))
                                                .millisecondsSinceEpoch
                                                .toString()
                                                .substring(0, 10),
                                            dateEnd: endDate!
                                                .add(Duration(hours: -endDate!.timeZoneOffset.inHours))
                                                .millisecondsSinceEpoch
                                                .toString()
                                                .substring(0, 10),
                                            desc: 'desc',
                                            arrayOptions: ArrayOptions(optionsIdtasks: '')),
                                        childs: lines));
                                if (orderId != 0) {
                                  ReservationConfirmationBottomSheets
                                      .showReservationConfirmation(
                                    context: context,
                                    onTapFirstButton: () {
                                      provider.resetProviderData();
                                      RoutingProvider.pushNamed(
                                          routeName: Routes
                                              .userOfferReservationDetailsScreen,
                                          arguments: orderId.toString());
                                    },
                                    headerText: 'Confirmed reservation !',
                                    contentText:
                                        'Your service has been successfully booked',
                                    firstButtonText: 'Reservation details',
                                  );
                                }

                                return -1;
                              }
                              if (provider.percent < .8 ||
                                  (provider.percent == .8 && isSuccess)) {
                                provider.changePercent();
                              }
                            }
                          : null,
                      trailingText:
                          provider.percent == .6 || provider.percent == .8
                              ? '${provider.getOfferPaymentPrice()}€'
                              : '',
                    ),
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: Column(
                children: [
                  SizedBox(height: 30.h),
                  const UserOfferSubscriberHeaderWidget(),
                  SizedBox(height: 15.h),
                  Flexible(child: getBody(provider)),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget getBody(UserOfferSubscriberProvider provider) {
    if (provider.userOfferSubscriberStepStatus ==
        UserOfferSubscriber.fillDataStep) {
      return const UserOfferSubscriberFillDataScreen();
    }
    if (provider.userOfferSubscriberStepStatus ==
        UserOfferSubscriber.selectRepeatPatternStep) {
      return const UserOfferSubscriberSelectRepeatScreen();
    } else if (provider.userOfferSubscriberStepStatus ==
        UserOfferSubscriber.pickupAddressStep) {
      return UserOfferSubscriberAddAddressScreen();
    } else if (provider.userOfferSubscriberStepStatus ==
        UserOfferSubscriber.detailsServiceStep) {
      return const UserOfferServiceDetailsScreen();
    }
    return Container();
  }
}
