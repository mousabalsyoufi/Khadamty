import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/constants/enums/response_enum.dart';
import 'package:faciltateur_de_vies/screens/easer_catalog_screen/data/model/catalog_model.dart';
import 'package:faciltateur_de_vies/shared_models/shared_help_ticket_request_model.dart';
import '../../../../core/api_handler/response_handler.dart';
import '../../domain/repository/easer_catalog_repository.dart';
import '../data_source/equipment_catalog_provider/equipment_catalog_api_imp.dart';
import '../data_source/equipment_request_provider/equipment_request_api_imp.dart';

// implementation easer catalog repository
class EaserCatalogRepositoryImp implements EaserCatalogRepository {
  final EquipmentCatalogApiImp equipmentCatalogApiImp;
  final EquipmentRequestApiImp equipmentRequestApiImp;

  EaserCatalogRepositoryImp({
    required this.equipmentCatalogApiImp,
    required this.equipmentRequestApiImp,
  });

  @override
  Future<Either<dynamic, ApiResponse<List<CatalogModel>>>> getCatalogs() async {
    ApiResponse<List<CatalogModel>> result;
    try {
      result = await equipmentCatalogApiImp.getCatalogs();
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
  Future<Either<dynamic, ApiResponse<int>>> equipmentRequest(
      {required SharedHelpTicketRequestModel requestModel}) async {
    ApiResponse<int> result;
    try {
      result = await equipmentRequestApiImp.equipmentRequest(
          requestModel: requestModel);
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
