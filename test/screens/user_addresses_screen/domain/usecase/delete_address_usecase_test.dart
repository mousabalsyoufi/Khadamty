import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/core/api_handler/error_message.dart';
import 'package:faciltateur_de_vies/core/api_handler/response_handler.dart';
import 'package:faciltateur_de_vies/screens/user_addresses_screen/data/repository/user_addresses_repository_imp.dart';
import 'package:faciltateur_de_vies/screens/user_addresses_screen/domain/usecase/delete_address_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockUserAddressesRepositoryImp extends Mock
    implements UserAddressesRepositoryImp {}

void main() {
  late MockUserAddressesRepositoryImp? mockUserAddressesRepositoryImp;
  late DeleteAddressUseCase? deleteAddressUseCase;

  setUp(() {
    mockUserAddressesRepositoryImp = MockUserAddressesRepositoryImp();
    deleteAddressUseCase = DeleteAddressUseCase(mockUserAddressesRepositoryImp);
  });

  const tAddressId = '1';
  const tDeleteAddressResponse = 'Address was deleted successfully';

  final tresult = ApiResponse.completed(tDeleteAddressResponse);
  final ApiResponse<String> tErrorResponse =
      ApiResponse.error(ErrorMessages.dioDefault);

  test(
    "should return success message response when calling delete address",
    () async {
      // Arrange
      when(
        () => mockUserAddressesRepositoryImp!.deleteAddress(id: tAddressId),
      ).thenAnswer((invocation) async => Right(tresult));
      // Act
      final result = await deleteAddressUseCase!(
          DeleteAddressUseCaseParams(id: tAddressId));
      // Assert
      expect(result, Right(tresult));
      verify(
        () => mockUserAddressesRepositoryImp!.deleteAddress(id: tAddressId),
      );
      verifyNoMoreInteractions(mockUserAddressesRepositoryImp);
    },
  );
  test(
    "should return error calling delete address",
    () async {
      // Arrange
      when(
        () => mockUserAddressesRepositoryImp!.deleteAddress(id: tAddressId),
      ).thenAnswer((invocation) async => Left(tErrorResponse));
      // Act
      final result = await deleteAddressUseCase!(
          DeleteAddressUseCaseParams(id: tAddressId));
      // Assert
      expect(result, Left(tErrorResponse));
      verify(
        () => mockUserAddressesRepositoryImp!.deleteAddress(id: tAddressId),
      );
      verifyNoMoreInteractions(mockUserAddressesRepositoryImp);
    },
  );
}
