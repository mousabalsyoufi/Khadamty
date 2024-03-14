// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/screens/shared_service_details_screen/data/models/service_details_model.dart';
import 'package:faciltateur_de_vies/screens/shared_service_details_screen/data/repository/service_details_repository_imp.dart';

import '../../../../core/api_handler/response_handler.dart';
import '../../../../core/generic_usecase/usecase.dart';

// get service details useCase to link with instance from repository
class GetServiceDetailsUseCase
    extends UseCase<ApiResponse<ServiceDetailsModel>, ServiceDetailsParams> {
  final ServiceDetailsRepositoryImp? _serviceDetailsRepositoryImp;

  GetServiceDetailsUseCase(this._serviceDetailsRepositoryImp);

  @override
  Future<Either<dynamic, ApiResponse<ServiceDetailsModel>>> call(
      ServiceDetailsParams params) {
    return _serviceDetailsRepositoryImp!.getServiceDetails(id: params.id);
  }
}

class ServiceDetailsParams {
  String id;
  ServiceDetailsParams({required this.id});
}
