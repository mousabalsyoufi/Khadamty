import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/core/api_handler/error_message.dart';
import 'package:faciltateur_de_vies/core/api_handler/response_handler.dart';
import 'package:faciltateur_de_vies/screens/user_offer_subscriber_screen/data/datasource/subscribe_to_offer_provider/subscribe_to_offer_api_imp.dart';
import 'package:faciltateur_de_vies/screens/user_offer_subscriber_screen/data/models/offer_subscribe_request_model.dart';
import 'package:faciltateur_de_vies/screens/user_offer_subscriber_screen/data/repository/subscribe_to_offer_repository_imp.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockSubsribeToOfferApiImp extends Mock implements SubscribeToOfferApiImp {
}

void main() {
  late MockSubsribeToOfferApiImp? mockSubsribeToOfferApiImp;
  late SubscribeToOfferRepositoryImp? subscribeToOfferRepositoryImp;

  setUp(() {
    mockSubsribeToOfferApiImp = MockSubsribeToOfferApiImp();
    subscribeToOfferRepositoryImp =
        SubscribeToOfferRepositoryImp(mockSubsribeToOfferApiImp!);
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

  final tresult = ApiResponse.completed(tSubscribeToServiceResponse);
  final ApiResponse<int> tErrorResponse =
      ApiResponse.error(ErrorMessages.dioDefault);

  test(
    "subscribe to offer should return success order id",
    () async {
      // Arrange
      when(() => mockSubsribeToOfferApiImp!.subscribeToOffer(
          subscribeModel: tSubscribeModel)).thenAnswer((_) async => tresult);
      // Act
      final result = await subscribeToOfferRepositoryImp!
          .subscribeToOffer(subscribeModel: tSubscribeModel);
      // Assert
      expect(result, Right(tresult));
      verify(() => mockSubsribeToOfferApiImp!
          .subscribeToOffer(subscribeModel: tSubscribeModel));
      verifyNoMoreInteractions(mockSubsribeToOfferApiImp);
    },
  );
  test(
    "subscribe to offer should return error form subscribe to service api",
    () async {
      // Arrange
      when(() => mockSubsribeToOfferApiImp!
              .subscribeToOffer(subscribeModel: tSubscribeModel))
          .thenAnswer((_) async => tErrorResponse);
      // Act
      final result = await subscribeToOfferRepositoryImp!
          .subscribeToOffer(subscribeModel: tSubscribeModel);
      // Assert
      expect(result, Left(tErrorResponse));
      verify(() => mockSubsribeToOfferApiImp!
          .subscribeToOffer(subscribeModel: tSubscribeModel));
      verifyNoMoreInteractions(mockSubsribeToOfferApiImp);
    },
  );
}
