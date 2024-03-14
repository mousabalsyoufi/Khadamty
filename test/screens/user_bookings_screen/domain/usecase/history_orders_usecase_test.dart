import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/core/api_handler/error_message.dart';
import 'package:faciltateur_de_vies/core/api_handler/response_handler.dart';
import 'package:faciltateur_de_vies/screens/user_bookings_screen/data/model/history_orders_model.dart';
import 'package:faciltateur_de_vies/screens/user_bookings_screen/data/repository/user_bookings_repository_imp.dart';
import 'package:faciltateur_de_vies/screens/user_bookings_screen/domain/usecase/history_orders_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockUserBookingsRepositoryImp extends Mock
    implements UserBookingsRepositoryImp {}

void main(){
  late MockUserBookingsRepositoryImp? mockUserBookingsRepositoryImp;

  late HistoryOrdersUseCase? historyOrdersUseCase;
  setUp(() {
    mockUserBookingsRepositoryImp =
        MockUserBookingsRepositoryImp();
    historyOrdersUseCase =
        HistoryOrdersUseCase(mockUserBookingsRepositoryImp);
  });

  int page =0 ;
  int limit =10;
  DateTime date = DateTime.now();



  List<HistoryOrdersModel>? listHistory= [];
  final ApiResponse<List<HistoryOrdersModel>?> tresultHistory = ApiResponse.completed(listHistory);
  final ApiResponse<List<HistoryOrdersModel>?> tErrorResponseHistory = ApiResponse.error(ErrorMessages.dioDefault);

  test(
    "should return history order response when calling get services history",
        () async {
      // Arrange
      when(
            () => mockUserBookingsRepositoryImp!.historyOrders(page: page,limit: limit,date: date),
      ).thenAnswer((invocation) async => Right(tresultHistory));
      // Act
      final result = await historyOrdersUseCase!(HistoryOrdersUseCaseParams(page:page,limit: limit,date:date));
      // Assert
      expect(result, Right(tresultHistory));
      verify(
            () => mockUserBookingsRepositoryImp!.historyOrders(page: page,limit: limit,date:date),
      );
      verifyNoMoreInteractions(mockUserBookingsRepositoryImp);
    },
  );
  test(
    "should return error calling get history order",
        () async {
      // Arrange
      when(
            () => mockUserBookingsRepositoryImp!.historyOrders(page: page,limit: limit,date: date),
      ).thenAnswer((invocation) async => Left(tErrorResponseHistory));
      // Act
      final result = await historyOrdersUseCase!(HistoryOrdersUseCaseParams(page: page,limit: limit,date: date));
      // Assert
      expect(result, Left(tErrorResponseHistory));
      verify(
            () => mockUserBookingsRepositoryImp!.historyOrders(page: page,limit: limit,date:date),
      );
      verifyNoMoreInteractions(mockUserBookingsRepositoryImp);
    },
  );
}