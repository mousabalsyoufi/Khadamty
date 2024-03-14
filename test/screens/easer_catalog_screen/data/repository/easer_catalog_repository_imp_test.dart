import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/constants/consts/consts.dart';
import 'package:faciltateur_de_vies/core/api_handler/error_message.dart';
import 'package:faciltateur_de_vies/core/api_handler/response_handler.dart';
import 'package:faciltateur_de_vies/screens/easer_catalog_screen/data/data_source/equipment_catalog_provider/equipment_catalog_api_imp.dart';
import 'package:faciltateur_de_vies/screens/easer_catalog_screen/data/data_source/equipment_request_provider/equipment_request_api_imp.dart';
import 'package:faciltateur_de_vies/screens/easer_catalog_screen/data/model/catalog_model.dart';
import 'package:faciltateur_de_vies/screens/easer_catalog_screen/data/repository/easer_catalog_repository_imp.dart';
import 'package:faciltateur_de_vies/shared_models/shared_help_ticket_request_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockEquipmentCatalogApiImp extends Mock
    implements EquipmentCatalogApiImp {}

class MockEquipmentRequestApiImp extends Mock
    implements EquipmentRequestApiImp {}

void main() {
  late MockEquipmentCatalogApiImp? mockEquipmentCatalogApiImp;
  late MockEquipmentRequestApiImp? mockEquipmentRequestApiImp;
  late EaserCatalogRepositoryImp? easerCatalogRepositoryImp;

  setUp(() {
    mockEquipmentCatalogApiImp = MockEquipmentCatalogApiImp();
    mockEquipmentRequestApiImp = MockEquipmentRequestApiImp();
    easerCatalogRepositoryImp = EaserCatalogRepositoryImp(
        equipmentCatalogApiImp: mockEquipmentCatalogApiImp!,
        equipmentRequestApiImp: mockEquipmentRequestApiImp!);
  });

  final tCatalogsResponse = [
    CatalogModel(id: 'id', label: 'label', count: 0, photo: [])
  ];

  final tCatalogsResult = ApiResponse.completed(tCatalogsResponse);
  final ApiResponse<List<CatalogModel>> tCatalogsErrorResponse =
      ApiResponse.error(ErrorMessages.dioDefault);

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

  group('get catalogs functionality group test', () {
    test(
      "get catalogs should return catalogs responsemodel",
      () async {
        // Arrange
        when(() => mockEquipmentCatalogApiImp!.getCatalogs())
            .thenAnswer((_) async => tCatalogsResult);
        // Act
        final result = await easerCatalogRepositoryImp!.getCatalogs();
        // Assert
        expect(result, Right(tCatalogsResult));
        verify(() => mockEquipmentCatalogApiImp!.getCatalogs());
        verifyNoMoreInteractions(mockEquipmentCatalogApiImp);
      },
    );
    test(
      "get catalogs should return error form get catalogs api",
      () async {
        // Arrange
        when(() => mockEquipmentCatalogApiImp!.getCatalogs())
            .thenAnswer((_) async => tCatalogsErrorResponse);
        // Act
        final result = await easerCatalogRepositoryImp!.getCatalogs();
        // Assert
        expect(result, Left(tCatalogsErrorResponse));
        verify(() => mockEquipmentCatalogApiImp!.getCatalogs());
        verifyNoMoreInteractions(mockEquipmentCatalogApiImp);
      },
    );
  });
  group('equipment request functionality group test', () {
    test(
      "equipment request should return ticket id",
      () async {
        // Arrange
        when(() => mockEquipmentRequestApiImp!
                .equipmentRequest(requestModel: tRequestModel))
            .thenAnswer((_) async => tEquipmentRequestResultResponse);
        // Act
        final result = await easerCatalogRepositoryImp!
            .equipmentRequest(requestModel: tRequestModel);
        // Assert
        expect(result, Right(tEquipmentRequestResultResponse));
        verify(() => mockEquipmentRequestApiImp!
            .equipmentRequest(requestModel: tRequestModel));
        verifyNoMoreInteractions(mockEquipmentRequestApiImp);
      },
    );
    test(
      "equipment request should return error form equipment request api",
      () async {
        // Arrange
        when(() => mockEquipmentRequestApiImp!
                .equipmentRequest(requestModel: tRequestModel))
            .thenAnswer((_) async => tEquipmentRequestErrorResponse);
        // Act
        final result = await easerCatalogRepositoryImp!
            .equipmentRequest(requestModel: tRequestModel);
        // Assert
        expect(result, Left(tEquipmentRequestErrorResponse));
        verify(() => mockEquipmentRequestApiImp!
            .equipmentRequest(requestModel: tRequestModel));
        verifyNoMoreInteractions(mockEquipmentRequestApiImp);
      },
    );
  });
}
