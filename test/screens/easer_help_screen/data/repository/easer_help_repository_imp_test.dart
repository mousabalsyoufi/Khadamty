import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/core/api_handler/error_message.dart';
import 'package:faciltateur_de_vies/core/api_handler/response_handler.dart';
import 'package:faciltateur_de_vies/screens/easer_help_screen/data/data_source/easer_faqs_provider/easer_faqs_api_imp.dart';
import 'package:faciltateur_de_vies/screens/easer_help_screen/data/repository/easer_help_repository_imp.dart';
import 'package:faciltateur_de_vies/shared_models/shared_faq_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockEaserFaqsApiImp extends Mock implements EaserFaqsApiImp {}

void main() {
  late MockEaserFaqsApiImp? mockEaserFaqsApiImp;
  late EaserHelpRepositoryImp? easerHelpRepositoryImp;

  setUp(() {
    mockEaserFaqsApiImp = MockEaserFaqsApiImp();
    easerHelpRepositoryImp =
        EaserHelpRepositoryImp(easerFaqsApiImp: mockEaserFaqsApiImp!);
  });

  final tFaqsResponse = [
    SharedFaqModel(id: '1', label: 'faq label', description: 'faq desc')
  ];

  final tresult = ApiResponse.completed(tFaqsResponse);
  final ApiResponse<List<SharedFaqModel>> tErrorResponse =
      ApiResponse.error(ErrorMessages.dioDefault);

  test(
    "get faqs should return faqs responsemodel",
    () async {
      // Arrange
      when(() => mockEaserFaqsApiImp!.getEaserFaqs())
          .thenAnswer((_) async => tresult);
      // Act
      final result = await easerHelpRepositoryImp!.getEaserFaqs();
      // Assert
      expect(result, Right(tresult));
      verify(() => mockEaserFaqsApiImp!.getEaserFaqs());
      verifyNoMoreInteractions(mockEaserFaqsApiImp);
    },
  );
  test(
    "get faqs should return error form get faqs api",
    () async {
      // Arrangea
      when(() => mockEaserFaqsApiImp!.getEaserFaqs())
          .thenAnswer((_) async => tErrorResponse);
      // Act
      final result = await easerHelpRepositoryImp!.getEaserFaqs();
      // Assert
      expect(result, Left(tErrorResponse));
      verify(() => mockEaserFaqsApiImp!.getEaserFaqs());
      verifyNoMoreInteractions(mockEaserFaqsApiImp);
    },
  );
}
