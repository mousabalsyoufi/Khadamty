class CatalogModelFake {
  final int catalogId;
  final String img;
  int count;
  final String title;

  CatalogModelFake(
      {required this.catalogId,
      required this.img,
      required this.count,
      required this.title});
}

List<CatalogModelFake> catalogs = [
  CatalogModelFake(
      catalogId: 1,
      title: 'Workwear',
      img: 'https://icon-library.com/images/50x50-icon/50x50-icon-0.jpg',
      count: 0),
  CatalogModelFake(
      catalogId: 2,
      title: 'Disposable glove',
      img: 'https://icon-library.com/images/50x50-icon/50x50-icon-0.jpg',
      count: 0),
  CatalogModelFake(
      catalogId: 3,
      title: 'Mapa Glove',
      img: 'https://icon-library.com/images/50x50-icon/50x50-icon-0.jpg',
      count: 0),
];
