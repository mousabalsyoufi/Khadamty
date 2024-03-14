import 'package:faciltateur_de_vies/core/base_provider/base_provider.dart';
import 'package:faciltateur_de_vies/screens/shared_offer_details_screen/data/model/offer_details_model.dart';
import 'package:faciltateur_de_vies/screens/user_offer_subscriber_screen/data/models/slot_hour_model.dart';

import '../../../../constants/enums/user_offer_enum.dart';
import '../../../../core/utility/utility.dart';
import '../../../../shared_models/address_model.dart';
import '../../../../shared_models/category_service_model.dart';
import '../../../user_subscribe_to_service_process/data/model/service_time_model.dart';
import '../../data/models/offer_subscribe_request_model.dart';
import '../../data/models/service_model.dart';
import '../../domain/usecase/subscribe_to_offer_usecase.dart';

class UserOfferSubscriberProvider extends BaseProvider {
  final SubscribeToOfferUseCase _subscribeToOfferUseCase;

  UserOfferSubscriberProvider(this._subscribeToOfferUseCase);

  late CategoryServiceModel _offer;
  CategoryServiceModel get offer => _offer;
  List<OfferDetailsModel> _offerDetails = [];
  List<OfferDetailsModel> get offerDetails => _offerDetails;
  List<OfferProduct> _offerServices = [];
  List<OfferProduct> get offerServices => _offerServices;

  // service Time Slot first time is  @Null
  String? _serviceTimeSlot;
  String? get serviceTimeSlot => _serviceTimeSlot;

  // user address for the offer
  AddressModel? _offerAddress;
  AddressModel? get offerAddress => _offerAddress;

  // available time slots List
  List<ServiceTimeModel> _availableTimeSlots =
      availableSlots.map((e) => ServiceTimeModel.clone(e)).toList();
  List<ServiceTimeModel> get availableTimeSlots => _availableTimeSlots;

  int _repeatTimes = 1;
  int get repeatTimes => _repeatTimes;
  int _repeatWeeks = 1;
  int get repeatWeeks => _repeatWeeks;
  List<DateTime> _repeatDays = [];
  List<DateTime> get repeatDays => _repeatDays;

  bool get addressButtonEnabled => _offerAddress != null;

  void setServiceTimeSlot(int currentIndex) {
    _serviceTimeSlot = _availableTimeSlots[currentIndex].time;
    // get copy before from the original list
    _availableTimeSlots =
        availableSlots.map((e) => ServiceTimeModel.clone(e)).toList();
    // set the select item is True;
    _availableTimeSlots[currentIndex].isSelected = true;
    // update interface
    updateUi();
  }

  setRepeatTimes(int times) {
    _repeatTimes = times;
    updateUi();
  }

  setRepeatWeeks(int weeks) {
    _repeatWeeks = weeks;
    updateUi();
  }

  setRepeatDays(int index, DateTime day) {
    if (repeatDays.isEmpty || repeatDays.length < index + 1) {
      repeatDays.add(day);
    } else {
      repeatDays[index] = day;
    }
    updateUi();
  }

  setOfferData({
    required CategoryServiceModel offer,
    required List<OfferDetailsModel> offerDetails,
  }) {
    _offer = offer;
    _offerDetails = offerDetails;
    _offerServices = [];
    for (var i = 0; i < offerDetails.length; i++) {
      _offerServices.addAll(offerDetails[i].products);
    }
    updateUi();
  }

  String getOfferPaymentPrice() {
    return (double.parse(offer.priceIcludesTax) * serviceDuration!)
        .toStringAsFixed(2);
  }

  // init start offer screen for User Offer Subscriber process
  UserOfferSubscriber userOfferSubscriberStepStatus =
      UserOfferSubscriber.fillDataStep;

  // init percent of  top progress bar
  double percent = 0.2;

  // service Duration first time is  @Null
  int? serviceDuration;

  // task of service List
  List<SlotHour> hours = slotHours.map((e) => SlotHour.clone(e)).toList();
  // service tasks list
  List<ServiceModel> servicesList =
      services.map((e) => ServiceModel.clone(e)).toList();

  // pickup address screen logic
  bool fillData = false;

  // select Duration from slots [ 2, 3, 4, ... etc ] in the UI List..
  void setDurationService(int currentIndex) {
    // increase 2 to index number to save the value of duration [ 0+2,1+2 ... so on]
    serviceDuration = currentIndex + 2;
    // get copy before from the original list
    hours = slotHours.map((e) => SlotHour.clone(e)).toList();
    // set the select item is True;
    hours[currentIndex].isSelected = true;
    // update interface
    updateUi();
  }

  // select the task as selected or unselected for the corsponding service
  void setServiceTaskSelected(int serviceIndex, int taskIndex) {
    offerServices[serviceIndex].tasks[taskIndex].isSelected =
        !offerServices[serviceIndex].tasks[taskIndex].isSelected;
    setServiceActive(serviceIndex);
  }

  // set the offer address for the user
  void setOfferAddress(AddressModel address) {
    _offerAddress = address;
    updateUi();
  }

  // select the service from list of services [we can choose multi one]
  void setServiceActive(int currentIndex) {
    if (offerServices[currentIndex]
        .tasks
        .where((element) => element.isSelected)
        .isNotEmpty) {
      offerServices[currentIndex].isSelected = true;
    } else {
      offerServices[currentIndex].isSelected = false;
    }
    updateUi();
  }

  // select or unselect all the tasks of the selected service
  void setAllServiceTasksActive(int currentIndex, bool active) {
    offerServices[currentIndex].isSelected =
        !offerServices[currentIndex].isSelected;
    for (var i = 0; i < offerServices[currentIndex].tasks.length; i++) {
      offerServices[currentIndex].tasks[i].isSelected = active;
    }
    updateUi();
  }

  // To check Btn is Enabled or Disabled in recurrent times screen
  bool isRecurrentTimesBtnEnabled() {
    return repeatTimes != 0 &&
        repeatWeeks != 0 &&
        repeatDays.length >= repeatTimes;
  }

  // To check Btn is Enabled or Disabled [ check all chooses selected by user]
  bool isSelectTasksBtnEnabled() {
    bool isServiceSelected =
        offerServices.where((element) => element.isSelected == true).isNotEmpty;
    bool isSlotHourSelected =
        hours.where((element) => element.isSelected == true).isNotEmpty;
    return isServiceSelected && isSlotHourSelected && _serviceTimeSlot != null;
  }

  // change value of percent progress bar when user move to the next Page .
  void changePercent() {
    double result = double.parse((percent + .2).toStringAsFixed(2));
    if (result < 1.0) {
      percent = result;
      if (percent > .2 && percent <= .4) {
        userOfferSubscriberStepStatus =
            UserOfferSubscriber.selectRepeatPatternStep;
      } else if (percent > .4 && percent <= .6) {
        userOfferSubscriberStepStatus = UserOfferSubscriber.pickupAddressStep;
      } else if (percent > .6 && percent <= .8) {
        userOfferSubscriberStepStatus = UserOfferSubscriber.detailsServiceStep;
      }
      updateUi();
    }
  }

  void changePercentBack() {
    double result = double.parse((percent - .2).toStringAsFixed(2));
    if (result > 0) {
      percent = result;
      if (percent > 0 && percent <= .2) {
        userOfferSubscriberStepStatus = UserOfferSubscriber.fillDataStep;
      } else if (percent > .2 && percent <= .4) {
        userOfferSubscriberStepStatus =
            UserOfferSubscriber.selectRepeatPatternStep;
      } else if (percent > .4 && percent <= .6) {
        userOfferSubscriberStepStatus = UserOfferSubscriber.pickupAddressStep;
      } else if (percent > .6 && percent <= .8) {
        userOfferSubscriberStepStatus = UserOfferSubscriber.detailsServiceStep;
      }
      updateUi();
    }
  }

  void restPercent() {
    userOfferSubscriberStepStatus = UserOfferSubscriber.fillDataStep;
    percent = .3;
  }

  void resetProviderData() {
    userOfferSubscriberStepStatus = UserOfferSubscriber.fillDataStep;
    percent = .2;
    serviceDuration = null;
    _repeatTimes = 1;
    _repeatWeeks = 1;
    _repeatDays = [];
    _serviceTimeSlot = null;
    for (var element in _availableTimeSlots) {
      element.isSelected = false;
    }
    for (var element in hours) {
      element.isSelected = false;
    }
  }

  // setter to set fill Data value
  void setDataFilled(bool fillData) {
    this.fillData = fillData;
    updateUi();
  }

  Future<int> subscribeToService(
      {required OfferSubscribeRequestModel offerSubscribeRequestModel}) async {
    setLoading = true;
    updateUi();
    var offerResult = await _subscribeToOfferUseCase(
        SubscribeToOfferUseCaseParams(
            subscribeRequestModel: offerSubscribeRequestModel));
    return offerResult.fold((error) {
      setError = true;
      setLoading = false;
      Utility.showToast(message: error.message);
      updateUi();
      return 0;
    }, (response) {
      setLoading = false;
      updateUi();
      Utility.showToast(message: response.message!);
      return response.data!;
    });
  }
}
