import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/shared_models/shared_help_ticket_request_model.dart';

import '../../../../core/api_handler/response_handler.dart';
import '../../../../core/generic_usecase/usecase.dart';
import '../repository/easer_catalog_repository.dart';

// equipment request to link with instance from repository
class EquipmentRequestUseCase
    extends UseCase<ApiResponse<int>, EquipmentRequestUseCaseParams> {
  final EaserCatalogRepository? _easerCatalogRepository;

  EquipmentRequestUseCase(this._easerCatalogRepository);

  @override
  Future<Either<dynamic, ApiResponse<int>>> call(
      EquipmentRequestUseCaseParams params) {
    return _easerCatalogRepository!.equipmentRequest(
      requestModel: params.requestModel,
    );
  }
}

class EquipmentRequestUseCaseParams {
  final SharedHelpTicketRequestModel requestModel;
  EquipmentRequestUseCaseParams({
    required this.requestModel,
  });
}
