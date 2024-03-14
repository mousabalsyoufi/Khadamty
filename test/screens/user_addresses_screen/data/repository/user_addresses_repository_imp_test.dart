import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/core/api_handler/error_message.dart';
import 'package:faciltateur_de_vies/core/api_handler/response_handler.dart';
import 'package:faciltateur_de_vies/screens/user_addresses_screen/data/data_source/delete_address_provider/delete_address_api_imp.dart';
import 'package:faciltateur_de_vies/screens/user_addresses_screen/data/data_source/user_addresses_provider/user_addresses_api_imp.dart';
import 'package:faciltateur_de_vies/screens/user_addresses_screen/data/repository/user_addresses_repository_imp.dart';
import 'package:faciltateur_de_vies/shared_models/address_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockUserAddressesApiImp extends Mock implements UserAddressesApiImp {}

class MockDeleteAddressApiImp extends Mock implements DeleteAddressApiImp {}

void main() {
  late MockUserAddressesApiImp? mockUserAddressesApiImp;
  late MockDeleteAddressApiImp? mockDeleteAddressApiImp;
  late UserAddressesRepositoryImp? userAddressesRepositoryImp;

  setUp(() {
    mockUserAddressesApiImp = MockUserAddressesApiImp();
    mockDeleteAddressApiImp = MockDeleteAddressApiImp();
    userAddressesRepositoryImp = UserAddressesRepositoryImp(
        userAddressesApiImp: mockUserAddressesApiImp!,
        deleteAddressApiImp: mockDeleteAddressApiImp!);
  });

  const tAddressId = '1';
  const tDeleteAddressResponse = 'Address was deleted successfully';

  final tDeleteResult = ApiResponse.completed(tDeleteAddressResponse);
  final ApiResponse<String> tDeleteErrorResponse =
      ApiResponse.error(ErrorMessages.dioDefault);

  final tAddressesResponse = [
    AddressModel(
        id: '1',
        email: 'mohammad@gmail.com',
        lastname: 'mohammad',
        address: 'address',
        zip: '00000',
        town: 'town',
        arrayOptions:
            ArrayOptions(lat: '20.0000', long: '20.0000', surface: '100')),
  ];

  final tAddressesResult = ApiResponse.completed(tAddressesResponse);
  final ApiResponse<List<AddressModel>> tAddressesErrorResponse =
      ApiResponse.error(ErrorMessages.dioDefault);

  group('get addresses test case', () {
    test(
      "get addresses should return address responsemodel",
      () async {
        // Arrange
        when(() => mockUserAddressesApiImp!.getAddresses())
            .thenAnswer((_) async => tAddressesResult);
        // Act
        final result = await userAddressesRepositoryImp!.getAddresses();
        // Assert
        expect(result, Right(tAddressesResult));
        verify(() => mockUserAddressesApiImp!.getAddresses());
        verifyNoMoreInteractions(mockUserAddressesApiImp);
      },
    );
    test(
      "get addresses should return error form get addresses api",
      () async {
        // Arrange
        when(() => mockUserAddressesApiImp!.getAddresses())
            .thenAnswer((_) async => tAddressesErrorResponse);
        // Act
        final result = await userAddressesRepositoryImp!.getAddresses();
        // Assert
        expect(result, Left(tAddressesErrorResponse));
        verify(() => mockUserAddressesApiImp!.getAddresses());
        verifyNoMoreInteractions(mockUserAddressesApiImp);
      },
    );
  });
  group('delete address test case', () {
    test(
      "delete address should return success message",
      () async {
        // Arrange
        when(() => mockDeleteAddressApiImp!.deleteAddress(id: tAddressId))
            .thenAnswer((_) async => tDeleteResult);
        // Act
        final result =
            await userAddressesRepositoryImp!.deleteAddress(id: tAddressId);
        // Assert
        expect(result, Right(tDeleteResult));
        verify(() => mockDeleteAddressApiImp!.deleteAddress(id: tAddressId));
        verifyNoMoreInteractions(mockDeleteAddressApiImp);
      },
    );
    test(
      "delete address should return error form delete address api",
      () async {
        // Arrange
        when(() => mockDeleteAddressApiImp!.deleteAddress(id: tAddressId))
            .thenAnswer((_) async => tDeleteErrorResponse);
        // Act
        final result =
            await userAddressesRepositoryImp!.deleteAddress(id: tAddressId);
        // Assert
        expect(result, Left(tDeleteErrorResponse));
        verify(() => mockDeleteAddressApiImp!.deleteAddress(id: tAddressId));
        verifyNoMoreInteractions(mockDeleteAddressApiImp);
      },
    );
  });
}
