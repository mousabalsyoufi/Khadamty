import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/core/api_handler/error_message.dart';
import 'package:faciltateur_de_vies/core/api_handler/response_handler.dart';
import 'package:faciltateur_de_vies/screens/easer_services_history_screen/data/repository/easer_services_history_repository_imp.dart';
import 'package:faciltateur_de_vies/screens/easer_services_history_screen/domain/usecase/get_easer_services_history_usecase.dart';
import 'package:faciltateur_de_vies/screens/user_bookings_screen/data/model/history_orders_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockEaserServicesHistoryRepositoryImp extends Mock
    implements EaserServicesHistoryRepositoryImp {}

void main() {
  late MockEaserServicesHistoryRepositoryImp?
      mockEaserServicesHistoryRepositoryImp;

  late GetEaserServicesHistoryUseCase? getEaserServicesHistoryUseCase;
  setUp(() {
    mockEaserServicesHistoryRepositoryImp =
        MockEaserServicesHistoryRepositoryImp();
    getEaserServicesHistoryUseCase =
        GetEaserServicesHistoryUseCase(mockEaserServicesHistoryRepositoryImp);
  });

  int tPage = 0;
  int tLimit = 10;
  DateTime tDate = DateTime.now();

  List<HistoryOrdersModel>? listHistory = [];
  final ApiResponse<List<HistoryOrdersModel>?> tresultHistory =
      ApiResponse.completed(listHistory);
  final ApiResponse<List<HistoryOrdersModel>?> tErrorResponseHistory =
      ApiResponse.error(ErrorMessages.dioDefault);

  test(
    "should return history order response when calling get services history",
    () async {
      // Arrange
      when(
        () => mockEaserServicesHistoryRepositoryImp!
            .getServicesHistory(page: tPage, limit: tLimit, date: tDate),
      ).thenAnswer((invocation) async => Right(tresultHistory));
      // Act
      final result = await getEaserServicesHistoryUseCase!(
          EaserServicesHistoryUseCaseParams(
              page: tPage, limit: tLimit, date: tDate));
      // Assert
      expect(result, Right(tresultHistory));
      verify(
        () => mockEaserServicesHistoryRepositoryImp!
            .getServicesHistory(page: tPage, limit: tLimit, date: tDate),
      );
      verifyNoMoreInteractions(mockEaserServicesHistoryRepositoryImp);
    },
  );
  test(
    "should return error calling get history order",
    () async {
      // Arrange
      when(
        () => mockEaserServicesHistoryRepositoryImp!
            .getServicesHistory(page: tPage, limit: tLimit, date: tDate),
      ).thenAnswer((invocation) async => Left(tErrorResponseHistory));
      // Act
      final result = await getEaserServicesHistoryUseCase!(
          EaserServicesHistoryUseCaseParams(
              page: tPage, limit: tLimit, date: tDate));
      // Assert
      expect(result, Left(tErrorResponseHistory));
      verify(
        () => mockEaserServicesHistoryRepositoryImp!
            .getServicesHistory(page: tPage, limit: tLimit, date: tDate),
      );
      verifyNoMoreInteractions(mockEaserServicesHistoryRepositoryImp);
    },
  );
}
