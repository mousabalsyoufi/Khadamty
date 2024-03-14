import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/core/api_handler/error_message.dart';
import 'package:faciltateur_de_vies/core/api_handler/response_handler.dart';
import 'package:faciltateur_de_vies/screens/user_offer_subscriber_screen/data/models/offer_subscribe_request_model.dart';
import 'package:faciltateur_de_vies/screens/user_offer_subscriber_screen/data/repository/subscribe_to_offer_repository_imp.dart';
import 'package:faciltateur_de_vies/screens/user_offer_subscriber_screen/domain/usecase/subscribe_to_offer_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockUserSubsribeToOfferRepositoryImp extends Mock
    implements SubscribeToOfferRepositoryImp {}

void main() {
  late MockUserSubsribeToOfferRepositoryImp?
      mockUserSubsribeToOfferRepositoryImp;
  late SubscribeToOfferUseCase? subscribeToOfferUseCase;

  setUp(() {
    mockUserSubsribeToOfferRepositoryImp =
        MockUserSubsribeToOfferRepositoryImp();
    subscribeToOfferUseCase =
        SubscribeToOfferUseCase(mockUserSubsribeToOfferRepositoryImp);
  });

  final OfferSubscribeRequestModel tSubscribeModel = OfferSubscribeRequestModel(
      socid: 'socid',
      date: 'date',
      type: 0,
      contactId: '1',
      offer: LineProduct(
          productId: 'productId',
          qty: '1',
          tvaTx: '20.00',
          subprice: 'subprice',
          dateStart: 'dateStart',
          dateEnd: 'dateEnd',
          desc: 'desc',
          arrayOptions: ArrayOptions(optionsIdtasks: 'optionsIdtasks')),
      childs: []);
  const tSubscribeToServiceResponse = 1;

  // response contains order id
  final tSubscribeResponse = ApiResponse.completed(tSubscribeToServiceResponse);
  final ApiResponse<int> tErrorResponse =
      ApiResponse.error(ErrorMessages.dioDefault);

  test(
    "should return order id response when calling subscribe to offer",
    () async {
      // Arrange
      when(
        () => mockUserSubsribeToOfferRepositoryImp!
            .subscribeToOffer(subscribeModel: tSubscribeModel),
      ).thenAnswer((invocation) async => Right(tSubscribeResponse));
      // Act
      final result = await subscribeToOfferUseCase!(
          SubscribeToOfferUseCaseParams(
              subscribeRequestModel: tSubscribeModel));
      // Assert
      expect(result, Right(tSubscribeResponse));
      verify(
        () => mockUserSubsribeToOfferRepositoryImp!
            .subscribeToOffer(subscribeModel: tSubscribeModel),
      );
      verifyNoMoreInteractions(mockUserSubsribeToOfferRepositoryImp);
    },
  );
  test(
    "should return error calling subscribe to offer uscase",
    () async {
      // Arrange
      when(
        () => mockUserSubsribeToOfferRepositoryImp!
            .subscribeToOffer(subscribeModel: tSubscribeModel),
      ).thenAnswer((invocation) async => Left(tErrorResponse));
      // Act
      final result = await subscribeToOfferUseCase!(
          SubscribeToOfferUseCaseParams(
              subscribeRequestModel: tSubscribeModel));
      // Assert
      expect(result, Left(tErrorResponse));
      verify(
        () => mockUserSubsribeToOfferRepositoryImp!
            .subscribeToOffer(subscribeModel: tSubscribeModel),
      );
      verifyNoMoreInteractions(mockUserSubsribeToOfferRepositoryImp);
    },
  );
}
