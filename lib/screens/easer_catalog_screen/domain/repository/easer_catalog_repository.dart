import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/screens/easer_catalog_screen/data/model/catalog_model.dart';

import '../../../../core/api_handler/response_handler.dart';
import '../../../../shared_models/shared_help_ticket_request_model.dart';

// abstract class for easer catalog Repository
abstract class EaserCatalogRepository {

  Future<Either<dynamic,ApiResponse<List<CatalogModel>>>> getCatalogs();
   Future<Either<dynamic, ApiResponse<int>>> equipmentRequest({
    required SharedHelpTicketRequestModel requestModel,
  });
}