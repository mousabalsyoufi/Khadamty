import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/core/api_handler/error_message.dart';
import 'package:faciltateur_de_vies/core/api_handler/response_handler.dart';
import 'package:faciltateur_de_vies/screens/user_home_screen/data/data_source/categories_provider/user_categories_api_imp.dart';
import 'package:faciltateur_de_vies/shared_models/category_model.dart';
import 'package:faciltateur_de_vies/screens/user_home_screen/data/repository/user_home_repository_imp.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockUserCategoriesApiImp extends Mock implements UserCategoriesApiImp {}

void main() {
  late MockUserCategoriesApiImp? mockUserCategoriesApiImp;
  late UserHomeRepositoryImp? userHomeRepositoryImp;

  setUp(() {
    mockUserCategoriesApiImp = MockUserCategoriesApiImp();
    userHomeRepositoryImp =
        UserHomeRepositoryImp(categoriesApiImp: mockUserCategoriesApiImp!);
  });

  final tCategoriesResponse = [
    CategoryModel(
        id: 'id',
        color: 'ffffff',
        label: 'label',
        description: 'description',
        photo: [])
  ];

  final tresult = ApiResponse.completed(tCategoriesResponse);
  final ApiResponse<List<CategoryModel>> tErrorResponse =
      ApiResponse.error(ErrorMessages.dioDefault);

  test(
    "get categories should return cagtegories responsemodel",
    () async {
      // Arrange
      when(() => mockUserCategoriesApiImp!.getCategories())
          .thenAnswer((_) async => tresult);
      // Act
      final result = await userHomeRepositoryImp!.getCategories();
      // Assert
      expect(result, Right(tresult));
      verify(() => mockUserCategoriesApiImp!.getCategories());
      verifyNoMoreInteractions(mockUserCategoriesApiImp);
    },
  );
  test(
    "get categories should return error form get categories api",
    () async {
      // Arrange
      when(() => mockUserCategoriesApiImp!.getCategories())
          .thenAnswer((_) async => tErrorResponse);
      // Act
      final result = await userHomeRepositoryImp!.getCategories();
      // Assert
      expect(result, Left(tErrorResponse));
      verify(() => mockUserCategoriesApiImp!.getCategories());
      verifyNoMoreInteractions(mockUserCategoriesApiImp);
    },
  );
}
