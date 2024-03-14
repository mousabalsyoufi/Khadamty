import 'package:faciltateur_de_vies/screens/easer_catalog_screen/data/model/catalog_model.dart';

import '../../../../../core/api_handler/response_handler.dart';

/// abstract get catalogs  api call
abstract class EquipmentCatalogApi {
  Future<ApiResponse<List<CatalogModel>>> getCatalogs();
}
