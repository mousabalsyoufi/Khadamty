import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/core/api_handler/error_message.dart';
import 'package:faciltateur_de_vies/core/api_handler/response_handler.dart';
import 'package:faciltateur_de_vies/screens/shared_services_categories_screen/data/repository/shared_services_categories_repository_imp.dart';
import 'package:faciltateur_de_vies/screens/shared_services_categories_screen/domain/usecase/get_category_services_usecase.dart';
import 'package:faciltateur_de_vies/shared_models/category_service_model.dart';
import 'package:faciltateur_de_vies/shared_models/multiprice_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockSharedServicesCategoriesRepositoryImp extends Mock
    implements SharedServicesCategoriesRepositoryImp {}

void main() {
  late MockSharedServicesCategoriesRepositoryImp?
      mockSharedServicesCategoriesRepositoryImp;
  late GetCategoryServicesUseCase? getCategoryServicesUseCase;

  setUp(() {
    mockSharedServicesCategoriesRepositoryImp =
        MockSharedServicesCategoriesRepositoryImp();
    getCategoryServicesUseCase =
        GetCategoryServicesUseCase(mockSharedServicesCategoriesRepositoryImp);
  });
  const tCategoryId = '1';
  final tCategoryServicesResponse = ApiResponse.completed([
    CategoryServiceModel(
        id: '1',
        label: 'offers',
        multiprices: MultiPrice(firstPrice: '10.00', secondPrice: '10.00'),
        multipricesIncludesTax:
            MultiPrice(firstPrice: '10.00', secondPrice: '10.00'),
        multipricesTaxRate:
            MultiPrice(firstPrice: '10.00', secondPrice: '10.00'),
        price: '10.00',
        priceIcludesTax: '10.00',
        priceMin: '10.00',
        description: 'description',
        photo: [],
        images: [],
        )
  ]);
  final ApiResponse<List<CategoryServiceModel>> tErrorResponse =
      ApiResponse.error(ErrorMessages.dioDefault);

  test(
    "should return category services response when calling get category services",
    () async {
      // Arrange
      when(
        () => mockSharedServicesCategoriesRepositoryImp!
            .getCategorySrevices(id: tCategoryId),
      ).thenAnswer((invocation) async => Right(tCategoryServicesResponse));
      // Act
      final result = await getCategoryServicesUseCase!(
          CategoriesServicesParams(id: tCategoryId));
      // Assert
      expect(result, Right(tCategoryServicesResponse));
      verify(
        () => mockSharedServicesCategoriesRepositoryImp!
            .getCategorySrevices(id: tCategoryId),
      );
      verifyNoMoreInteractions(mockSharedServicesCategoriesRepositoryImp);
    },
  );
  test(
    "should return error calling get category services",
    () async {
      // Arrange
      when(
        () => mockSharedServicesCategoriesRepositoryImp!.getCategorySrevices(id: tCategoryId),
      ).thenAnswer((invocation) async => Left(tErrorResponse));
      // Act
      final result = await getCategoryServicesUseCase!(
          CategoriesServicesParams(id: tCategoryId));
      // Assert
      expect(result, Left(tErrorResponse));
      verify(
        () => mockSharedServicesCategoriesRepositoryImp!
            .getCategorySrevices(id: tCategoryId),
      );
      verifyNoMoreInteractions(mockSharedServicesCategoriesRepositoryImp);
    },
  );
}
