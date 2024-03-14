import 'package:faciltateur_de_vies/core/generic_usecase/usecase.dart';
import 'package:faciltateur_de_vies/screens/shared_faq_screen/domain/usecase/get_shared_faq_items_usecase.dart';
import 'package:faciltateur_de_vies/screens/shared_faq_screen/domain/usecase/get_shared_faqs_usecase.dart';
import 'package:faciltateur_de_vies/shared_models/shared_faq_model.dart';

import '../../../../core/base_provider/base_provider.dart';
import '../../../../core/utility/utility.dart';

class SharedFaqsProvider extends BaseProvider {
  final GetSharedFaqsUseCase _getSharedFaqsUseCase;
  final GetSharedFaqItemsUseCase _getSharedFaqItemsUseCase;
  SharedFaqsProvider(
      this._getSharedFaqsUseCase, this._getSharedFaqItemsUseCase);

  List<SharedFaqModel> _faqs = [];
  List<SharedFaqModel> get faqs => _faqs;
  List<SharedFaqModel> _faqItems = [];
  List<SharedFaqModel> get faqItems => _faqItems;

  // Get Shared Faqs function to handle shared faqs and change state
  getSharedFaqs() async {
    setLoading = true;
    updateUi();
    var faqsResult = await _getSharedFaqsUseCase(NoParams());
    faqsResult.fold((error) {
      setError = true;
      setLoading = false;
      Utility.showToast(message: error.message);
      updateUi();
    }, (response) {
      setLoading = false;
      _faqs = response.data!;
      updateUi();
    });
  }

  // Get Shared Faq items function to handle shared faqs and change state
  getSharedFaqItems({required String id}) async {
    _faqItems = [];
    setLoading = true;
    updateUi();
    var categoriesResult = await _getSharedFaqItemsUseCase(
        SharedFaqItemsParams(id: int.parse(id)));
    categoriesResult.fold((error) {
      setError = true;
      setLoading = false;
      Utility.showToast(message: error.message);
      updateUi();
    }, (response) {
      setLoading = false;
      _faqItems = response.data!;
      updateUi();
    });
  }
}
