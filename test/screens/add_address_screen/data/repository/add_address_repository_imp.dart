import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/core/api_handler/error_message.dart';
import 'package:faciltateur_de_vies/core/api_handler/response_handler.dart';
import 'package:faciltateur_de_vies/screens/user_add_address_screen/data/data_source/add_address_provider/add_address_api_imp.dart';
import 'package:faciltateur_de_vies/screens/user_add_address_screen/data/model/address_request_model.dart';
import 'package:faciltateur_de_vies/screens/user_add_address_screen/data/repository/add_address_repository_imp.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAddAddressApiImp extends Mock implements AddAddressApiImp {}

void main() {
  late MockAddAddressApiImp? mockAddAddressApiImp;
  late AddAddressRepositoryImp? addAddressRepositoryImp;

  setUp(() {
    mockAddAddressApiImp = MockAddAddressApiImp();
    addAddressRepositoryImp = AddAddressRepositoryImp(mockAddAddressApiImp!);
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
  const tAddAddressResponse = 1;

  final tresult = ApiResponse.completed(tAddAddressResponse);
  final ApiResponse<int> tErrorResponse =
      ApiResponse.error(ErrorMessages.dioDefault);

  test(
    "add address should return success address id",
    () async {
      // Arrange
      when(() => mockAddAddressApiImp!.addAddress(addressModel: tAddressModel))
          .thenAnswer((_) async => tresult);
      // Act
      final result = await addAddressRepositoryImp!
          .addAddress(addressModel: tAddressModel);
      // Assert
      expect(result, Right(tresult));
      verify(
          () => mockAddAddressApiImp!.addAddress(addressModel: tAddressModel));
      verifyNoMoreInteractions(mockAddAddressApiImp);
    },
  );
  test(
    "add address should return error form add address api",
    () async {
      // Arrange
      when(() => mockAddAddressApiImp!.addAddress(addressModel: tAddressModel))
          .thenAnswer((_) async => tErrorResponse);
      // Act
      final result = await addAddressRepositoryImp!
          .addAddress(addressModel: tAddressModel);
      // Assert
      expect(result, Left(tErrorResponse));
      verify(
          () => mockAddAddressApiImp!.addAddress(addressModel: tAddressModel));
      verifyNoMoreInteractions(mockAddAddressApiImp);
    },
  );
}
