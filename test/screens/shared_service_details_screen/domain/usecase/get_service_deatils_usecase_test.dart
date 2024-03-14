import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/core/api_handler/error_message.dart';
import 'package:faciltateur_de_vies/core/api_handler/response_handler.dart';
import 'package:faciltateur_de_vies/screens/shared_service_details_screen/data/models/service_details_model.dart';
import 'package:faciltateur_de_vies/screens/shared_service_details_screen/data/repository/service_details_repository_imp.dart';
import 'package:faciltateur_de_vies/screens/shared_service_details_screen/domain/usecase/get_service_details_usecase.dart';
import 'package:faciltateur_de_vies/shared_models/multiprice_model.dart';
import 'package:faciltateur_de_vies/shared_models/service_product_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockServiceDetailsRepositoryImp extends Mock implements ServiceDetailsRepositoryImp {}

void main() {
  late MockServiceDetailsRepositoryImp? mockServiceDetailsRepositoryImp;
  late GetServiceDetailsUseCase? getServiceDetailsUseCase;

  setUp(() {
    mockServiceDetailsRepositoryImp = MockServiceDetailsRepositoryImp();
    getServiceDetailsUseCase = GetServiceDetailsUseCase(mockServiceDetailsRepositoryImp);
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
    "should return service deatils model response when calling get service details",
    () async {
      // Arrange
      when(
        () => mockServiceDetailsRepositoryImp!
            .getServiceDetails(id: tServiceId),
      ).thenAnswer((invocation) async => Right(tServiceDetailsResponse));
      // Act
      final result = await getServiceDetailsUseCase!(
          ServiceDetailsParams(id: tServiceId));
      // Assert
      expect(result, Right(tServiceDetailsResponse));
      verify(
        () => mockServiceDetailsRepositoryImp!
            .getServiceDetails(id: tServiceId),
      );
      verifyNoMoreInteractions(mockServiceDetailsRepositoryImp);
    },
  );
  test(
    "should return error calling get service details",
    () async {
      // Arrange
      when(
        () => mockServiceDetailsRepositoryImp!
            .getServiceDetails(id: tServiceId),
      ).thenAnswer((invocation) async => Left(tErrorResponse));
      // Act
      final result = await getServiceDetailsUseCase!(
          ServiceDetailsParams(id: tServiceId));
      // Assert
      expect(result, Left(tErrorResponse));
      verify(
        () => mockServiceDetailsRepositoryImp!
            .getServiceDetails(id: tServiceId),
      );
      verifyNoMoreInteractions(mockServiceDetailsRepositoryImp);
    },
  );
}

