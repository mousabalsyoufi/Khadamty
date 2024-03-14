import 'package:faciltateur_de_vies/constants/enums/categories_type.dart';

import '../../../../constants/enums/easer_service_history_enum.dart';

class ServiceHistoryModel {
  final DateTime serviceHistoryDate;
  final String serviceHistoryName;
  final String serviceProvidingName;
  final ServiceHistoryStatusEnum serviceHistoryStatus;
  final CategoryType categoryType;
  final double? ratingValue;

  ServiceHistoryModel(
      {required this.ratingValue,
      required this.serviceHistoryDate,
      required this.serviceHistoryName,
      required this.serviceProvidingName,
      required this.serviceHistoryStatus,
      required this.categoryType});
}

List<ServiceHistoryModel> serviceHistoryList = [
  ServiceHistoryModel(
      serviceHistoryDate: DateTime(2202, 6, 19, 12, 30),
      serviceHistoryName: "Cleaning",
      serviceProvidingName: "Gabriela Soule",
      serviceHistoryStatus: ServiceHistoryStatusEnum.pending,
      categoryType: CategoryType.home,
      ratingValue: null),
  ServiceHistoryModel(
      serviceHistoryDate: DateTime(2202, 6, 13, 12, 30),
      serviceHistoryName: "School course",
      serviceProvidingName: "Michael Rance",
      serviceHistoryStatus: ServiceHistoryStatusEnum.rated,
      categoryType: CategoryType.family,
      ratingValue: 3.0),
  ServiceHistoryModel(
      serviceHistoryDate: DateTime(2202, 6, 3, 17, 30),
      serviceHistoryName: "Baby sitting + 3 years old",
      serviceProvidingName: "Corinne Dubois",
      serviceHistoryStatus: ServiceHistoryStatusEnum.rated,
      categoryType: CategoryType.courses,
      ratingValue: 4.0),
  ServiceHistoryModel(
      serviceHistoryDate: DateTime(2202, 6, 2, 12, 30),
      serviceHistoryName: "Small DIY",
      serviceProvidingName: "Alain Durant",
      serviceHistoryStatus: ServiceHistoryStatusEnum.canceled,
      categoryType: CategoryType.outSide,
      ratingValue: null),
  ServiceHistoryModel(
      serviceHistoryDate: DateTime(2202, 6, 1, 12, 30),
      serviceHistoryName: "School course",
      serviceProvidingName: "Michael Rance",
      serviceHistoryStatus: ServiceHistoryStatusEnum.rated,
      categoryType: CategoryType.courses,
      ratingValue: 4.5),
];
