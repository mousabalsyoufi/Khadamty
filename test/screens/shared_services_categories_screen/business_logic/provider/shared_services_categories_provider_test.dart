import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/core/api_handler/response_handler.dart';
import 'package:faciltateur_de_vies/core/generic_usecase/usecase.dart';
import 'package:faciltateur_de_vies/screens/shared_services_categories_screen/business_logic/provider/shared_services_categories_provider.dart';
import 'package:faciltateur_de_vies/screens/shared_services_categories_screen/domain/usecase/get_categories_usecase.dart';
import 'package:faciltateur_de_vies/screens/shared_services_categories_screen/domain/usecase/get_category_services_usecase.dart';
import 'package:faciltateur_de_vies/screens/shared_services_categories_screen/domain/usecase/get_offers_usecase.dart';
import 'package:faciltateur_de_vies/shared_models/category_model.dart';
import 'package:faciltateur_de_vies/shared_models/category_service_model.dart';
import 'package:faciltateur_de_vies/shared_models/multiprice_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGetCategoriesUseCase extends Mock implements GetCategoriesUseCase {}

class MockGetCategoryServicesUseCase extends Mock
    implements GetCategoryServicesUseCase {}

class MockGetOffersUseCase extends Mock implements GetOffersUseCase{}

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  late MockGetCategoriesUseCase? mockGetCategoriesUseCase;
  late MockGetCategoryServicesUseCase? mockGetCategoryServicesUseCase;
  late MockGetOffersUseCase? mockGetOffersUseCase;
  late SharedServicesCategoriesProvider? sharedServicesCategoriesProvider;
  late NoParams noParams;
  late CategoriesServicesParams categoryServicesParams;
  setUp(() {
    mockGetCategoriesUseCase = MockGetCategoriesUseCase();
    mockGetCategoryServicesUseCase = MockGetCategoryServicesUseCase();
    mockGetOffersUseCase = MockGetOffersUseCase();
    sharedServicesCategoriesProvider = SharedServicesCategoriesProvider(
        mockGetCategoriesUseCase!, mockGetCategoryServicesUseCase!, mockGetOffersUseCase!);
    noParams = NoParams();
    categoryServicesParams = CategoriesServicesParams(id: '1');
    registerFallbackValue(noParams);
    registerFallbackValue(categoryServicesParams);
  });

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

  group('test get categories functionality in provider', () {
    test(
      "initial values of provider should be correct",
      () async {
        // Assert
        expect(sharedServicesCategoriesProvider!.isLoading, false);
        expect(sharedServicesCategoriesProvider!.isError, false);
      },
    );

    test(
      "should call get categories usecase and get data back",
      () async {
        // Arrange
        when(() => mockGetCategoriesUseCase!(any()))
            .thenAnswer((_) async => Right(tCategoriesResponse));
        when(() => mockGetCategoryServicesUseCase!(any()))
            .thenAnswer((_) async => Right(tCategoryServicesResponse));
        // Act
        await sharedServicesCategoriesProvider!.getCategories(0);
        // Assert
        expect(sharedServicesCategoriesProvider!.categories.isNotEmpty, true);
        verify(() => mockGetCategoriesUseCase!(any()));
        verify(() => mockGetCategoryServicesUseCase!(any()));
      },
    );
  });

  group('test get category services functionality in provider', () {
    test(
      "initial values of provider should be correct",
      () async {
        // Assert
        expect(sharedServicesCategoriesProvider!.servicesLoading, false);
        expect(sharedServicesCategoriesProvider!.isError, false);
      },
    );

    test(
      "should call get category services usecase and get data back",
      () async {
        // Arrange
        when(() => mockGetCategoryServicesUseCase!(any()))
            .thenAnswer((_) async => Right(tCategoryServicesResponse));
        // Act
        await sharedServicesCategoriesProvider!.getCategoryServices(id: '1');
        // Assert
        expect(sharedServicesCategoriesProvider!.services.isNotEmpty, true);
        verify(() => mockGetCategoryServicesUseCase!(any()));
      },
    );
  });
  group('test get offers functionality in provider', () {
    test(
      "initial values of provider should be correct",
      () async {
        // Assert
        expect(sharedServicesCategoriesProvider!.servicesLoading, false);
        expect(sharedServicesCategoriesProvider!.isError, false);
      },
    );

    test(
      "should call get offers usecase and get data back",
      () async {
        // Arrange
        when(() => mockGetOffersUseCase!(any()))
            .thenAnswer((_) async => Right(tCategoryServicesResponse));
        // Act
        await sharedServicesCategoriesProvider!.getOffers();
        // Assert
        expect(sharedServicesCategoriesProvider!.services.isNotEmpty, true);
        verify(() => mockGetOffersUseCase!(any()));
      },
    );
  });
}
