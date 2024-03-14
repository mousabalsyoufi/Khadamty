import 'package:faciltateur_de_vies/shared_widgets/bottom_sheets/history_rating_bottom_sheet/data/model/rating_request_model.dart';

import '../../../../core/base_provider/base_provider.dart';
import '../../../../core/utility/utility.dart';
import '../domain/usecase/rating_usecase.dart';

class RatingSheetProvider extends BaseProvider {
  final RatingUseCase _ratingUseCase;

  RatingSheetProvider(this._ratingUseCase);

  Future<String> rateService({required RatingRequestModel requestModel}) async {
    setLoading = true;
    updateUi();
    var rateResult =
        await _ratingUseCase(RatingUseCaseParams(requestModel: requestModel));
    return rateResult.fold((error) {
      setError = true;
      setLoading = false;
      Utility.showToast(message: error.message);
      updateUi();
      return '';
    }, (response) {
      setLoading = false;
      updateUi();
      Utility.showToast(message: 'service rated successfully');
      return response.data!;
    });
  }
}
