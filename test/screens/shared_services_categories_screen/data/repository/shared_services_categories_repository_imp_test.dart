import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/core/api_handler/error_message.dart';
import 'package:faciltateur_de_vies/core/api_handler/response_handler.dart';
import 'package:faciltateur_de_vies/screens/shared_services_categories_screen/data/data_source/categories_provider/categories_api_imp.dart';
import 'package:faciltateur_de_vies/screens/shared_services_categories_screen/data/data_source/category_services_provider/category_services_api_imp.dart';
import 'package:faciltateur_de_vies/screens/shared_services_categories_screen/data/data_source/offers_provider/offers_api_imp.dart';
import 'package:faciltateur_de_vies/screens/shared_services_categories_screen/data/repository/shared_services_categories_repository_imp.dart';
import 'package:faciltateur_de_vies/shared_models/category_model.dart';
import 'package:faciltateur_de_vies/shared_models/category_service_model.dart';
import 'package:faciltateur_de_vies/shared_models/multiprice_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGetCategoriesApiImp extends Mock implements CategoriesApiImp {}

class MockGetCategoryServicesApiImp extends Mock
    implements CategoryServicesApiImp {}

class MockGetOffersApiImp extends Mock implements OffersApiImp {}

void main() {
  late MockGetCategoriesApiImp? mockGetCategoriesApiImp;
  late MockGetCategoryServicesApiImp? mockGetCategoryServicesApiImp;
  late MockGetOffersApiImp? mockGetOffersApiImp;
  late SharedServicesCategoriesRepositoryImp?
      sharedServicesCategoriesRepositoryImp;

  setUp(() {
    mockGetCategoriesApiImp = MockGetCategoriesApiImp();
    mockGetCategoryServicesApiImp = MockGetCategoryServicesApiImp();
    mockGetOffersApiImp = MockGetOffersApiImp();
    sharedServicesCategoriesRepositoryImp =
        SharedServicesCategoriesRepositoryImp(
            categoriesApiImp: mockGetCategoriesApiImp!,
            categoryServicesApiImp: mockGetCategoryServicesApiImp!,
            offersApiImp: mockGetOffersApiImp!);
  });

  const tCategoryId = '1';
  final tCategoriesResponse = ApiResponse.completed([
    CategoryModel(
        id: '1',
        color: '000000',
        label: 'offers',
        description: 'description',
        photo: [])
  ]);
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
  final ApiResponse<List<CategoryServiceModel>> tErrorCategoryServiceResponse =
      ApiResponse.error(ErrorMessages.dioDefault);
  final ApiResponse<List<CategoryModel>> tErrorCategoryResponse =
      ApiResponse.error(ErrorMessages.dioDefault);

  group('get categories Feature Test Group', () {
    test(
      "get categories should return category responsemodel",
      () async {
        // Arrange
        when(() => mockGetCategoriesApiImp!.getCategories())
            .thenAnswer((_) async => tCategoriesResponse);
        // Act
        final result =
            await sharedServicesCategoriesRepositoryImp!.getCategories();
        // Assert
        expect(result, Right(tCategoriesResponse));
        verify(() => mockGetCategoriesApiImp!.getCategories());
        verifyNoMoreInteractions(mockGetCategoriesApiImp);
      },
    );
    test(
      "get categories should return error form get categories api",
      () async {
        // Arrange
        when(() => mockGetCategoriesApiImp!.getCategories())
            .thenAnswer((_) async => tErrorCategoryResponse);
        // Act
        final result =
            await sharedServicesCategoriesRepositoryImp!.getCategories();
        // Assert
        expect(result, Left(tErrorCategoryResponse));
        verify(() => mockGetCategoriesApiImp!.getCategories());
        verifyNoMoreInteractions(mockGetCategoriesApiImp);
      },
    );
  });

  group('get category services Feature Test', () {
    test(
      "get category services should return category services response",
      () async {
        // Arrange
        when(() => mockGetCategoryServicesApiImp!.getServices(id: tCategoryId))
            .thenAnswer((_) async => tCategoryServicesResponse);
        // Act
        final result = await sharedServicesCategoriesRepositoryImp!
            .getCategorySrevices(id: tCategoryId);
        // Assert
        expect(result, Right(tCategoryServicesResponse));
        verify(
            () => mockGetCategoryServicesApiImp!.getServices(id: tCategoryId));
        verifyNoMoreInteractions(mockGetCategoryServicesApiImp);
      },
    );
    test(
      "get category services should return error form get category services api",
      () async {
        // Arrange
        when(() => mockGetCategoryServicesApiImp!.getServices(id: tCategoryId))
            .thenAnswer((_) async => tErrorCategoryServiceResponse);
        // Act
        final result = await sharedServicesCategoriesRepositoryImp!
            .getCategorySrevices(id: tCategoryId);
        // Assert
        expect(result, Left(tErrorCategoryServiceResponse));
        verify(
            () => mockGetCategoryServicesApiImp!.getServices(id: tCategoryId));
        verifyNoMoreInteractions(mockGetCategoryServicesApiImp);
      },
    );
  });

  group('get offers Feature Test', () {
    test(
      "get offers should return category services response",
      () async {
        // Arrange
        when(() => mockGetOffersApiImp!.getOffers())
            .thenAnswer((_) async => tCategoryServicesResponse);
        // Act
        final result = await sharedServicesCategoriesRepositoryImp!.getOffers();
        // Assert
        expect(result, Right(tCategoryServicesResponse));
        verify(() => mockGetOffersApiImp!.getOffers());
        verifyNoMoreInteractions(mockGetOffersApiImp);
      },
    );
    test(
      "get offers should return error form get category services api",
      () async {
        // Arrange
        when(() => mockGetOffersApiImp!.getOffers())
            .thenAnswer((_) async => tErrorCategoryServiceResponse);
        // Act
        final result = await sharedServicesCategoriesRepositoryImp!.getOffers();
        // Assert
        expect(result, Left(tErrorCategoryServiceResponse));
        verify(() => mockGetOffersApiImp!.getOffers());
        verifyNoMoreInteractions(mockGetOffersApiImp);
      },
    );
  });
}
