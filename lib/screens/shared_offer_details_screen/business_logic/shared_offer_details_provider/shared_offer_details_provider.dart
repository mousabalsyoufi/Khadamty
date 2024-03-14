import 'package:faciltateur_de_vies/core/base_provider/base_provider.dart';
import 'package:faciltateur_de_vies/screens/shared_offer_details_screen/data/model/offer_details_model.dart';
import 'package:faciltateur_de_vies/screens/shared_offer_details_screen/domain/usecase/get_offer_details_usecase.dart';

import '../../../../core/utility/utility.dart';

class SharedOfferDetailsProvider extends BaseProvider {
  final GetOfferDetailsUseCase _getOfferDetailsUseCase;
  SharedOfferDetailsProvider(this._getOfferDetailsUseCase);

  // index tab for service details screen
  int _tabIndex = 0;
  int get tabIndex => _tabIndex;

  List<OfferDetailsModel> _offerDetails = [];
  List<OfferDetailsModel> get offerDetails => _offerDetails;

  // function to change index number to select another tab
  void changeTabIndex(int tabIndex) {
    _tabIndex = tabIndex;
    updateUi();
  }

  // get offer details function to handle offer details and change state depended on return
  getofferDetails({required String id}) async {
    _offerDetails = [];
    _tabIndex = 0;
    setLoading = true;
    updateUi();
    var serviceDetailsResult =
        await _getOfferDetailsUseCase(OfferDetailsParams(id: id));
    serviceDetailsResult.fold((error) {
      setError = true;
      setLoading = false;
      Utility.showToast(message: error.message);
      updateUi();
    }, (response) {
      setLoading = false;
      _offerDetails = response.data!;
      updateUi();
    });
  }
}
