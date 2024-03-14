import 'package:faciltateur_de_vies/constants/enums/categories_type.dart';

class EventModel{
  final DateTime eventDateTime;
  final String eventName;
  final String eventPlace;
  final CategoryType categoryType;
  final String eventCost;
  final bool ableToReschedule;

  EventModel({required this.eventDateTime,
    required this.eventName,
    required this.categoryType,
    required this.eventPlace,required this.eventCost,required this.ableToReschedule});


}

List<EventModel> eventsList = [
  EventModel(eventDateTime: DateTime(2022,8,1,12,0,0,0,0),
      eventName: "Alain Durant",
      categoryType: CategoryType.family,
      eventPlace: "1 place",
      eventCost: "34000 Montpellier",
      ableToReschedule: false),
  EventModel(eventDateTime: DateTime(2022,8,1,14,0,0,0,0),
      eventName: "Sylvie Bouvier",
      categoryType: CategoryType.courses,
      eventPlace: "1 place",
      eventCost: "34000 Montpellier",
      ableToReschedule: false),
  EventModel(eventDateTime: DateTime(2022,8,1,16,0,0,0,0),
      eventName: "Corinne Dubois",
      categoryType: CategoryType.home,
      eventPlace: "1 place",
      eventCost: "34000 Montpellier",
      ableToReschedule: true),
  EventModel(eventDateTime: DateTime(2022,8,1,18,0,0,0,0),
      eventName: "Gabriela Soule",
      categoryType: CategoryType.outSide,
      eventPlace: "1 place",
      eventCost: "34000 Montpellier",
      ableToReschedule: false),
  EventModel(eventDateTime: DateTime(2022,8,1,19,30,0,0,0),
      eventName: "Corinne Dubois",
      categoryType: CategoryType.offers,
      eventPlace: "1 place",
      eventCost: "34000 Montpellier",
      ableToReschedule: true),
];