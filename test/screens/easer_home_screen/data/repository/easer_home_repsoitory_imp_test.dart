import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/core/api_handler/error_message.dart';
import 'package:faciltateur_de_vies/core/api_handler/response_handler.dart';
import 'package:faciltateur_de_vies/screens/easer_home_screen/data/data_source/upcoming_services_provider/upcoming_services_api_imp.dart';
import 'package:faciltateur_de_vies/screens/easer_home_screen/data/repository/easer_home_repsoitory_imp.dart';
import 'package:faciltateur_de_vies/screens/user_bookings_screen/data/model/upcoming_orders_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockEaserUpcomingServicesApiImp extends Mock
    implements EaserUpcomingServicesApiImp {}

void main() {
  late MockEaserUpcomingServicesApiImp? mockEaserUpcomingServicesApiImp;

  late EaserHomeRepositoryImp? easerHomeRepositoryImp;
  setUp(() {
    mockEaserUpcomingServicesApiImp = MockEaserUpcomingServicesApiImp();
    easerHomeRepositoryImp = EaserHomeRepositoryImp(
      mockEaserUpcomingServicesApiImp!,
    );
  });

  List<UpcomingOrdersModel>? listUpcoming = [];
  final ApiResponse<List<UpcomingOrdersModel>?> tresult =
      ApiResponse.completed(listUpcoming);
  final ApiResponse<List<UpcomingOrdersModel>?> tErrorResponse =
      ApiResponse.error(ErrorMessages.dioDefault);

  DateTime tDate = DateTime.now();

  group("upcoming group", () {
    test(
      "upcoming services should return success list of orders",
      () async {
        // Arrange
        when(() => mockEaserUpcomingServicesApiImp!
            .getUpcomingServices(date: tDate)).thenAnswer((_) async => tresult);
        // Act
        final result =
            await easerHomeRepositoryImp!.getUpcomingOrders(date: tDate);
        // Assert
        expect(result, Right(tresult));
        verify(() =>
            mockEaserUpcomingServicesApiImp!.getUpcomingServices(date: tDate));
        verifyNoMoreInteractions(mockEaserUpcomingServicesApiImp);
      },
    );
    test(
      "upcoming services should return Error",
      () async {
        // Arrange
        when(() => mockEaserUpcomingServicesApiImp!.getUpcomingServices(
            date: tDate)).thenAnswer((_) async => tErrorResponse);
        // Act
        final result =
            await easerHomeRepositoryImp!.getUpcomingOrders(date: tDate);
        // Assert
        expect(result, Left(tErrorResponse));
        verify(() =>
            mockEaserUpcomingServicesApiImp!.getUpcomingServices(date: tDate));
        verifyNoMoreInteractions(mockEaserUpcomingServicesApiImp);
      },
    );
  });
}
