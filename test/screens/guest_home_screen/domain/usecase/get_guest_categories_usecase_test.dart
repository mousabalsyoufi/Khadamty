import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/core/api_handler/error_message.dart';
import 'package:faciltateur_de_vies/core/api_handler/response_handler.dart';
import 'package:faciltateur_de_vies/core/generic_usecase/usecase.dart';
import 'package:faciltateur_de_vies/screens/guest_home_screen.dart/data/repository/guest_home_repository_imp.dart';
import 'package:faciltateur_de_vies/screens/guest_home_screen.dart/domain/usecase/get_guest_categories_usecase.dart';
import 'package:faciltateur_de_vies/shared_models/category_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGuestHomeRepositoryImp extends Mock
    implements GuestHomeRepositoryImp {}

void main() {
  late MockGuestHomeRepositoryImp? mockGuestHomeRepositoryImp;
  late GetGuestCategoriesUseCase? getGuestCategoriesUseCase;

  setUp(() {
    mockGuestHomeRepositoryImp = MockGuestHomeRepositoryImp();
    getGuestCategoriesUseCase =
        GetGuestCategoriesUseCase(mockGuestHomeRepositoryImp);
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
        () => mockGuestHomeRepositoryImp!.getCategories(),
      ).thenAnswer((invocation) async => Right(tresult));
      // Act
      final result = await getGuestCategoriesUseCase!(NoParams());
      // Assert
      expect(result, Right(tresult));
      verify(
        () => mockGuestHomeRepositoryImp!.getCategories(),
      );
      verifyNoMoreInteractions(mockGuestHomeRepositoryImp);
    },
  );
  test(
    "should return error calling get categories",
    () async {
      // Arrange
      when(
        () => mockGuestHomeRepositoryImp!.getCategories(),
      ).thenAnswer((invocation) async => Left(tErrorResponse));
      // Act
      final result = await getGuestCategoriesUseCase!(NoParams());
      // Assert
      expect(result, Left(tErrorResponse));
      verify(
        () => mockGuestHomeRepositoryImp!.getCategories(),
      );
      verifyNoMoreInteractions(mockGuestHomeRepositoryImp);
    },
  );
}
