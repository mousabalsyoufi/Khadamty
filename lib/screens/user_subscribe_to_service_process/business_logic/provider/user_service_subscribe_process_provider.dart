import 'package:faciltateur_de_vies/constants/enums/app_subscribtions.dart';
import 'package:faciltateur_de_vies/constants/enums/service_frequency.dart';
import 'package:faciltateur_de_vies/constants/enums/user_type.dart';
import 'package:faciltateur_de_vies/core/base_provider/base_provider.dart';
import 'package:faciltateur_de_vies/core/local_storage/storage_manager.dart';
import 'package:faciltateur_de_vies/screens/user_subscribe_to_service_process/data/model/service_subscribe_request_model.dart';
import 'package:faciltateur_de_vies/screens/user_subscribe_to_service_process/data/model/service_time_model.dart';
import 'package:faciltateur_de_vies/screens/user_subscribe_to_service_process/domain/usecase/save_service_usecase.dart';
import 'package:faciltateur_de_vies/screens/user_subscribe_to_service_process/domain/usecase/subscribe_to_service_usecase.dart';
import 'package:faciltateur_de_vies/shared_models/address_model.dart';
import 'package:faciltateur_de_vies/shared_models/task_model.dart';

import '../../../../core/utility/utility.dart';
import '../../../shared_service_details_screen/data/models/service_details_model.dart';
import '../../data/model/service_task_model.dart';
import '../../domain/usecase/subscribe_with_subscription_usecase.dart';

class UserServiceSubscribeProcessProvider extends BaseProvider {
  final SubscribeToServiceUseCase _subscribeToServiceUseCase;
  final SaveServiceUseCase _saveServiceUseCase;
  final SubscribeWithSubscriptionUseCase _subsribeWithSubscriptionUseCase;

  UserServiceSubscribeProcessProvider(this._subscribeToServiceUseCase,
      this._saveServiceUseCase, this._subsribeWithSubscriptionUseCase);

  // TODO remove unused fields and objects

  // service Duration first time is  @Null
  String? _oneTimeServiceDuration;
  String? get oneTimeerviceDuration => _oneTimeServiceDuration;

  // service Time Slot first time is  @Null
  String? _oneTimeServiceTimeSlot;
  String? get oneTimeServiceTimeSlot => _oneTimeServiceTimeSlot;

  // service frequency first time is  @Null
  ServiceFrequency? _serviceFrequency;
  ServiceFrequency? get serviceFrequency => _serviceFrequency;

  // app subscribtion for recurrent service
  AppSubscribtion? _appSubscribtion;
  AppSubscribtion? get appSubscribtion => _appSubscribtion;

  // selected day for 1 time service
  DateTime? _oneTimeServiceSelectedDay;
  DateTime? get oneTimeServiceSelectedDay => _oneTimeServiceSelectedDay;

  // repeat times for recurrent service
  int _repeatTimes = 1;
  int get repeatTimes => _repeatTimes;
  int _repeatWeeks = 1;
  int get repeatWeeks => _repeatWeeks;
  List<DateTime> _repeatDays = [];
  List<DateTime> get repeatDays => _repeatDays;

  // user address for the service
  AddressModel? _serviceAddress;
  AddressModel? get serviceAddress => _serviceAddress;

  // the instruction of the service
  String _serviceInstructions = '';
  String get serviceInstructions => _serviceInstructions;

  bool get addressButtonEnabled => _serviceAddress != null;
  bool get frequencyButtonEnabled =>
      _serviceFrequency == ServiceFrequency.oneTime ||
      (_serviceFrequency == ServiceFrequency.recurrent &&
          _appSubscribtion != null) ||
      (_serviceFrequency == ServiceFrequency.recurrent &&
          StorageManager.getUserType() == UserType.subscribedUser);
  bool get serviceTasksButtonEnabled =>
      _serviceTasks.where((element) => element.isSelected == true).isNotEmpty;
  bool get oneTimeServiceDateButtonEnabled =>
      (_oneTimeServiceDuration != null &&
          _oneTimeServiceSelectedDay != null &&
          _oneTimeServiceTimeSlot != null &&
          _serviceFrequency != ServiceFrequency.recurrent) ||
      (_oneTimeServiceDuration != null &&
          _oneTimeServiceTimeSlot != null &&
          _serviceFrequency == ServiceFrequency.recurrent);
  // To check Btn is Enabled or Disabled in recurrent times screen
  bool get isRecurrentTimesBtnEnabled =>
      repeatTimes != 0 && repeatWeeks != 0 && repeatDays.length >= repeatTimes;

  // hours List
  List<ServiceTimeModel> _hours =
      slotDurations.map((e) => ServiceTimeModel.clone(e)).toList();
  List<ServiceTimeModel> get hours => _hours;

  // available time slots List
  List<ServiceTimeModel> _availableTimeSlots =
      availableSlots.map((e) => ServiceTimeModel.clone(e)).toList();
  List<ServiceTimeModel> get availableTimeSlots => _availableTimeSlots;

  // service tasks list
  final List<ServiceTaskModel> _serviceTasksList =
      servicesTasks.map((e) => ServiceTaskModel.clone(e)).toList();

  // server tasks list
  List<TaskModel> _serviceTasks = [];
  List<TaskModel> get serviceTasks => _serviceTasks;

  late ServiceDetailsModel _serviceDetailsModel;
  ServiceDetailsModel get serviceDetailsModel => _serviceDetailsModel;

  List<ServiceTaskModel> get serviceTasksList => _serviceTasksList;

  // pickup address screen logic
  bool fillData = false;

  setServiceDetails(ServiceDetailsModel serviceDetails) {
    _serviceDetailsModel = serviceDetails;
    _serviceTasks = serviceDetails.tasks;
  }

  // select Duration from slots [ 2, 3, 4, ... etc ] in the UI List..
  void setServiceDuration(int currentIndex) {
    _oneTimeServiceDuration = _hours[currentIndex].time;
    // get copy before from the original list
    _hours = slotDurations.map((e) => ServiceTimeModel.clone(e)).toList();
    // set the select item is True;
    _hours[currentIndex].isSelected = true;
    // update interface
    updateUi();
  }

  // set the repeat times for recurrent service
  setRepeatTimes(int times) {
    _repeatTimes = times;
    updateUi();
  }

  // set the repeat weeks for recurrent service
  setRepeatWeeks(int weeks) {
    _repeatWeeks = weeks;
    updateUi();
  }

  // set the repeat dates for recurrent service
  setRepeatDays(int index, DateTime day) {
    if (repeatDays.isEmpty || repeatDays.length < index + 1) {
      repeatDays.add(day);
    } else {
      repeatDays[index] = day;
    }
    updateUi();
  }

  void setServiceTimeSlot(int currentIndex) {
    _oneTimeServiceTimeSlot = _availableTimeSlots[currentIndex].time;
    // get copy before from the original list
    _availableTimeSlots =
        availableSlots.map((e) => ServiceTimeModel.clone(e)).toList();
    // set the select item is True;
    _availableTimeSlots[currentIndex].isSelected = true;
    // update interface
    updateUi();
  }

  // set the service frequency
  void setServiceFrequency(ServiceFrequency frequency) {
    _serviceFrequency = frequency;
    updateUi();
  }

  // set the service address for the user
  void setServiceAddress(AddressModel address) {
    _serviceAddress = address;
    updateUi();
  }

  // set service instructions
  void setServiceInstructions(String instructions) {
    _serviceInstructions = instructions;
  }

  // set the app subscribtion
  void setAppSubscribtion(AppSubscribtion subscribtion) {
    _appSubscribtion = subscribtion;
    updateUi();
  }

  void setSelectedDayForOneTimeService(DateTime day) {
    _oneTimeServiceSelectedDay = day;
    updateUi();
  }

  // select the service from list of services [we can choose multi one]
  void setServiceTaskActive(int currentIndex) {
    _serviceTasks[currentIndex].isSelected =
        !_serviceTasks[currentIndex].isSelected;
    updateUi();
  }

  // to check all tasks as active
  void setAllTasksActive() {
    int selectedTasksCount =
        _serviceTasks.where((element) => element.isSelected).length;
    if (selectedTasksCount > 0 && selectedTasksCount < _serviceTasks.length) {
      for (var index = 0; index < _serviceTasks.length; index++) {
        _serviceTasks[index].isSelected = true;
      }
    } else {
      for (var index = 0; index < _serviceTasks.length; index++) {
        _serviceTasks[index].isSelected = !_serviceTasks[index].isSelected;
      }
    }
    updateUi();
  }

  // setter to set fill Data value
  void setDataFilled(bool fillData) {
    this.fillData = fillData;
    updateUi();
  }

  double getServicePrice() {
    return double.parse((double.tryParse(Utility.getPriceSubString(
                    StorageManager.getUserType() == UserType.subscribedUser ||
                            (appSubscribtion != null)
                        ? serviceDetailsModel
                            .product.multipricesIncludesTax.secondPrice
                        : serviceDetailsModel
                            .product.multipricesIncludesTax.firstPrice))! *
                (double.tryParse(oneTimeerviceDuration!.substring(0, 1))!) +
            (appSubscribtion != null &&
                    serviceFrequency != ServiceFrequency.oneTime
                ? appSubscribtion == AppSubscribtion.initial
                    ? 5
                    : 10
                : 0))
        .toStringAsFixed(2));
  }

  Future<int> subscribeToService(
      {required ServiceSubscribeRequestModel
          serviceSubscribeRequestModel}) async {
    setLoading = true;
    updateUi();
    var serviceResult = await _subscribeToServiceUseCase(
        SubscribeToServiceUseCaseParams(
            subscribeRequestModel: serviceSubscribeRequestModel));
    return serviceResult.fold((error) {
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

  // subscribe to the service with buying a subscription in the app
  Future<int> subscribeWithSubscription(
      {required ServiceSubscribeRequestModel
          serviceSubscribeRequestModel}) async {
    setLoading = true;
    updateUi();
    var serviceResult = await _subsribeWithSubscriptionUseCase(
        SubscribeWithSubscriptionUseCaseParams(
            subscribeRequestModel: serviceSubscribeRequestModel));
    return serviceResult.fold((error) {
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

  // save the service in the middleware database so we can schedule notifications
  Future<int> saveService({
    required ServiceSubscribeRequestModel serviceSubscribeRequestModel,
    required int serviceId,
  }) async {
    setLoading = true;
    updateUi();
    var serviceResult = await _saveServiceUseCase(SaveServiceUseCaseParams(
        subscribeRequestModel: serviceSubscribeRequestModel,
        serviceId: serviceId));
    return serviceResult.fold((error) {
      setError = true;
      setLoading = false;
      Utility.showToast(message: error.message);
      updateUi();
      return 0;
    }, (response) {
      setLoading = false;
      updateUi();
      return response.data!;
    });
  }

  clearData() {
    // _oneTimeServiceDuration = null;
    //  _oneTimeServiceTimeSlot = null;
    _serviceFrequency = null;
    _appSubscribtion = null;
    // _oneTimeServiceSelectedDay = null;
    // _repeatTimes = 1;
    // _repeatDays = [];
    // _repeatWeeks = 1;
    // _serviceAddress = null;
    _serviceInstructions = '';
  }
}
