import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/core/api_handler/error_message.dart';
import 'package:faciltateur_de_vies/core/api_handler/response_handler.dart';
import 'package:faciltateur_de_vies/screens/easer_service_details_screen/data/repository/easer_service_details_repository_imp.dart';
import 'package:faciltateur_de_vies/screens/easer_service_details_screen/domain/usecase/get_easer_service_details_usecase.dart';
import 'package:faciltateur_de_vies/shared_models/address_model.dart';
import 'package:faciltateur_de_vies/shared_models/service_reservation_details_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockEaserServiceDetailsRepositoryImp extends Mock
    implements EaserServiceDetailsRepositoryImp {}

void main() {
  late MockEaserServiceDetailsRepositoryImp?
      mockEaserServiceDetailsRepositoryImp;
  late GetEaserServiceDetailsUseCase? getEaserServiceDetailsUseCase;

  setUp(() {
    mockEaserServiceDetailsRepositoryImp =
        MockEaserServiceDetailsRepositoryImp();
    getEaserServiceDetailsUseCase =
        GetEaserServiceDetailsUseCase(mockEaserServiceDetailsRepositoryImp);
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
    "should return service details model response when calling get service details",
    () async {
      // Arrange
      when(
        () => mockEaserServiceDetailsRepositoryImp!
            .getServiceDetails(id: tOrderId),
      ).thenAnswer((invocation) async => Right(tresult));
      // Act
      final result = await getEaserServiceDetailsUseCase!(
          EaserServiceDetailsUseCaseParams(id: tOrderId));
      // Assert
      expect(result, Right(tresult));
      verify(
        () => mockEaserServiceDetailsRepositoryImp!
            .getServiceDetails(id: tOrderId),
      );
      verifyNoMoreInteractions(mockEaserServiceDetailsRepositoryImp);
    },
  );
  test(
    "should return error calling get service details",
    () async {
      // Arrange
      when(
        () => mockEaserServiceDetailsRepositoryImp!
            .getServiceDetails(id: tOrderId),
      ).thenAnswer((invocation) async => Left(tErrorResponse));
      // Act
      final result = await getEaserServiceDetailsUseCase!(
          EaserServiceDetailsUseCaseParams(id: tOrderId));
      // Assert
      expect(result, Left(tErrorResponse));
      verify(
        () => mockEaserServiceDetailsRepositoryImp!
            .getServiceDetails(id: tOrderId),
      );
      verifyNoMoreInteractions(mockEaserServiceDetailsRepositoryImp);
    },
  );
}
