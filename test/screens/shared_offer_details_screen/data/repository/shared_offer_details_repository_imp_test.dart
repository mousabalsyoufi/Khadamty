import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/core/api_handler/error_message.dart';
import 'package:faciltateur_de_vies/core/api_handler/response_handler.dart';
import 'package:faciltateur_de_vies/screens/shared_offer_details_screen/data/data_source/offer_details_provider/offer_details_api_imp.dart';
import 'package:faciltateur_de_vies/screens/shared_offer_details_screen/data/model/offer_details_model.dart';
import 'package:faciltateur_de_vies/screens/shared_offer_details_screen/data/repository/offer_details_repository_imp.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockOfferDetailsApiImp extends Mock implements OfferDetailsApiImp {}

void main() {
  late MockOfferDetailsApiImp? mockOfferDetailsApiImp;
  late OfferDetailsRepositoryImp? offerDetailsRepositoryImp;

  setUp(() {
    mockOfferDetailsApiImp = MockOfferDetailsApiImp();
    offerDetailsRepositoryImp =
        OfferDetailsRepositoryImp(mockOfferDetailsApiImp!);
  });

  const tOfferId = '1';
  final List<OfferDetailsModel> tOfferDetailsModel = [
    OfferDetailsModel(
      condition: 'conditions',
      color: '00000',
      description: 'description for offer details',
      id: '1',
      label: 'home offer',
      products: [],
      isSelected: false,
    )
  ];
  final tOfferDetailsResponse = ApiResponse.completed(tOfferDetailsModel);
  final ApiResponse<List<OfferDetailsModel>> tErrorResponse =
      ApiResponse.error(ErrorMessages.dioDefault);

  test(
    "offer Details should return offer Details responsemodel",
    () async {
      // Arrange
      when(() => mockOfferDetailsApiImp!.getOfferDdetails(id: tOfferId))
          .thenAnswer((_) async => tOfferDetailsResponse);
      // Act
      final result =
          await offerDetailsRepositoryImp!.getOfferDetails(id: tOfferId);
      // Assert
      expect(result, Right(tOfferDetailsResponse));
      verify(() => mockOfferDetailsApiImp!.getOfferDdetails(id: tOfferId));
      verifyNoMoreInteractions(mockOfferDetailsApiImp);
    },
  );
  test(
    "offer details should return error form offer details api",
    () async {
      // Arrange
      when(() => mockOfferDetailsApiImp!.getOfferDdetails(id: tOfferId))
          .thenAnswer((_) async => tErrorResponse);
      // Act
      final result =
          await offerDetailsRepositoryImp!.getOfferDetails(id: tOfferId);
      // Assert
      expect(result, Left(tErrorResponse));
      verify(() => mockOfferDetailsApiImp!.getOfferDdetails(id: tOfferId));
      verifyNoMoreInteractions(mockOfferDetailsApiImp);
    },
  );
}
