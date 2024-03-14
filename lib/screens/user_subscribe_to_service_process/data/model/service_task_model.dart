// ignore_for_file: public_member_api_docs, sort_constructors_first
class ServiceTaskModel {
  final String title;
  bool isSelected;
  ServiceTaskModel({
    required this.title,
    required this.isSelected,
  });

  // to clone object with a new reference
  factory ServiceTaskModel.clone(ServiceTaskModel source) {
    return ServiceTaskModel(
      isSelected: source.isSelected,
      title: source.title,
    );
  }
}

List<ServiceTaskModel> servicesTasks = [
  ServiceTaskModel(
    title: "Maintenance of surfaces and floors",
    isSelected: false,
  ),
  ServiceTaskModel(
    title: "Maintenance of sanitary facilities",
    isSelected: false,
  ),
  ServiceTaskModel(
    title: "Window cleaning",
    isSelected: false,
  ),
  ServiceTaskModel(
    title: "Emptying garbage cans",
    isSelected: false,
  ),
  ServiceTaskModel(
    title: "Dishes",
    isSelected: false,
  ),
  ServiceTaskModel(
    title: "Electrical maintenance",
    isSelected: false,
  ),
];
