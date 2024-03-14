import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/core/api_handler/error_message.dart';
import 'package:faciltateur_de_vies/core/api_handler/response_handler.dart';
import 'package:faciltateur_de_vies/core/generic_usecase/usecase.dart';
import 'package:faciltateur_de_vies/screens/easer_catalog_screen/data/model/catalog_model.dart';
import 'package:faciltateur_de_vies/screens/easer_catalog_screen/data/repository/easer_catalog_repository_imp.dart';
import 'package:faciltateur_de_vies/screens/easer_catalog_screen/domain/usecase/get_easer_catalogs_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockEaserCatalogRepositoryImp extends Mock
    implements EaserCatalogRepositoryImp {}

void main() {
  late MockEaserCatalogRepositoryImp? mockEaserCatalogRepositoryImp;
  late GetEaserCatalogsUseCase? getEaserCatalogsUseCase;

  setUp(() {
    mockEaserCatalogRepositoryImp = MockEaserCatalogRepositoryImp();
    getEaserCatalogsUseCase =
        GetEaserCatalogsUseCase(mockEaserCatalogRepositoryImp);
  });

  final tCatalogsResponse = [
    CatalogModel(id: 'id', label: 'label', count: 0, photo: [])
  ];

  final tresult = ApiResponse.completed(tCatalogsResponse);
  final ApiResponse<List<CatalogModel>> tErrorResponse =
      ApiResponse.error(ErrorMessages.dioDefault);

  test(
    "should return catalogs model response when calling get catalogs",
    () async {
      // Arrange
      when(
        () => mockEaserCatalogRepositoryImp!.getCatalogs(),
      ).thenAnswer((invocation) async => Right(tresult));
      // Act
      final result = await getEaserCatalogsUseCase!(NoParams());
      // Assert
      expect(result, Right(tresult));
      verify(
        () => mockEaserCatalogRepositoryImp!.getCatalogs(),
      );
      verifyNoMoreInteractions(mockEaserCatalogRepositoryImp);
    },
  );
  test(
    "should return error calling get catalogs",
    () async {
      // Arrange
      when(
        () => mockEaserCatalogRepositoryImp!.getCatalogs(),
      ).thenAnswer((invocation) async => Left(tErrorResponse));
      // Act
      final result = await getEaserCatalogsUseCase!(NoParams());
      // Assert
      expect(result, Left(tErrorResponse));
      verify(
        () => mockEaserCatalogRepositoryImp!.getCatalogs(),
      );
      verifyNoMoreInteractions(mockEaserCatalogRepositoryImp);
    },
  );
}
