import 'package:faciltateur_de_vies/screens/easer_catalog_screen/business_logic/provider/easer_catalog_provider.dart';
import 'package:faciltateur_de_vies/screens/easer_catalog_screen/domain/usecase/equipment_request_usecase.dart';
import 'package:faciltateur_de_vies/screens/easer_catalog_screen/domain/usecase/get_easer_catalogs_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockEquipmentRequestUseCase extends Mock
    implements EquipmentRequestUseCase {}

class MockGetEaserCatalogsUseCase extends Mock
    implements GetEaserCatalogsUseCase {}

void main() async {
  late MockEquipmentRequestUseCase? mockEquipmentRequestUseCase;
  late MockGetEaserCatalogsUseCase? mockGetEaserCatalogsUseCase;
  late EaserCatalogProvider? easerCatalogProvider;
  setUp(() {
    mockEquipmentRequestUseCase = MockEquipmentRequestUseCase();
    mockGetEaserCatalogsUseCase = MockGetEaserCatalogsUseCase();
    easerCatalogProvider = EaserCatalogProvider(
      mockGetEaserCatalogsUseCase!,
      mockEquipmentRequestUseCase!,
    );
  });

  group('test get easer catalogs functionality in provider', () {
    test(
      "initial values of provider should be correct",
      () async {
        // Assert
        expect(easerCatalogProvider!.isLoading, false);
        expect(easerCatalogProvider!.isError, false);
      },
    );
  });
}
