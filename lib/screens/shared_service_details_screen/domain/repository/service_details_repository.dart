import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/screens/shared_service_details_screen/data/models/service_details_model.dart';

import '../../../../core/api_handler/response_handler.dart';

// abstract class for service details Repository
abstract class ServiceDeatilsRepository {
  Future<Either<dynamic, ApiResponse<ServiceDetailsModel>>> getServiceDetails(
      {required String id});
}
