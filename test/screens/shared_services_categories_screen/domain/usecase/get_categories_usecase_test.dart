import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/core/api_handler/error_message.dart';
import 'package:faciltateur_de_vies/core/api_handler/response_handler.dart';
import 'package:faciltateur_de_vies/core/generic_usecase/usecase.dart';
import 'package:faciltateur_de_vies/screens/shared_services_categories_screen/data/repository/shared_services_categories_repository_imp.dart';
import 'package:faciltateur_de_vies/screens/shared_services_categories_screen/domain/usecase/get_categories_usecase.dart';
import 'package:faciltateur_de_vies/shared_models/category_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockSharedServicesCategoriesRepositoryImp extends Mock
    implements SharedServicesCategoriesRepositoryImp {}

void main() {
  late MockSharedServicesCategoriesRepositoryImp?
      mockSharedServicesCategoriesRepositoryImp;
  late GetCategoriesUseCase? getCategoriesUseCase;

  setUp(() {
    mockSharedServicesCategoriesRepositoryImp =
        MockSharedServicesCategoriesRepositoryImp();
    getCategoriesUseCase =
        GetCategoriesUseCase(mockSharedServicesCategoriesRepositoryImp);
  });

  final tCategoriesResponse = ApiResponse.completed([
    CategoryModel(
        id: '1',
        color: '000000',
        label: 'offers',
        description: 'description',
        photo: [])
  ]);
  final ApiResponse<List<CategoryModel>> tErrorResponse =
      ApiResponse.error(ErrorMessages.dioDefault);

  test(
    "should return categories response when calling get categories",
    () async {
      // Arrange
      when(
        () => mockSharedServicesCategoriesRepositoryImp!.getCategories(),
      ).thenAnswer((invocation) async => Right(tCategoriesResponse));
      // Act
      final result = await getCategoriesUseCase!(NoParams());
      // Assert
      expect(result, Right(tCategoriesResponse));
      verify(
        () => mockSharedServicesCategoriesRepositoryImp!.getCategories(),
      );
      verifyNoMoreInteractions(mockSharedServicesCategoriesRepositoryImp);
    },
  );
  test(
    "should return error calling get categories",
    () async {
      // Arrange
      when(
        () => mockSharedServicesCategoriesRepositoryImp!.getCategories(),
      ).thenAnswer((invocation) async => Left(tErrorResponse));
      // Act
      final result = await getCategoriesUseCase!(NoParams());
      // Assert
      expect(result, Left(tErrorResponse));
      verify(
        () => mockSharedServicesCategoriesRepositoryImp!.getCategories(),
      );
      verifyNoMoreInteractions(mockSharedServicesCategoriesRepositoryImp);
    },
  );
}
