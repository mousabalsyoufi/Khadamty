
import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/core/api_handler/error_message.dart';
import 'package:faciltateur_de_vies/core/api_handler/response_handler.dart';
import 'package:faciltateur_de_vies/screens/user_bookings_screen/data/model/upcoming_orders_model.dart';
import 'package:faciltateur_de_vies/screens/user_bookings_screen/data/repository/user_bookings_repository_imp.dart';
import 'package:faciltateur_de_vies/screens/user_bookings_screen/domain/usecase/upcoming_orders_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockUserBookingsRepositoryImp extends Mock
    implements UserBookingsRepositoryImp {}

void main(){
  late MockUserBookingsRepositoryImp? mockUserBookingsRepositoryImp;

  late UpcomingOrdersUseCase? upcomingOrdersUseCase;
  setUp(() {
    mockUserBookingsRepositoryImp =
        MockUserBookingsRepositoryImp();
    upcomingOrdersUseCase =
        UpcomingOrdersUseCase(mockUserBookingsRepositoryImp);
  });

  int page =0 ;
  int limit =10;
  DateTime date = DateTime.now();
  List<UpcomingOrdersModel>? listUpcoming= [];
  final ApiResponse<List<UpcomingOrdersModel>?> tresultUpcoming = ApiResponse.completed(listUpcoming);
  final ApiResponse<List<UpcomingOrdersModel>?> tErrorResponseUpcoming = ApiResponse.error(ErrorMessages.dioDefault);

  test(
    "should return upcoming order response when calling get upcoming orders",
        () async {
      // Arrange
      when(
            () => mockUserBookingsRepositoryImp!.upcomingOrders(page: page,limit: limit,date: date),
      ).thenAnswer((invocation) async => Right(tresultUpcoming));
      // Act
      final result = await upcomingOrdersUseCase!(UpcomingOrdersUseCaseParams(page:page,limit: limit,date:date));
      // Assert
      expect(result, Right(tresultUpcoming));
      verify(
            () => mockUserBookingsRepositoryImp!.upcomingOrders(page: page,limit: limit,date:date),
      );
      verifyNoMoreInteractions(mockUserBookingsRepositoryImp);
    },
  );
  test(
    "should return error calling get upcoming orders",
        () async {
      // Arrange
      when(
            () => mockUserBookingsRepositoryImp!.upcomingOrders(page: page,limit: limit,date: date),
      ).thenAnswer((invocation) async => Left(tErrorResponseUpcoming));
      // Act
      final result = await upcomingOrdersUseCase!(UpcomingOrdersUseCaseParams(page: page,limit: limit,date: date));
      // Assert
      expect(result, Left(tErrorResponseUpcoming));
      verify(
            () => mockUserBookingsRepositoryImp!.upcomingOrders(page: page,limit: limit,date:date),
      );
      verifyNoMoreInteractions(mockUserBookingsRepositoryImp);
    },
  );
}