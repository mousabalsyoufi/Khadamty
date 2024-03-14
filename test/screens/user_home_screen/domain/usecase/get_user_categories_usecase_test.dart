import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/core/api_handler/error_message.dart';
import 'package:faciltateur_de_vies/core/api_handler/response_handler.dart';
import 'package:faciltateur_de_vies/core/generic_usecase/usecase.dart';
import 'package:faciltateur_de_vies/shared_models/category_model.dart';
import 'package:faciltateur_de_vies/screens/user_home_screen/data/repository/user_home_repository_imp.dart';
import 'package:faciltateur_de_vies/screens/user_home_screen/domain/usecase/get_user_categories_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockUserHomeRepositoryImp extends Mock implements UserHomeRepositoryImp {}

void main() {
  late MockUserHomeRepositoryImp? mockUserHomeRepositoryImp;
  late GetUserCategoriesUseCase? getUserCategoriesUseCase;

  setUp(() {
    mockUserHomeRepositoryImp = MockUserHomeRepositoryImp();
    getUserCategoriesUseCase = GetUserCategoriesUseCase(mockUserHomeRepositoryImp);
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
    "should return categories model response when calling get categories",
    () async {
      // Arrange
      when(
        () => mockUserHomeRepositoryImp!
            .getCategories(),
      ).thenAnswer((invocation) async => Right(tresult));
      // Act
      final result = await getUserCategoriesUseCase!(
          NoParams());
      // Assert
      expect(result, Right(tresult));
      verify(
        () => mockUserHomeRepositoryImp!
            .getCategories(),
      );
      verifyNoMoreInteractions(mockUserHomeRepositoryImp);
    },
  );
  test(
    "should return error calling get categories",
    () async {
      // Arrange
      when(
        () => mockUserHomeRepositoryImp!
            .getCategories(),
      ).thenAnswer((invocation) async => Left(tErrorResponse));
      // Act
      final result = await getUserCategoriesUseCase!(
         NoParams());
      // Assert
      expect(result, Left(tErrorResponse));
      verify(
        () => mockUserHomeRepositoryImp!
            .getCategories(),
      );
      verifyNoMoreInteractions(mockUserHomeRepositoryImp);
    },
  );
}
