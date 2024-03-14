import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/constants/enums/response_enum.dart';
import 'package:faciltateur_de_vies/screens/shared_service_details_screen/data/data_source/service_details_provider/service_details_api_imp.dart';
import 'package:faciltateur_de_vies/screens/shared_service_details_screen/data/models/service_details_model.dart';
import 'package:faciltateur_de_vies/screens/shared_service_details_screen/domain/repository/service_details_repository.dart';
import '../../../../core/api_handler/response_handler.dart';

// implementation service details repository
class ServiceDetailsRepositoryImp implements ServiceDeatilsRepository {
  final ServiceDetailsApiImp _serviceDetailsApiImp;

  ServiceDetailsRepositoryImp(this._serviceDetailsApiImp);


  @override
  Future<Either<dynamic, ApiResponse<ServiceDetailsModel>>> getServiceDetails(
      {required String id}) async {
    ApiResponse<ServiceDetailsModel> result;
    try {
      result = await _serviceDetailsApiImp.getServiceDetails(id: id);
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
