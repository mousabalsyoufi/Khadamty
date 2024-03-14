import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/core/api_handler/error_message.dart';
import 'package:faciltateur_de_vies/core/api_handler/response_handler.dart';
import 'package:faciltateur_de_vies/screens/easer_services_history_screen/data/datasource/services_history_provider/easer_services_history_api_imp.dart';
import 'package:faciltateur_de_vies/screens/easer_services_history_screen/data/repository/easer_services_history_repository_imp.dart';
import 'package:faciltateur_de_vies/screens/user_bookings_screen/data/model/history_orders_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockEaserServicesHistoryApiImp extends Mock
    implements EaserServicesHistoryApiImp {}

void main() {
  late MockEaserServicesHistoryApiImp? mockEaserServicesHistoryApiImp;

  late EaserServicesHistoryRepositoryImp? easerServicesHistoryRepositoryImp;
  setUp(() {
    mockEaserServicesHistoryApiImp = MockEaserServicesHistoryApiImp();
    easerServicesHistoryRepositoryImp = EaserServicesHistoryRepositoryImp(
      mockEaserServicesHistoryApiImp!,
    );
  });

  List<HistoryOrdersModel>? listHistory = [];
  final ApiResponse<List<HistoryOrdersModel>?> tresultHistory =
      ApiResponse.completed(listHistory);
  final ApiResponse<List<HistoryOrdersModel>?> tErrorHistoryResponse =
      ApiResponse.error(ErrorMessages.dioDefault);

  int tPage = 0;
  int tLimit = 10;
  DateTime tDate = DateTime.now();

  group("history group", () {
    test(
      "history services should return success list of orders",
      () async {
        // Arrange
        when(() => mockEaserServicesHistoryApiImp!.getServicesHistory(
            page: tPage,
            limit: tLimit,
            date: tDate)).thenAnswer((_) async => tresultHistory);
        // Act
        final result = await easerServicesHistoryRepositoryImp!
            .getServicesHistory(page: tPage, limit: tLimit, date: tDate);
        // Assert
        expect(result, Right(tresultHistory));
        verify(() => mockEaserServicesHistoryApiImp!
            .getServicesHistory(page: tPage, limit: tLimit, date: tDate));
        verifyNoMoreInteractions(mockEaserServicesHistoryApiImp);
      },
    );
    test(
      "history services should return Error",
      () async {
        // Arrange
        when(() => mockEaserServicesHistoryApiImp!.getServicesHistory(
            page: tPage,
            limit: tLimit,
            date: tDate)).thenAnswer((_) async => tErrorHistoryResponse);
        // Act
        final result = await easerServicesHistoryRepositoryImp!
            .getServicesHistory(page: tPage, limit: tLimit, date: tDate);
        // Assert
        expect(result, Left(tErrorHistoryResponse));
        verify(() => mockEaserServicesHistoryApiImp!
            .getServicesHistory(page: tPage, limit: tLimit, date: tDate));
        verifyNoMoreInteractions(mockEaserServicesHistoryApiImp);
      },
    );
  });
}
