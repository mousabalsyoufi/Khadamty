// List of Slot time Hour only
class ServiceTimeModel {
  bool isSelected;
  final String time;

  ServiceTimeModel({required this.isSelected, required this.time});

  // to clone object with a new reference
  factory ServiceTimeModel.clone(ServiceTimeModel source) {
    return ServiceTimeModel(isSelected: source.isSelected, time: source.time);
  }
}

// static lists with dummy data
List<ServiceTimeModel> slotDurations = [
  ServiceTimeModel(time: '2h', isSelected: false),
  ServiceTimeModel(time: '3h', isSelected: false),
  ServiceTimeModel(time: '4h', isSelected: false),
  ServiceTimeModel(time: '5h', isSelected: false),
  ServiceTimeModel(time: '6h', isSelected: false),
  ServiceTimeModel(time: '7h', isSelected: false),
  ServiceTimeModel(time: '8h', isSelected: false),
];

List<ServiceTimeModel> availableSlots = [
  ServiceTimeModel(time: '9:30', isSelected: false),
  ServiceTimeModel(time: '10:30', isSelected: false),
  ServiceTimeModel(time: '12:30', isSelected: false),
  ServiceTimeModel(time: '14:00', isSelected: false),
  ServiceTimeModel(time: '15:00', isSelected: false),
  ServiceTimeModel(time: '16:30', isSelected: false),
];
