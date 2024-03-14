class ServiceServiceTaskModel {
  ServiceServiceTaskModel({required this.title, required this.options});
  final String title;
  final List<String> options;
}

List<ServiceServiceTaskModel> tasks = [
  ServiceServiceTaskModel(
      title: "Maintenance of surfaces and floors",
      options: ['Aspirate', 'Wash', 'Dust', 'Detoilate', 'Clean up a worktop']),
  ServiceServiceTaskModel(
      title: 'Maintenance of sanitary facilities',
      options: ['Cleaning the toilet', 'Clean the bathroom']),
  ServiceServiceTaskModel(
      title: 'Window Cleaning',
      options: ['Glass door', 'Casement window (2 T)', 'Bay window']),
  ServiceServiceTaskModel(
      title: 'Emptying garbage cans', options: List.empty()),
  ServiceServiceTaskModel(title: 'HouseHold appliance maintenance', options: [
    'Clean the extractor hood',
    'Clean the oven',
    'Clean the refrigerator',
    'Clean the freezer'
  ])
];
