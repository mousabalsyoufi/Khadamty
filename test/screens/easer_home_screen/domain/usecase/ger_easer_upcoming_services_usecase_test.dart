import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/core/api_handler/error_message.dart';
import 'package:faciltateur_de_vies/core/api_handler/response_handler.dart';
import 'package:faciltateur_de_vies/screens/easer_home_screen/data/repository/easer_home_repsoitory_imp.dart';
import 'package:faciltateur_de_vies/screens/easer_home_screen/domain/usecase/ger_easer_upcoming_services_usecase.dart';
import 'package:faciltateur_de_vies/screens/user_bookings_screen/data/model/upcoming_orders_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockEaserHomeRepositoryImp extends Mock
    implements EaserHomeRepositoryImp {}

void main() {
  late MockEaserHomeRepositoryImp? mockEaserHomeRepositoryImp;

  late GetEaserUpcomingServicesUseCase? getEaserUpcomingServicesUseCase;
  setUp(() {
    mockEaserHomeRepositoryImp = MockEaserHomeRepositoryImp();
    getEaserUpcomingServicesUseCase =
        GetEaserUpcomingServicesUseCase(mockEaserHomeRepositoryImp);
  });

  DateTime tDate = DateTime.now();
  List<UpcomingOrdersModel>? listUpcoming = [];
  final ApiResponse<List<UpcomingOrdersModel>?> tresultUpcoming =
      ApiResponse.completed(listUpcoming);
  final ApiResponse<List<UpcomingOrdersModel>?> tErrorResponseUpcoming =
      ApiResponse.error(ErrorMessages.dioDefault);

  test(
    "should return upcoming order response when calling get upcoming services",
    () async {
      // Arrange
      when(
        () => mockEaserHomeRepositoryImp!.getUpcomingOrders(date: tDate),
      ).thenAnswer((invocation) async => Right(tresultUpcoming));
      // Act
      final result = await getEaserUpcomingServicesUseCase!(
          UpcomingServicesUseCaseParams(date: tDate));
      // Assert
      expect(result, Right(tresultUpcoming));
      verify(
        () => mockEaserHomeRepositoryImp!.getUpcomingOrders(date: tDate),
      );
      verifyNoMoreInteractions(mockEaserHomeRepositoryImp);
    },
  );
  test(
    "should return error calling get upcoming services",
    () async {
      // Arrange
      when(
        () => mockEaserHomeRepositoryImp!.getUpcomingOrders(date: tDate),
      ).thenAnswer((invocation) async => Left(tErrorResponseUpcoming));
      // Act
      final result = await getEaserUpcomingServicesUseCase!(
          UpcomingServicesUseCaseParams(date: tDate));
      // Assert
      expect(result, Left(tErrorResponseUpcoming));
      verify(
        () => mockEaserHomeRepositoryImp!.getUpcomingOrders(date: tDate),
      );
      verifyNoMoreInteractions(mockEaserHomeRepositoryImp);
    },
  );
}
