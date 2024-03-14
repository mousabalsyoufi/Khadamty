import 'package:faciltateur_de_vies/constants/enums/categories_type.dart';
import 'package:faciltateur_de_vies/core/generic_usecase/usecase.dart';
import 'package:faciltateur_de_vies/core/utility/utility.dart';
import 'package:faciltateur_de_vies/screens/shared_services_categories_screen/data/models/service_model.dart';
import 'package:faciltateur_de_vies/screens/shared_services_categories_screen/domain/usecase/get_categories_usecase.dart';
import 'package:faciltateur_de_vies/screens/shared_services_categories_screen/domain/usecase/get_category_services_usecase.dart';
import 'package:faciltateur_de_vies/screens/shared_services_categories_screen/domain/usecase/get_offers_usecase.dart';
import 'package:faciltateur_de_vies/shared_models/category_model.dart';
import 'package:faciltateur_de_vies/shared_models/category_service_model.dart';

import '../../../../core/base_provider/base_provider.dart';

class SharedServicesCategoriesProvider extends BaseProvider {
  final GetCategoriesUseCase _getCategoriesUseCase;
  final GetCategoryServicesUseCase _getCategoryServicesUseCase;
  final GetOffersUseCase _getOffersUseCase;
  SharedServicesCategoriesProvider(this._getCategoriesUseCase,
      this._getCategoryServicesUseCase, this._getOffersUseCase);

  List<CategoryModel> _categories = [];
  List<CategoryModel> get categories => _categories;
  List<CategoryServiceModel> _services = [];
  List<CategoryServiceModel> get services => _services;
  int _activeCategoryIndex = 0;
  int get activeCategoryIndex => _activeCategoryIndex;

  bool _servicesLoading = false;
  bool get servicesLoading => _servicesLoading;

  changeActiveCategory(int index) {
    if (!_servicesLoading) {
      _activeCategoryIndex = index;
      if (index != _categories.length - 1) {
        getCategoryServices(id: _categories[index].id);
      } else {
        getOffers();
      }
    }
  }

  List<Service> getServiceList(int categoryIndex) {
    return userServices
        .where((element) =>
            element.categoryType == CategoryType.values[categoryIndex])
        .toList();
  }

  // getCategories function to handle categories and change state depended on return
  getCategories(int selectedCategoryIndex) async {
    _activeCategoryIndex = selectedCategoryIndex;
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
      _categories = response.data!;
      getCategoryServices(id: _categories[selectedCategoryIndex].id);
    });
  }

  // getCategory Services function to handle category services and change state depended on return
  getCategoryServices({required String id}) async {
    _servicesLoading = true;
    _services = [];
    updateUi();
    var servicesResult =
        await _getCategoryServicesUseCase(CategoriesServicesParams(id: id));
    servicesResult.fold((error) {
      setError = true;
      _servicesLoading = false;
      Utility.showToast(message: error.message);
      updateUi();
    }, (response) {
      _servicesLoading = false;
      _services = response.data!;
      updateUi();
    });
  }

  // get offers function to handle category services and change state depended on return
  getOffers() async {
    _servicesLoading = true;
    _services = [];
    updateUi();
    var servicesResult = await _getOffersUseCase(NoParams());
    servicesResult.fold((error) {
      setError = true;
      _servicesLoading = false;
      Utility.showToast(message: error.message);
      updateUi();
    }, (response) {
      _servicesLoading = false;
      _services = response.data!;
      notifyListeners();
    });
  }
}
