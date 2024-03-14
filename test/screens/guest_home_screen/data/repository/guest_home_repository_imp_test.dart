import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/core/api_handler/error_message.dart';
import 'package:faciltateur_de_vies/core/api_handler/response_handler.dart';
import 'package:faciltateur_de_vies/screens/guest_home_screen.dart/data/data_source/categories_provider/guest_categories_api_imp.dart';
import 'package:faciltateur_de_vies/screens/guest_home_screen.dart/data/repository/guest_home_repository_imp.dart';
import 'package:faciltateur_de_vies/shared_models/category_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGuestCategoriesApiImp extends Mock implements GuestCategoriesApiImp {}

void main() {
  late MockGuestCategoriesApiImp? mockGuestCategoriesApiImp;
  late GuestHomeRepositoryImp? guestHomeRepositoryImp;

  setUp(() {
    mockGuestCategoriesApiImp = MockGuestCategoriesApiImp();
    guestHomeRepositoryImp =
        GuestHomeRepositoryImp(categoriesApiImp: mockGuestCategoriesApiImp!);
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
      when(() => mockGuestCategoriesApiImp!.getCategories())
          .thenAnswer((_) async => tresult);
      // Act
      final result = await guestHomeRepositoryImp!.getCategories();
      // Assert
      expect(result, Right(tresult));
      verify(() => mockGuestCategoriesApiImp!.getCategories());
      verifyNoMoreInteractions(mockGuestCategoriesApiImp);
    },
  );
  test(
    "get categories should return error form get categories api",
    () async {
      // Arrange
      when(() => mockGuestCategoriesApiImp!.getCategories())
          .thenAnswer((_) async => tErrorResponse);
      // Act
      final result = await guestHomeRepositoryImp!.getCategories();
      // Assert
      expect(result, Left(tErrorResponse));
      verify(() => mockGuestCategoriesApiImp!.getCategories());
      verifyNoMoreInteractions(mockGuestCategoriesApiImp);
    },
  );
}
