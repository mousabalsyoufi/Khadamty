import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/core/api_handler/error_message.dart';
import 'package:faciltateur_de_vies/core/api_handler/response_handler.dart';
import 'package:faciltateur_de_vies/core/generic_usecase/usecase.dart';
import 'package:faciltateur_de_vies/screens/easer_help_screen/data/repository/easer_help_repository_imp.dart';
import 'package:faciltateur_de_vies/screens/easer_help_screen/domain/usecase/get_easer_faqs_usecase.dart';
import 'package:faciltateur_de_vies/shared_models/shared_faq_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockEaserHelpRepositoryImp extends Mock
    implements EaserHelpRepositoryImp {}

void main() {
  late MockEaserHelpRepositoryImp? mockEaserHelpRepositoryImp;
  late GetEaserFaqsUseCase? getEaserFaqsUseCase;

  setUp(() {
    mockEaserHelpRepositoryImp = MockEaserHelpRepositoryImp();
    getEaserFaqsUseCase = GetEaserFaqsUseCase(mockEaserHelpRepositoryImp);
  });

  final tFaqsResponse = [
    SharedFaqModel(id: '1', label: 'faq label', description: 'faq desc')
  ];

  final tresult = ApiResponse.completed(tFaqsResponse);
  final ApiResponse<List<SharedFaqModel>> tErrorResponse =
      ApiResponse.error(ErrorMessages.dioDefault);

  test(
    "should return faqs model response when calling get faqs",
    () async {
      // Arrange
      when(
        () => mockEaserHelpRepositoryImp!.getEaserFaqs(),
      ).thenAnswer((invocation) async => Right(tresult));
      // Act
      final result = await getEaserFaqsUseCase!(NoParams());
      // Assert
      expect(result, Right(tresult));
      verify(
        () => mockEaserHelpRepositoryImp!.getEaserFaqs(),
      );
      verifyNoMoreInteractions(mockEaserHelpRepositoryImp);
    },
  );
  test(
    "should return error calling get faqs",
    () async {
      // Arrange
      when(
        () => mockEaserHelpRepositoryImp!.getEaserFaqs(),
      ).thenAnswer((invocation) async => Left(tErrorResponse));
      // Act
      final result = await getEaserFaqsUseCase!(NoParams());
      // Assert
      expect(result, Left(tErrorResponse));
      verify(
        () => mockEaserHelpRepositoryImp!.getEaserFaqs(),
      );
      verifyNoMoreInteractions(mockEaserHelpRepositoryImp);
    },
  );
}
