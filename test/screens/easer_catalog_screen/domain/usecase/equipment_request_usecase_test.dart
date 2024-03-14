import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/constants/consts/consts.dart';
import 'package:faciltateur_de_vies/core/api_handler/error_message.dart';
import 'package:faciltateur_de_vies/core/api_handler/response_handler.dart';
import 'package:faciltateur_de_vies/screens/easer_catalog_screen/data/repository/easer_catalog_repository_imp.dart';
import 'package:faciltateur_de_vies/screens/easer_catalog_screen/domain/usecase/equipment_request_usecase.dart';
import 'package:faciltateur_de_vies/shared_models/shared_help_ticket_request_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockEaserCatalogRepositoryImp extends Mock
    implements EaserCatalogRepositoryImp {}

void main() {
  late MockEaserCatalogRepositoryImp? mockEaserCatalogRepositoryImp;
  late EquipmentRequestUseCase? equipmentRequestUseCase;

  setUp(() {
    mockEaserCatalogRepositoryImp = MockEaserCatalogRepositoryImp();
    equipmentRequestUseCase =
        EquipmentRequestUseCase(mockEaserCatalogRepositoryImp);
  });

  final SharedHelpTicketRequestModel tRequestModel =
      SharedHelpTicketRequestModel(
          fkSoc: '1',
          subject: 'Equipment Request',
          message: 'equipment request message',
          typeCode: Consts.comTicket,
          categoryCode: Consts.otherCategoryCodeTicket,
          severityCode: Consts.normalSeverityTicket);
  const tEquipmentRequestResponse = 1;

  // response contains ticket id
  final tEquipmentRequestResultResponse =
      ApiResponse.completed(tEquipmentRequestResponse);
  final ApiResponse<int> tEquipmentRequestErrorResponse =
      ApiResponse.error(ErrorMessages.dioDefault);

  test(
    "should return ticket id response when calling equipment request",
    () async {
      // Arrange
      when(
        () => mockEaserCatalogRepositoryImp!
            .equipmentRequest(requestModel: tRequestModel),
      ).thenAnswer(
          (invocation) async => Right(tEquipmentRequestResultResponse));
      // Act
      final result = await equipmentRequestUseCase!(
          EquipmentRequestUseCaseParams(requestModel: tRequestModel));
      // Assert
      expect(result, Right(tEquipmentRequestResultResponse));
      verify(
        () => mockEaserCatalogRepositoryImp!
            .equipmentRequest(requestModel: tRequestModel),
      );
      verifyNoMoreInteractions(mockEaserCatalogRepositoryImp);
    },
  );
  test(
    "should return error calling equipment request uscase",
    () async {
      // Arrange
      when(
        () => mockEaserCatalogRepositoryImp!
            .equipmentRequest(requestModel: tRequestModel),
      ).thenAnswer((invocation) async => Left(tEquipmentRequestErrorResponse));
      // Act
      final result = await equipmentRequestUseCase!(
          EquipmentRequestUseCaseParams(requestModel: tRequestModel));
      // Assert
      expect(result, Left(tEquipmentRequestErrorResponse));
      verify(
        () => mockEaserCatalogRepositoryImp!
            .equipmentRequest(requestModel: tRequestModel),
      );
      verifyNoMoreInteractions(mockEaserCatalogRepositoryImp);
    },
  );
}
