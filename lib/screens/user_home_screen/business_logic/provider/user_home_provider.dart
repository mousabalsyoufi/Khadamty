import 'package:faciltateur_de_vies/core/generic_usecase/usecase.dart';
import 'package:faciltateur_de_vies/shared_models/category_model.dart';
import 'package:faciltateur_de_vies/screens/user_home_screen/domain/usecase/get_user_categories_usecase.dart';

import '../../../../core/base_provider/base_provider.dart';
import '../../../../core/utility/utility.dart';

class UserHomeProvider extends BaseProvider {
  final GetUserCategoriesUseCase _getCategoriesUseCase;
  UserHomeProvider(this._getCategoriesUseCase);

  List<CategoryModel> categories = [];

  // getCategories function to handle categories and change state depended on return
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
