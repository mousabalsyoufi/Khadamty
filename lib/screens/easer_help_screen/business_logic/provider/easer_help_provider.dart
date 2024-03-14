import 'package:faciltateur_de_vies/core/generic_usecase/usecase.dart';
import 'package:faciltateur_de_vies/shared_models/shared_faq_model.dart';

import '../../../../core/base_provider/base_provider.dart';
import '../../../../core/utility/utility.dart';
import '../../domain/usecase/get_easer_faqs_usecase.dart';

class EaserHelpProvider extends BaseProvider {
  final GetEaserFaqsUseCase _getEaserFaqsUseCase;
  EaserHelpProvider(
    this._getEaserFaqsUseCase,
  );

  List<SharedFaqModel> _faqs = [];
  List<SharedFaqModel> get faqs => _faqs;

  // Get Easer Faqs function to handle shared faqs and change state
  getEaserFaqs() async {
    setLoading = true;
    updateUi();
    var faqsResult = await _getEaserFaqsUseCase(NoParams());
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
}
