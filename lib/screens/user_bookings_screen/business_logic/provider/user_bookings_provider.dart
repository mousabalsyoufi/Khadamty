import 'package:faciltateur_de_vies/core/base_provider/base_provider.dart';
import 'package:faciltateur_de_vies/core/utility/utility.dart';
import 'package:faciltateur_de_vies/screens/user_bookings_screen/data/model/history_orders_model.dart';
import 'package:faciltateur_de_vies/screens/user_bookings_screen/data/model/upcoming_orders_model.dart';
import 'package:faciltateur_de_vies/screens/user_bookings_screen/domain/usecase/history_orders_usecase.dart';
import 'package:faciltateur_de_vies/screens/user_bookings_screen/domain/usecase/upcoming_orders_usecase.dart';

///
/// Class to manage the state of User Booking screen [ history & upcoming ] orders

class UserBookingsProvider extends  BaseProvider {

  final HistoryOrdersUseCase _historyOrdersUseCase;

  final UpcomingOrdersUseCase _upcomingOrdersUseCase;

  List<HistoryOrdersModel>? historyOrdersList;
  // to load the first time page 
  bool historyLoading = false;

  List<UpcomingOrdersModel>? upcomingOrdersList ;
  // to load the first time page
  bool upcomingLoading = false;

  // to avoid call api multi time without data [zero] length refer to upcoming List
  bool isUpcomingListReach = false;
  // to avoid call api multi time without data [zero] length  refer to history List
  bool isHistoryListReach = false;
  UserBookingsProvider(this._upcomingOrdersUseCase,this._historyOrdersUseCase);



  upcomingOrders({int? page,int? limit,DateTime? date}) async {
    // check if last request is return empty data or not [ isUpcoming order reach to end of list ]
    if(!isUpcomingListReach || page == 0){
      upcomingLoading = true;
      updateUi();
      var upcomingResult = await _upcomingOrdersUseCase(UpcomingOrdersUseCaseParams(page: page,limit: limit,date:date));
      return upcomingResult.fold((error) {
        setError = true;
        upcomingLoading = false;
        Utility.showToast(message: error.message);
        updateUi();
      }, (response) {
        upcomingLoading = false;
        // the first time init and set the array
        if(response.data!.isNotEmpty && page ==0){
          upcomingOrdersList = response.data!;
        }
        // otherwise and the list not empty add to exist one
        else if(response.data != null && response.data!.isNotEmpty) {
          upcomingOrdersList!.addAll(response.data!);
        }
        // if no condition from above is true that meaning the list reach to the end and no more item to fetch it.
        else{
          isUpcomingListReach = true;
        }
        updateUi();
      });
    }
  }
  bool upcomingLoadingNextPage= false;
  upcomingOrdersNextPage({int? page,int? limit,DateTime? date}) async {
    // check if last request is return empty data or not [ isUpcoming order reach to end of list ]
    if(!isUpcomingListReach || page == 0){
      upcomingLoadingNextPage = true;
      updateUi();
      var upcomingResult = await _upcomingOrdersUseCase(UpcomingOrdersUseCaseParams(page: page,limit: limit,date:date));
      return upcomingResult.fold((error) {
        setError = true;
        upcomingLoadingNextPage = false;
        Utility.showToast(message: error.message);
        updateUi();
      }, (response) {
        upcomingLoadingNextPage = false;
        // the first time init and set the array
        if(response.data!.isNotEmpty && page ==0){
          upcomingOrdersList = response.data!;
        }
        // otherwise and the list not empty add to exist one
        else if(response.data != null && response.data!.isNotEmpty) {
          upcomingOrdersList!.addAll(response.data!);
        }
        // if no condition from above is true that meaning the list reach to the end and no more item to fetch it.
        else{
          isUpcomingListReach = true;
        }
        updateUi();
      });
    }
  }







  historyOrders({int? page,int? limit,DateTime? date}) async {
    if(!isHistoryListReach){
    historyLoading = true;
    updateUi();
    var historyOrdersResult = await _historyOrdersUseCase(HistoryOrdersUseCaseParams(page: page,limit: limit,date: date));
    return historyOrdersResult.fold((error) {
      setError = true;
      historyLoading = false;
      Utility.showToast(message: error.message);
      updateUi();
    }, (response) {
      historyLoading = false;
      // the first time init and set the array
      if(response.data!.isNotEmpty && page ==0){
        historyOrdersList = response.data!;
      }
      // otherwise and the list not empty add to exist one
      else if(response.data != null && response.data!.isNotEmpty) {
        historyOrdersList!.addAll(response.data!);
      }
      // if no condition from above is true that meaning the list reach to the end and no more item to fetch it.
      else{
        isHistoryListReach = true;
      }
      updateUi();
    });
    }
  }

  bool historyLoadingNextPage= false;

  historyOrdersNextPage({int? page,int? limit,DateTime? date}) async {
    if(!isHistoryListReach){
      historyLoadingNextPage = true;
      updateUi();
      var historyOrdersResult = await _historyOrdersUseCase(HistoryOrdersUseCaseParams(page: page,limit: limit,date: date));
      return historyOrdersResult.fold((error) {
        setError = true;
        historyLoadingNextPage = false;
        Utility.showToast(message: error.message);
        updateUi();
      }, (response) {
        historyLoadingNextPage = false;
        // the first time init and set the array
        if(response.data!.isNotEmpty && page ==0){
          historyOrdersList = response.data!;
        }
        // otherwise and the list not empty add to exist one
        else if(response.data != null && response.data!.isNotEmpty) {
          historyOrdersList!.addAll(response.data!);
        }
        // if no condition from above is true that meaning the list reach to the end and no more item to fetch it.
        else{
          isHistoryListReach = true;
        }
        updateUi();
      });
    }
  }

}