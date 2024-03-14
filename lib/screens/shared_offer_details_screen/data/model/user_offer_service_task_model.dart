class OfferServiceTaskModel {
  OfferServiceTaskModel({required this.title, required this.options});
  final String title;
  final List<String> options;
}

List<OfferServiceTaskModel> tasks = [
  OfferServiceTaskModel(
      title: "Maintenance of surfaces and floors",
      options: ['Aspirate', 'Wash', 'Dust', 'Detoilate', 'Clean up a worktop']),
  OfferServiceTaskModel(
      title: 'Maintenance of sanitary facilities',
      options: ['Cleaning the toilet', 'Clean the bathroom']),
  OfferServiceTaskModel(
      title: 'Window Cleaning',
      options: ['Glass door', 'Casement window (2 T)', 'Bay window']),
  OfferServiceTaskModel(
      title: 'Emptying garbage cans', options: List.empty()),
  OfferServiceTaskModel(title: 'HouseHold appliance maintenance', options: [
    'Clean the extractor hood',
    'Clean the oven',
    'Clean the refrigerator',
    'Clean the freezer'
  ])
];
