import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/core/api_handler/error_message.dart';
import 'package:faciltateur_de_vies/core/api_handler/response_handler.dart';
import 'package:faciltateur_de_vies/screens/user_add_address_screen/data/model/address_request_model.dart';
import 'package:faciltateur_de_vies/screens/user_add_address_screen/data/repository/add_address_repository_imp.dart';
import 'package:faciltateur_de_vies/screens/user_add_address_screen/domain/usecase/add_address_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAddAddressRepositoryImp extends Mock
    implements AddAddressRepositoryImp {}

void main() {
  late MockAddAddressRepositoryImp? mockAddAddressRepositoryImp;
  late AddAddressUseCase? addAddressUseCase;

  setUp(() {
    mockAddAddressRepositoryImp = MockAddAddressRepositoryImp();
    addAddressUseCase = AddAddressUseCase(mockAddAddressRepositoryImp);
  });

  final AddressRequestModel tAddressModel = AddressRequestModel(
      socId: '1',
      addressName: 'addressName',
      address: 'address',
      zipcode: 'zipcode',
      town: 'town',
      mobileNumber: 'mobileNumber',
      addressOwnerName: 'addressOwnerName',
      arrayOptions:
          ArrayOptions(lat: '20.0000', long: '20.0000', surface: '100'));
  const tAddreessResponse = 1;

  // response contains address id
  final tAddressResultResponse = ApiResponse.completed(tAddreessResponse);
  final ApiResponse<int> tErrorResponse =
      ApiResponse.error(ErrorMessages.dioDefault);

  test(
    "should return address id response when calling add address",
    () async {
      // Arrange
      when(
        () => mockAddAddressRepositoryImp!
            .addAddress(addressModel: tAddressModel),
      ).thenAnswer((invocation) async => Right(tAddressResultResponse));
      // Act
      final result = await addAddressUseCase!(
          AddAddressUseCaseParams(addressModel: tAddressModel));
      // Assert
      expect(result, Right(tAddressResultResponse));
      verify(
        () => mockAddAddressRepositoryImp!
            .addAddress(addressModel: tAddressModel),
      );
      verifyNoMoreInteractions(mockAddAddressRepositoryImp);
    },
  );
  test(
    "should return error calling add address uscase",
    () async {
      // Arrange
      when(
        () => mockAddAddressRepositoryImp!
            .addAddress(addressModel: tAddressModel),
      ).thenAnswer((invocation) async => Left(tErrorResponse));
      // Act
      final result = await addAddressUseCase!(
          AddAddressUseCaseParams(addressModel: tAddressModel));
      // Assert
      expect(result, Left(tErrorResponse));
      verify(
        () => mockAddAddressRepositoryImp!
            .addAddress(addressModel: tAddressModel),
      );
      verifyNoMoreInteractions(mockAddAddressRepositoryImp);
    },
  );
}
