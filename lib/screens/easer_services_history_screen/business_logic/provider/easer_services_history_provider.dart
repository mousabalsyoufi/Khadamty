import 'package:faciltateur_de_vies/core/base_provider/base_provider.dart';
import 'package:faciltateur_de_vies/core/utility/utility.dart';
import 'package:faciltateur_de_vies/screens/user_bookings_screen/data/model/history_orders_model.dart';

import '../../domain/usecase/get_easer_services_history_usecase.dart';

class EaserServicesHistoryProvider extends BaseProvider {
  EaserServicesHistoryProvider(
    this._getEaserServicesHistoryUseCase,
  );

  final GetEaserServicesHistoryUseCase _getEaserServicesHistoryUseCase;


  List<HistoryOrdersModel>? _serviceHistoryList ;
  List<HistoryOrdersModel>? get serviceHistoryList => _serviceHistoryList;

  // to load the first time page
  bool _historyLoading = false;
  bool get historyLoading => _historyLoading;

  // to avoid call api multi time without data [zero] length  refer to history List
  bool _isHistoryListReach = false;

  bool _historyLoadingNextPage = false;
  bool get historyLoadingNextPage => _historyLoadingNextPage;

  // rest the date to default values ...
  restProviderValues() {
    _serviceHistoryList = null;
    _isHistoryListReach = false;
  }

  getServicesHistory({int? page, int? limit, DateTime? date}) async {
    if (!_isHistoryListReach) {
      _historyLoading = true;
      updateUi();
      var historyOrdersResult = await _getEaserServicesHistoryUseCase(
          EaserServicesHistoryUseCaseParams(
              page: page, limit: limit, date: date));
      return historyOrdersResult.fold((error) {
        setError = true;
        _historyLoading = false;
        Utility.showToast(message: error.message);
        updateUi();
      }, (response) {
        _historyLoading = false;
        // the first time init and set the array
        if (response.data!.isNotEmpty && page == 0) {
          _serviceHistoryList = response.data!;
        }
        // otherwise and the list not empty add to exist one
        else if (response.data != null && response.data!.isNotEmpty) {
          _serviceHistoryList!.addAll(response.data!);
        }
        // if no condition from above is true that meaning the list reach to the end and no more item to fetch it.
        else {
          _isHistoryListReach = true;
        }
        updateUi();
      });
    }
  }

  getServicesHistoryNextPage({int? page, int? limit, DateTime? date}) async {
    if (!_isHistoryListReach) {
      _historyLoadingNextPage = true;
      updateUi();
      var historyOrdersResult = await _getEaserServicesHistoryUseCase(
          EaserServicesHistoryUseCaseParams(
              page: page, limit: limit, date: date));
      return historyOrdersResult.fold((error) {
        setError = true;
        _historyLoadingNextPage = false;
        Utility.showToast(message: error.message);
        updateUi();
      }, (response) {
        _historyLoadingNextPage = false;
        // the first time init and set the array
        if (response.data!.isNotEmpty && page == 0) {
          _serviceHistoryList = response.data!;
        }
        // otherwise and the list not empty add to exist one
        else if (response.data != null && response.data!.isNotEmpty) {
          _serviceHistoryList!.addAll(response.data!);
        }
        // if no condition from above is true that meaning the list reach to the end and no more item to fetch it.
        else {
          _isHistoryListReach = true;
        }
        updateUi();
      });
    }
  }
}
