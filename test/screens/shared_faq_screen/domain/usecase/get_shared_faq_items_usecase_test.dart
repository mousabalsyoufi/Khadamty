import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/core/api_handler/error_message.dart';
import 'package:faciltateur_de_vies/core/api_handler/response_handler.dart';
import 'package:faciltateur_de_vies/screens/shared_faq_screen/data/repository/shared_faqs_repository.dart';
import 'package:faciltateur_de_vies/screens/shared_faq_screen/domain/usecase/get_shared_faq_items_usecase.dart';
import 'package:faciltateur_de_vies/shared_models/shared_faq_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockSharedFaqsRepositoryImp extends Mock
    implements SharedFaqsRepositoryImp {}

void main() {
  late MockSharedFaqsRepositoryImp? mockSharedFaqsRepositoryImp;
  late GetSharedFaqItemsUseCase? getSharedFaqItemsUseCase;

  setUp(() {
    mockSharedFaqsRepositoryImp = MockSharedFaqsRepositoryImp();
    getSharedFaqItemsUseCase =
        GetSharedFaqItemsUseCase(mockSharedFaqsRepositoryImp);
  });

  const tCategoryId = 1;

  final tFaqsResponse = [
    SharedFaqModel(
      id: 'id',
      label: 'label',
      description: 'description',
    )
  ];

  final tresult = ApiResponse.completed(tFaqsResponse);
  final ApiResponse<List<SharedFaqModel>> tErrorResponse =
      ApiResponse.error(ErrorMessages.dioDefault);

  test(
    "should return list of faq model response when calling get shared faq items",
    () async {
      // Arrange
      when(
        () => mockSharedFaqsRepositoryImp!.getSharedFaqItems(id: tCategoryId),
      ).thenAnswer((invocation) async => Right(tresult));
      // Act
      final result = await getSharedFaqItemsUseCase!(
          SharedFaqItemsParams(id: tCategoryId));
      // Assert
      expect(result, Right(tresult));
      verify(
        () => mockSharedFaqsRepositoryImp!.getSharedFaqItems(id: tCategoryId),
      );
      verifyNoMoreInteractions(mockSharedFaqsRepositoryImp);
    },
  );
  test(
    "should return error calling get shared faq items",
    () async {
      // Arrange
      when(
        () => mockSharedFaqsRepositoryImp!.getSharedFaqItems(id: tCategoryId),
      ).thenAnswer((invocation) async => Left(tErrorResponse));
      // Act
      final result = await getSharedFaqItemsUseCase!(
          SharedFaqItemsParams(id: tCategoryId));
      // Assert
      expect(result, Left(tErrorResponse));
      verify(
        () => mockSharedFaqsRepositoryImp!.getSharedFaqItems(id: tCategoryId),
      );
      verifyNoMoreInteractions(mockSharedFaqsRepositoryImp);
    },
  );
}
