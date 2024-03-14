import 'package:faciltateur_de_vies/core/generic_usecase/usecase.dart';
import 'package:faciltateur_de_vies/shared_models/category_model.dart';

import '../../../../core/base_provider/base_provider.dart';
import '../../../../core/utility/utility.dart';
import '../../domain/usecase/get_guest_categories_usecase.dart';

class GuestHomeProvider extends BaseProvider {
  final GetGuestCategoriesUseCase _getCategoriesUseCase;
  GuestHomeProvider(this._getCategoriesUseCase);

  List<CategoryModel> categories = [];

  // getCategories function to handle categories and change state
  getCategories() async {
    setLoading = true;
    updateUi();
    var categoriesResult = await _getCategoriesUseCase(NoParams());
    categoriesResult.fold((error) {
      setError = true;
      setLoading = false;
      Utility.showToast(message: error.message);
      updateUi();
    }, (response) {
      setLoading = false;
      categories = response.data!;
      updateUi();
    });
  }
}
