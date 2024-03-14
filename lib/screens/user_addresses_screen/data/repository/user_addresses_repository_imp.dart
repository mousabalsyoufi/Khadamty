import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/constants/enums/response_enum.dart';
import 'package:faciltateur_de_vies/screens/user_addresses_screen/data/data_source/delete_address_provider/delete_address_api_imp.dart';
import 'package:faciltateur_de_vies/shared_models/address_model.dart';
import '../../../../core/api_handler/response_handler.dart';
import '../../domain/repository/user_addresses_repository.dart';
import '../data_source/user_addresses_provider/user_addresses_api_imp.dart';

// implementation user Addresses repository
class UserAddressesRepositoryImp implements UserAddressesRepository {
  final UserAddressesApiImp userAddressesApiImp;
  final DeleteAddressApiImp deleteAddressApiImp;

  UserAddressesRepositoryImp({
    required this.userAddressesApiImp,
    required this.deleteAddressApiImp,
  });

  @override
  Future<Either<dynamic, ApiResponse<List<AddressModel>>>>
      getAddresses() async {
    ApiResponse<List<AddressModel>> result;
    try {
      result = await userAddressesApiImp.getAddresses();
      if (result.status == Status.completed) {
        return Right(result);
      } else {
        return Left(result);
      }
    } catch (error) {
      return Left(error);
    }
  }

  @override
  Future<Either<dynamic, ApiResponse<String>>> deleteAddress(
      {required String id}) async {
    ApiResponse<String> result;
    try {
      result = await deleteAddressApiImp.deleteAddress(id: id);
      if (result.status == Status.completed) {
        return Right(result);
      } else {
        return Left(result);
      }
    } catch (error) {
      return Left(error);
    }
  }
}
