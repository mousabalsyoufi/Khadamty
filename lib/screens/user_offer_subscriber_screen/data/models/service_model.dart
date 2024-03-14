class ServiceModel {
  final String title;
  bool isSelected;
  final int totalNumberTasks;
  final int totalNumberSelectedTasks;

  ServiceModel({required this.title,required this.isSelected,required this.totalNumberSelectedTasks,required this.totalNumberTasks});



  // to clone object with a new reference
  factory ServiceModel.clone(ServiceModel source) {
    return ServiceModel(isSelected: source.isSelected,title: source.title,totalNumberTasks: source.totalNumberTasks,totalNumberSelectedTasks: source.totalNumberSelectedTasks);
  }

}

List<ServiceModel> services = [
  ServiceModel(title: "Cleaning", isSelected: false,totalNumberTasks: 5,totalNumberSelectedTasks: 3),
  ServiceModel(title: "Laundry", isSelected: false,totalNumberTasks: 5,totalNumberSelectedTasks: 0),
  ServiceModel(title: "Pet sitting", isSelected: false,totalNumberTasks: 3,totalNumberSelectedTasks: 3),
  ServiceModel(title: "Baby sitting+3 years old", isSelected: false,totalNumberSelectedTasks: 0,totalNumberTasks: 3),
  ServiceModel(title: "Help with daily tasks", isSelected: false,totalNumberSelectedTasks: 3,totalNumberTasks: 3),
];