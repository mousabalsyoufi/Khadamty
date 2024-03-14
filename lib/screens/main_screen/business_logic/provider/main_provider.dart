import '../../../../core/base_provider/base_provider.dart';

class MainProvider extends BaseProvider {
  int _activeScreenIndex = 0;
  int get activeScreenIndex => _activeScreenIndex;
  int _activeCategoryIndex = 0;
  int get activeCategoryIndex => _activeCategoryIndex;

  changeActiveScreen(int index, [int activeCategoryIndex = 0]) {
    _activeScreenIndex = index;
    _activeCategoryIndex = activeCategoryIndex;
    updateUi();
  }

  changeActiveOffline(int index) {
    _activeScreenIndex = index;
  }
}
