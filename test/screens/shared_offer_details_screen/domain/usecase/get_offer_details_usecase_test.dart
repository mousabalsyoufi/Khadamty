import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/core/api_handler/error_message.dart';
import 'package:faciltateur_de_vies/core/api_handler/response_handler.dart';
import 'package:faciltateur_de_vies/screens/shared_offer_details_screen/data/model/offer_details_model.dart';
import 'package:faciltateur_de_vies/screens/shared_offer_details_screen/data/repository/offer_details_repository_imp.dart';
import 'package:faciltateur_de_vies/screens/shared_offer_details_screen/domain/usecase/get_offer_details_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockOfferDetailsRepositoryImp extends Mock
    implements OfferDetailsRepositoryImp {}

void main() {
  late MockOfferDetailsRepositoryImp? mockOfferDetailsRepositoryImp;
  late GetOfferDetailsUseCase? getOfferDetailsUseCase;

  setUp(() {
    mockOfferDetailsRepositoryImp = MockOfferDetailsRepositoryImp();
    getOfferDetailsUseCase =
        GetOfferDetailsUseCase(mockOfferDetailsRepositoryImp);
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
    "should return offer deatils model response when calling get offer details",
    () async {
      // Arrange
      when(
        () => mockOfferDetailsRepositoryImp!.getOfferDetails(id: tOfferId),
      ).thenAnswer((invocation) async => Right(tOfferDetailsResponse));
      // Act
      final result =
          await getOfferDetailsUseCase!(OfferDetailsParams(id: tOfferId));
      // Assert
      expect(result, Right(tOfferDetailsResponse));
      verify(
        () => mockOfferDetailsRepositoryImp!.getOfferDetails(id: tOfferId),
      );
      verifyNoMoreInteractions(mockOfferDetailsRepositoryImp);
    },
  );
  test(
    "should return error calling get offer details",
    () async {
      // Arrange
      when(
        () => mockOfferDetailsRepositoryImp!.getOfferDetails(id: tOfferId),
      ).thenAnswer((invocation) async => Left(tErrorResponse));
      // Act
      final result =
          await getOfferDetailsUseCase!(OfferDetailsParams(id: tOfferId));
      // Assert
      expect(result, Left(tErrorResponse));
      verify(
        () => mockOfferDetailsRepositoryImp!.getOfferDetails(id: tOfferId),
      );
      verifyNoMoreInteractions(mockOfferDetailsRepositoryImp);
    },
  );
}
