import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/core/api_handler/error_message.dart';
import 'package:faciltateur_de_vies/core/api_handler/response_handler.dart';
import 'package:faciltateur_de_vies/core/generic_usecase/usecase.dart';
import 'package:faciltateur_de_vies/screens/user_addresses_screen/data/repository/user_addresses_repository_imp.dart';
import 'package:faciltateur_de_vies/screens/user_addresses_screen/domain/usecase/get_user_addresses_usecase.dart';
import 'package:faciltateur_de_vies/shared_models/address_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockUserAddressesRepositoryImp extends Mock
    implements UserAddressesRepositoryImp {}

void main() {
  late MockUserAddressesRepositoryImp? mockUserAddressesRepositoryImp;
  late GetUserAddressesUseCase? getUserAddressesUseCase;

  setUp(() {
    mockUserAddressesRepositoryImp = MockUserAddressesRepositoryImp();
    getUserAddressesUseCase =
        GetUserAddressesUseCase(mockUserAddressesRepositoryImp);
  });

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

  final tresult = ApiResponse.completed(tAddressesResponse);
  final ApiResponse<List<AddressModel>> tErrorResponse =
      ApiResponse.error(ErrorMessages.dioDefault);

  test(
    "should return addresses model response when calling get addresses",
    () async {
      // Arrange
      when(
        () => mockUserAddressesRepositoryImp!.getAddresses(),
      ).thenAnswer((invocation) async => Right(tresult));
      // Act
      final result = await getUserAddressesUseCase!(NoParams());
      // Assert
      expect(result, Right(tresult));
      verify(
        () => mockUserAddressesRepositoryImp!.getAddresses(),
      );
      verifyNoMoreInteractions(mockUserAddressesRepositoryImp);
    },
  );
  test(
    "should return error calling get addresses",
    () async {
      // Arrange
      when(
        () => mockUserAddressesRepositoryImp!.getAddresses(),
      ).thenAnswer((invocation) async => Left(tErrorResponse));
      // Act
      final result = await getUserAddressesUseCase!(NoParams());
      // Assert
      expect(result, Left(tErrorResponse));
      verify(
        () => mockUserAddressesRepositoryImp!.getAddresses(),
      );
      verifyNoMoreInteractions(mockUserAddressesRepositoryImp);
    },
  );
}
