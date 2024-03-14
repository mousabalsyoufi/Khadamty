import 'package:faciltateur_de_vies/core/base_provider/base_provider.dart';
import 'package:faciltateur_de_vies/screens/shared_service_details_screen/domain/usecase/get_service_details_usecase.dart';

import '../../../../core/utility/utility.dart';
import '../../data/models/service_details_model.dart';

class SharedServiceDetailsProvider extends BaseProvider {
  final GetServiceDetailsUseCase _getServiceDetailsUseCase;
  SharedServiceDetailsProvider(this._getServiceDetailsUseCase);
  // index tab for service details screen
  int _tabIndex = 0;
  int get tabIndex => _tabIndex;

  ServiceDetailsModel? _serviceDetailsModel;
  ServiceDetailsModel? get serviceDetailsModel => _serviceDetailsModel;

  // function to change index number to select another tab
  void changeTabIndex(int tabIndex) {
    _tabIndex = tabIndex;
    updateUi();
  }

  // get service details function to handle service details and change state depended on return
  getServiceDetails({required String id}) async {
    _serviceDetailsModel = null;
    setLoading = true;
    updateUi();
    var serviceDetailsResult =
        await _getServiceDetailsUseCase(ServiceDetailsParams(id: id));
    serviceDetailsResult.fold((error) {
      setError = true;
      setLoading = false;
      Utility.showToast(message: error.message);
      updateUi();
    }, (response) {
      setLoading = false;
      _serviceDetailsModel = response.data!;
      updateUi();
    });
  }
}
