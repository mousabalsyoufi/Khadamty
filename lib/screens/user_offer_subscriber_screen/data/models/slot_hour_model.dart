// List of Slot time Hour only
class SlotHour{
  bool isSelected;
  final int hour;

  SlotHour({required this.isSelected,required this.hour});


  // to clone object with a new reference
  factory SlotHour.clone(SlotHour source) {
    return SlotHour(isSelected: source.isSelected,hour: source.hour);
  }
}

// static list with dummy data
List<SlotHour>  slotHours = [
  SlotHour(hour:2,isSelected: false),
  SlotHour(hour:3,isSelected: false),
  SlotHour(hour:4,isSelected: false),
  SlotHour(hour:5,isSelected: false),
  SlotHour(hour:6,isSelected: false),
  SlotHour(hour:7,isSelected: false),
  SlotHour(hour:8,isSelected: false),
];