import 'package:faciltateur_de_vies/screens/easer_catalog_screen/data/model/catalog_model.dart';
import 'package:faciltateur_de_vies/screens/easer_catalog_screen/domain/usecase/equipment_request_usecase.dart';

import '../../../../core/base_provider/base_provider.dart';
import '../../../../core/generic_usecase/usecase.dart';
import '../../../../core/utility/utility.dart';
import '../../../../shared_models/shared_help_ticket_request_model.dart';
import '../../domain/usecase/get_easer_catalogs_usecase.dart';


/// This class for Easer Catalog Provider contain the logic of this screen and it extend from BaseProvider all Base feature
class EaserCatalogProvider extends BaseProvider {
  final GetEaserCatalogsUseCase _getEaserCatalogsUseCase;
  final EquipmentRequestUseCase _equipmentRequestUseCase;
  EaserCatalogProvider(
      this._getEaserCatalogsUseCase, this._equipmentRequestUseCase);

  List<CatalogModel> catalogs = [];

  /// getCatalogs function to handle catalogs and change state
  getCatalogs() async {
    catalogs = [];
    setLoading = true;
    updateUi();
    var catalogsResult = await _getEaserCatalogsUseCase(NoParams());
    catalogsResult.fold((error) {
      setError = true;
      setLoading = false;
      Utility.showToast(message: error.message);
      updateUi();
    }, (response) {
      setLoading = false;
      catalogs = response.data!;
      updateUi();
    });
  }

  /// send equipment request to the easer magor
  Future<int> equipmentRequest(
      {required SharedHelpTicketRequestModel requestModel}) async {
    updateUi();
    var equipmentRequestResult = await _equipmentRequestUseCase(
        EquipmentRequestUseCaseParams(requestModel: requestModel));
    return equipmentRequestResult.fold((error) {
      setError = true;
      Utility.showToast(message: error.message);
      updateUi();
      return 0;
    }, (response) {
      return response.data!;
    });
  }

  void resetCatalogCount(int index) {
    catalogs[index].count = 0;
    updateUi();
  }

  void addToCatalog(int index) {
    catalogs[index].count++;
    updateUi();
  }

  void removeFromCatalog(int index) {
    if (catalogs[index].count > 0) {
      catalogs[index].count--;
      updateUi();
    }
  }
}
