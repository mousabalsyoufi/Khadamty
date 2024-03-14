import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/core/api_handler/error_message.dart';
import 'package:faciltateur_de_vies/core/api_handler/response_handler.dart';
import 'package:faciltateur_de_vies/shared_widgets/bottom_sheets/history_rating_bottom_sheet/data/model/rating_request_model.dart';
import 'package:faciltateur_de_vies/shared_widgets/bottom_sheets/history_rating_bottom_sheet/data/repository/rating_repository_imp.dart';
import 'package:faciltateur_de_vies/shared_widgets/bottom_sheets/history_rating_bottom_sheet/domain/usecase/rating_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockRatingRepositoryImp extends Mock implements RatingRepositoryImp {}

void main() {
  late MockRatingRepositoryImp? mockRatingRepositoryImp;
  late RatingUseCase? ratingUseCase;

  setUp(() {
    mockRatingRepositoryImp = MockRatingRepositoryImp();
    ratingUseCase = RatingUseCase(mockRatingRepositoryImp);
  });

  final RatingRequestModel tRateModel = RatingRequestModel(
      orderId: '1',
      serviceId: '1',
      efficacite: '3',
      ponctualite: '3',
      presentation: '3',
      avisgeneral: 'good service',
      iseval: '13-12-2022');
  const tRatingResponse = '1';

  // response contains order id
  final tResult = ApiResponse.completed(tRatingResponse);
  final ApiResponse<String> tErrorResponse =
      ApiResponse.error(ErrorMessages.dioDefault);

  test(
    "should return order id response when calling rate service",
    () async {
      // Arrange
      when(
        () => mockRatingRepositoryImp!.rateService(requestModel: tRateModel),
      ).thenAnswer((invocation) async => Right(tResult));
      // Act
      final result =
          await ratingUseCase!(RatingUseCaseParams(requestModel: tRateModel));
      // Assert
      expect(result, Right(tResult));
      verify(
        () => mockRatingRepositoryImp!.rateService(requestModel: tRateModel),
      );
      verifyNoMoreInteractions(mockRatingRepositoryImp);
    },
  );
  test(
    "should return error calling rate service uscase",
    () async {
      // Arrange
      when(
        () => mockRatingRepositoryImp!.rateService(requestModel: tRateModel),
      ).thenAnswer((invocation) async => Left(tErrorResponse));
      // Act
      final result =
          await ratingUseCase!(RatingUseCaseParams(requestModel: tRateModel));
      // Assert
      expect(result, Left(tErrorResponse));
      verify(
        () => mockRatingRepositoryImp!.rateService(requestModel: tRateModel),
      );
      verifyNoMoreInteractions(mockRatingRepositoryImp);
    },
  );
}
