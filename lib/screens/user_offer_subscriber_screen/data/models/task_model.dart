class TaskModel {
  final String title;
  final bool isSelected;

  TaskModel({required this.title,required this.isSelected});
}

List<TaskModel> taskModel = [
  TaskModel(title: "Surfaces and floors maintenance", isSelected: false),
  TaskModel(title: "Sanitary maintenance", isSelected: false),
  TaskModel(title: "Window cleaning", isSelected: false),
  TaskModel(title: "Sanitary maintenance", isSelected: false),
  TaskModel(title: "Sanitary maintenance", isSelected: false),
];