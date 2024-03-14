import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/core/api_handler/error_message.dart';
import 'package:faciltateur_de_vies/core/api_handler/response_handler.dart';
import 'package:faciltateur_de_vies/screens/user_upcoming_recurrent_service_details_screen/data/repoistory/user_upcoming_recurrent_service_details_repository_imp.dart';
import 'package:faciltateur_de_vies/screens/user_upcoming_recurrent_service_details_screen/domain/usecase/get_upcoming_recurrent_service_details_usecase.dart';
import 'package:faciltateur_de_vies/shared_models/address_model.dart';
import 'package:faciltateur_de_vies/shared_models/service_reservation_details_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockUserUpcomingRecurrentServiceDetailsRepositoryImp extends Mock
    implements UserUpcomingRecurrentServiceDetailsRepositoryImp {}

void main() {
  late MockUserUpcomingRecurrentServiceDetailsRepositoryImp?
      mockUserUpcomingRecurrentServiceDetailsRepositoryImp;
  late GetUpcomingRecurrentServiceDetailsUseCase?
      getUpcomingRecurrentServiceDetailsUseCase;

  setUp(() {
    mockUserUpcomingRecurrentServiceDetailsRepositoryImp =
        MockUserUpcomingRecurrentServiceDetailsRepositoryImp();
    getUpcomingRecurrentServiceDetailsUseCase =
        GetUpcomingRecurrentServiceDetailsUseCase(
            mockUserUpcomingRecurrentServiceDetailsRepositoryImp);
  });

  const tOrderId = '1';
  final tServiceDetailsResponse = ServiceReservationDetailsModel(
      date: 1,
      totalHt: 'totalHt',
      totalTva: 'totalTva',
      totalLocaltax1: 'totalLocaltax1',
      totalLocaltax2: 'totalLocaltax2',
      totalTtc: 'totalTtc',
      multicurrencyCode: 'multicurrencyCode',
      multicurrencyTx: 'multicurrencyTx',
      multicurrencyTotalHt: 'multicurrencyTotalHt',
      multicurrencyTotalTva: 'multicurrencyTotalTva',
      multicurrencyTotalTtc: 'multicurrencyTotalTtc',
      instructions: 'instructions',
      contact: AddressModel(
          id: '1',
          email: 'test@test.com',
          lastname: 'mohammad',
          address: 'paris',
          zip: '35500',
          town: 'montiplieer',
          arrayOptions:
              ArrayOptions(surface: '100', lat: '20.0000', long: '20.0000')),
      lines: []);

  final tresult = ApiResponse.completed(tServiceDetailsResponse);
  final ApiResponse<ServiceReservationDetailsModel> tErrorResponse =
      ApiResponse.error(ErrorMessages.dioDefault);

  test(
    "should return reservation details model response when calling get upcoming service details",
    () async {
      // Arrange
      when(
        () => mockUserUpcomingRecurrentServiceDetailsRepositoryImp!
            .getUpcomingServiceDetails(id: tOrderId),
      ).thenAnswer((invocation) async => Right(tresult));
      // Act
      final result = await getUpcomingRecurrentServiceDetailsUseCase!(
          GetUpcomingServiceDetailsUseCaseParams(id: tOrderId));
      // Assert
      expect(result, Right(tresult));
      verify(
        () => mockUserUpcomingRecurrentServiceDetailsRepositoryImp!
            .getUpcomingServiceDetails(id: tOrderId),
      );
      verifyNoMoreInteractions(
          mockUserUpcomingRecurrentServiceDetailsRepositoryImp);
    },
  );
  test(
    "should return error calling get upcoming service details",
    () async {
      // Arrange
      when(
        () => mockUserUpcomingRecurrentServiceDetailsRepositoryImp!
            .getUpcomingServiceDetails(id: tOrderId),
      ).thenAnswer((invocation) async => Left(tErrorResponse));
      // Act
      final result = await getUpcomingRecurrentServiceDetailsUseCase!(
          GetUpcomingServiceDetailsUseCaseParams(id: tOrderId));
      // Assert
      expect(result, Left(tErrorResponse));
      verify(
        () => mockUserUpcomingRecurrentServiceDetailsRepositoryImp!
            .getUpcomingServiceDetails(id: tOrderId),
      );
      verifyNoMoreInteractions(
          mockUserUpcomingRecurrentServiceDetailsRepositoryImp);
    },
  );
}
