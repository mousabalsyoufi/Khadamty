import 'package:faciltateur_de_vies/core/base_provider/base_provider.dart';

import '../../../user_subscribe_to_service_process/data/model/service_time_model.dart';

class UserUpcomingRescheduleProvider extends BaseProvider {
  // available time slots List
  List<ServiceTimeModel> _availableTimeSlots = availableSlots.map((e) => ServiceTimeModel.clone(e)).toList();
  List<ServiceTimeModel> get availableTimeSlots => _availableTimeSlots;

  // service Time Slot first time is  @Null
  String? _oneTimeServiceTimeSlot;
  String? get oneTimeServiceTimeSlot => _oneTimeServiceTimeSlot;


  bool get oneTimeServiceDateButtonEnabled =>
          _oneTimeServiceSelectedDay != null &&
          _oneTimeServiceTimeSlot != null;

  // selected day for 1 time service
  DateTime? _oneTimeServiceSelectedDay;
  DateTime? get oneTimeServiceSelectedDay => _oneTimeServiceSelectedDay;

  void setSelectedDayForOneTimeService(DateTime day) {
    _oneTimeServiceSelectedDay = day;
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

}