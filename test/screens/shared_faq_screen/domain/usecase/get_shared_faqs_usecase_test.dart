import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/core/api_handler/error_message.dart';
import 'package:faciltateur_de_vies/core/api_handler/response_handler.dart';
import 'package:faciltateur_de_vies/core/generic_usecase/usecase.dart';
import 'package:faciltateur_de_vies/screens/shared_faq_screen/data/repository/shared_faqs_repository.dart';
import 'package:faciltateur_de_vies/screens/shared_faq_screen/domain/usecase/get_shared_faqs_usecase.dart';
import 'package:faciltateur_de_vies/shared_models/shared_faq_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockSharedFaqsRepositoryImp extends Mock
    implements SharedFaqsRepositoryImp {}

void main() {
  late MockSharedFaqsRepositoryImp? mockSharedFaqsRepositoryImp;
  late GetSharedFaqsUseCase? getSharedFaqsUseCase;

  setUp(() {
    mockSharedFaqsRepositoryImp = MockSharedFaqsRepositoryImp();
    getSharedFaqsUseCase = GetSharedFaqsUseCase(mockSharedFaqsRepositoryImp);
  });

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
    "should return list of faq model response when calling get shared faqs",
    () async {
      // Arrange
      when(
        () => mockSharedFaqsRepositoryImp!.getSharedFaqs(),
      ).thenAnswer((invocation) async => Right(tresult));
      // Act
      final result = await getSharedFaqsUseCase!(NoParams());
      // Assert
      expect(result, Right(tresult));
      verify(
        () => mockSharedFaqsRepositoryImp!.getSharedFaqs(),
      );
      verifyNoMoreInteractions(mockSharedFaqsRepositoryImp);
    },
  );
  test(
    "should return error calling get shared faqs",
    () async {
      // Arrange
      when(
        () => mockSharedFaqsRepositoryImp!.getSharedFaqs(),
      ).thenAnswer((invocation) async => Left(tErrorResponse));
      // Act
      final result = await getSharedFaqsUseCase!(NoParams());
      // Assert
      expect(result, Left(tErrorResponse));
      verify(
        () => mockSharedFaqsRepositoryImp!.getSharedFaqs(),
      );
      verifyNoMoreInteractions(mockSharedFaqsRepositoryImp);
    },
  );
}
