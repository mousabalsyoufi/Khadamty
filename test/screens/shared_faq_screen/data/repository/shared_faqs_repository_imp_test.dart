import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/core/api_handler/error_message.dart';
import 'package:faciltateur_de_vies/core/api_handler/response_handler.dart';
import 'package:faciltateur_de_vies/screens/shared_faq_screen/data/data_source/shared_faq_items_provieder/shared_faq_items_api_imp.dart';
import 'package:faciltateur_de_vies/screens/shared_faq_screen/data/data_source/shared_faqs_provider/shared_faqs_api_imp.dart';
import 'package:faciltateur_de_vies/screens/shared_faq_screen/data/repository/shared_faqs_repository.dart';
import 'package:faciltateur_de_vies/shared_models/shared_faq_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockSharedFaqsApiImp extends Mock implements SharedFaqsApiImp {}

class MockSharedFaqItemsApiImp extends Mock implements SharedFaqItemsApiImp {}

void main() {
  late MockSharedFaqsApiImp? mockSharedFaqsApiImp;
  late MockSharedFaqItemsApiImp? mockSharedFaqItemsApiImp;
  late SharedFaqsRepositoryImp? sharedFaqsRepositoryImp;

  setUp(() {
    mockSharedFaqsApiImp = MockSharedFaqsApiImp();
    mockSharedFaqItemsApiImp = MockSharedFaqItemsApiImp();
    sharedFaqsRepositoryImp = SharedFaqsRepositoryImp(
        sharedFaqsApiImp: mockSharedFaqsApiImp!,
        sharedFaqItemsApiImp: mockSharedFaqItemsApiImp!);
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

  group('get shared faqs tests', () {
    test(
      "get shared faqs should return list of faqs",
      () async {
        // Arrange
        when(() => mockSharedFaqsApiImp!.getSharedFaqs())
            .thenAnswer((_) async => tresult);
        // Act
        final result = await sharedFaqsRepositoryImp!.getSharedFaqs();
        // Assert
        expect(result, Right(tresult));
        verify(() => mockSharedFaqsApiImp!.getSharedFaqs());
        verifyNoMoreInteractions(mockSharedFaqsApiImp);
      },
    );
    test(
      "get shared faqs should return error form shared faqs api",
      () async {
        // Arrange
        when(() => mockSharedFaqsApiImp!.getSharedFaqs())
            .thenAnswer((_) async => tErrorResponse);
        // Act
        final result = await sharedFaqsRepositoryImp!.getSharedFaqs();
        // Assert
        expect(result, Left(tErrorResponse));
        verify(() => mockSharedFaqsApiImp!.getSharedFaqs());
        verifyNoMoreInteractions(mockSharedFaqsApiImp);
      },
    );
  });
  group('get shared faq Items tests', () {
    test(
      "get shared faq Items should return list of faqs",
      () async {
        // Arrange
        when(() => mockSharedFaqItemsApiImp!.getSharedFaqItems(id: tCategoryId))
            .thenAnswer((_) async => tresult);
        // Act
        final result =
            await sharedFaqsRepositoryImp!.getSharedFaqItems(id: tCategoryId);
        // Assert
        expect(result, Right(tresult));
        verify(
            () => mockSharedFaqItemsApiImp!.getSharedFaqItems(id: tCategoryId));
        verifyNoMoreInteractions(mockSharedFaqItemsApiImp);
      },
    );
    test(
      "get shared faq Items should return error form shared faq Items api",
      () async {
        // Arrange
        when(() => mockSharedFaqItemsApiImp!.getSharedFaqItems(id: tCategoryId))
            .thenAnswer((_) async => tErrorResponse);
        // Act
        final result =
            await sharedFaqsRepositoryImp!.getSharedFaqItems(id: tCategoryId);
        // Assert
        expect(result, Left(tErrorResponse));
        verify(
            () => mockSharedFaqItemsApiImp!.getSharedFaqItems(id: tCategoryId));
        verifyNoMoreInteractions(mockSharedFaqItemsApiImp);
      },
    );
  });
}
