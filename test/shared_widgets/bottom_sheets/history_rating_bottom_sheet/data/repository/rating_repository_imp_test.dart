import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/core/api_handler/error_message.dart';
import 'package:faciltateur_de_vies/core/api_handler/response_handler.dart';
import 'package:faciltateur_de_vies/shared_widgets/bottom_sheets/history_rating_bottom_sheet/data/datasource/rating_provider/rating_api_imp.dart';
import 'package:faciltateur_de_vies/shared_widgets/bottom_sheets/history_rating_bottom_sheet/data/model/rating_request_model.dart';
import 'package:faciltateur_de_vies/shared_widgets/bottom_sheets/history_rating_bottom_sheet/data/repository/rating_repository_imp.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockRatingApiImp extends Mock implements RatingApiImp {}

void main() {
  late MockRatingApiImp? mockRatingApiImp;
  late RatingRepositoryImp? ratingRepositoryImp;

  setUp(() {
    mockRatingApiImp = MockRatingApiImp();
    ratingRepositoryImp = RatingRepositoryImp(mockRatingApiImp!);
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

  final tresult = ApiResponse.completed(tRatingResponse);
  final ApiResponse<String> tErrorResponse =
      ApiResponse.error(ErrorMessages.dioDefault);

  test(
    "rate service should return success order id",
    () async {
      // Arrange
      when(() => mockRatingApiImp!.rateService(requestModel: tRateModel))
          .thenAnswer((_) async => tresult);
      // Act
      final result =
          await ratingRepositoryImp!.rateService(requestModel: tRateModel);
      // Assert
      expect(result, Right(tresult));
      verify(() => mockRatingApiImp!.rateService(requestModel: tRateModel));
      verifyNoMoreInteractions(mockRatingApiImp);
    },
  );
  test(
    "rate service should return error form rate service api",
    () async {
      // Arrange
      when(() => mockRatingApiImp!.rateService(requestModel: tRateModel))
          .thenAnswer((_) async => tErrorResponse);
      // Act
      final result =
          await ratingRepositoryImp!.rateService(requestModel: tRateModel);
      // Assert
      expect(result, Left(tErrorResponse));
      verify(() => mockRatingApiImp!.rateService(requestModel: tRateModel));
      verifyNoMoreInteractions(mockRatingApiImp);
    },
  );
}
