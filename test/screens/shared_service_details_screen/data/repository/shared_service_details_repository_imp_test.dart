import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/core/api_handler/error_message.dart';
import 'package:faciltateur_de_vies/core/api_handler/response_handler.dart';
import 'package:faciltateur_de_vies/screens/shared_service_details_screen/data/data_source/service_details_provider/service_details_api_imp.dart';
import 'package:faciltateur_de_vies/screens/shared_service_details_screen/data/models/service_details_model.dart';
import 'package:faciltateur_de_vies/screens/shared_service_details_screen/data/repository/service_details_repository_imp.dart';
import 'package:faciltateur_de_vies/shared_models/multiprice_model.dart';
import 'package:faciltateur_de_vies/shared_models/service_product_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockServiceDetailsApiImp extends Mock implements ServiceDetailsApiImp {}

void main() {
  late MockServiceDetailsApiImp? mockServiceDetailsApiImp;
  late ServiceDetailsRepositoryImp? serviceDetailsRepositoryImp;

  setUp(() {
    mockServiceDetailsApiImp = MockServiceDetailsApiImp();
    serviceDetailsRepositoryImp =
        ServiceDetailsRepositoryImp(mockServiceDetailsApiImp!);
  });

  const tServiceId = '1';
  final ServiceDetailsModel tServiceDetailsModel = ServiceDetailsModel(
      condition: 'conditions',
      product: ServiceProductModel(
          id: '1',
          label: 'cleaning',
          description: 'clean the full house',
          price: '25.000',
          priceMin: '25.000',
          priceIcludesTax: '27.000',
          multiprices: MultiPrice(firstPrice: '25.000', secondPrice: '27.000'),
          multipricesIncludesTax:
              MultiPrice(firstPrice: '25.000', secondPrice: '27.000'),
          multipricesTaxRate:
              MultiPrice(firstPrice: '25.000', secondPrice: '27.000')),
      photo: [],
      tasks: []);
  final tServiceDetailsResponse = ApiResponse.completed(tServiceDetailsModel);
  final ApiResponse<ServiceDetailsModel> tErrorResponse =
      ApiResponse.error(ErrorMessages.dioDefault);

  test(
    "service Details should return Service Details responsemodel",
    () async {
      // Arrange
      when(() =>
              mockServiceDetailsApiImp!.getServiceDetails(id: tServiceId))
          .thenAnswer((_) async => tServiceDetailsResponse);
      // Act
      final result = await serviceDetailsRepositoryImp!
          .getServiceDetails(id: tServiceId);
      // Assert
      expect(result, Right(tServiceDetailsResponse));
      verify(() =>
          mockServiceDetailsApiImp!.getServiceDetails(id: tServiceId));
      verifyNoMoreInteractions(mockServiceDetailsApiImp);
    },
  );
  test(
    "service details should return error form offer details api",
    () async {
      // Arrange
      when(() =>
              mockServiceDetailsApiImp!.getServiceDetails(id: tServiceId))
          .thenAnswer((_) async => tErrorResponse);
      // Act
      final result = await serviceDetailsRepositoryImp!
          .getServiceDetails(id: tServiceId);
      // Assert
      expect(result, Left(tErrorResponse));
      verify(() =>
          mockServiceDetailsApiImp!.getServiceDetails(id: tServiceId));
      verifyNoMoreInteractions(mockServiceDetailsApiImp);
    },
  );
}
