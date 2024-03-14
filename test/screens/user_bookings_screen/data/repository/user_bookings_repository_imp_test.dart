import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/core/api_handler/error_message.dart';
import 'package:faciltateur_de_vies/core/api_handler/response_handler.dart';
import 'package:faciltateur_de_vies/screens/user_bookings_screen/data/data_source/history_orders_provider/history_orders_api_imp.dart';
import 'package:faciltateur_de_vies/screens/user_bookings_screen/data/data_source/upcoming_orders_provider/upcoming_orders_api_imp.dart';
import 'package:faciltateur_de_vies/screens/user_bookings_screen/data/model/history_orders_model.dart';
import 'package:faciltateur_de_vies/screens/user_bookings_screen/data/model/upcoming_orders_model.dart';
import 'package:faciltateur_de_vies/screens/user_bookings_screen/data/repository/user_bookings_repository_imp.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockHistoryOrdersApiImp extends Mock
    implements HistoryOrdersApiImp {}

class MockUpcomingOrdersApiImp extends Mock
    implements UpcomingOrdersApiImp {}

void main() {
  late MockHistoryOrdersApiImp? mockHistoryOrdersApiImp;
  late MockUpcomingOrdersApiImp? mockUpcomingOrdersApiImp;

  late UserBookingsRepositoryImp? userBookingsRepositoryImp;
  setUp(() {
    mockHistoryOrdersApiImp = MockHistoryOrdersApiImp();
    mockUpcomingOrdersApiImp = MockUpcomingOrdersApiImp();
    userBookingsRepositoryImp =
        UserBookingsRepositoryImp(mockHistoryOrdersApiImp!,mockUpcomingOrdersApiImp!);
  });


  List<UpcomingOrdersModel>? listUpcoming= [];
  final ApiResponse<List<UpcomingOrdersModel>?> tresult = ApiResponse.completed(listUpcoming);
  final ApiResponse<List<UpcomingOrdersModel>?> tErrorResponse = ApiResponse.error(ErrorMessages.dioDefault);

  List<HistoryOrdersModel>? listHistory= [];
  final ApiResponse<List<HistoryOrdersModel>?> tresultHistory = ApiResponse.completed(listHistory);
  final ApiResponse<List<HistoryOrdersModel>?> tErrorHistoryResponse = ApiResponse.error(ErrorMessages.dioDefault);

  int page =0 ;
  int limit =10;
  DateTime date = DateTime.now();

group("upcoming group", ()  {
  test(
    "upcoming orders  should return success list of orders",
        () async {
      // Arrange
      when(() => mockUpcomingOrdersApiImp!.upcomingOrders(
          page:page,limit:limit, date:date )).thenAnswer((_) async => tresult);
      // Act
      final result = await userBookingsRepositoryImp!
          .upcomingOrders(page:page,limit:limit, date:date);
      // Assert
      expect(result, Right(tresult));
      verify(() => mockUpcomingOrdersApiImp!
          .upcomingOrders(
          page:page,limit:limit, date:date));
      verifyNoMoreInteractions(mockUpcomingOrdersApiImp);
    },
  );
  test(
    "upcoming orders  should return Error",
        () async {
      // Arrange
      when(() => mockUpcomingOrdersApiImp!.upcomingOrders(
          page:page,limit:limit, date: date
      )).thenAnswer((_) async => tErrorResponse);
      // Act
      final result = await userBookingsRepositoryImp!
          .upcomingOrders(page:page,limit:limit, date:date);
      // Assert
      expect(result, Left(tErrorResponse));
      verify(() => mockUpcomingOrdersApiImp!
          .upcomingOrders(page:page,limit:limit, date:date));
      verifyNoMoreInteractions(mockUpcomingOrdersApiImp);
    },
  );
});



group("history group", () {
  test(
    "history orders  should return success list of orders",
        () async {
      // Arrange
      when(() => mockHistoryOrdersApiImp!.historyOrders(
          page:page,limit:limit, date: date)).thenAnswer((_) async => tresultHistory);
      // Act
      final result = await userBookingsRepositoryImp!
          .historyOrders(page:page,limit:limit, date:date);
      // Assert
      expect(result, Right(tresultHistory));
      verify(() => mockHistoryOrdersApiImp!
          .historyOrders(
          page:page,limit:limit, date:date));
      verifyNoMoreInteractions(mockHistoryOrdersApiImp);
    },
  );
  test(
    "history orders  should return Error",
        () async {
      // Arrange
      when(() => mockHistoryOrdersApiImp!.historyOrders(
          page:page,limit:limit, date:date
      )).thenAnswer((_) async => tErrorHistoryResponse);
      // Act
      final result = await userBookingsRepositoryImp!
          .historyOrders(page:page,limit:limit, date:date);
      // Assert
      expect(result, Left(tErrorHistoryResponse));
      verify(() => mockHistoryOrdersApiImp!
          .historyOrders(page:page,limit:limit, date:date));
      verifyNoMoreInteractions(mockHistoryOrdersApiImp);
    },
  );
});




}
