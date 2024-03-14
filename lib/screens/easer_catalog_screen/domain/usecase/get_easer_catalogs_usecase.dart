// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dartz/dartz.dart';

import '../../../../core/api_handler/response_handler.dart';
import '../../../../core/generic_usecase/usecase.dart';
import '../../data/model/catalog_model.dart';
import '../repository/easer_catalog_repository.dart';

// get catalogs useCase to link with instance from repository
class GetEaserCatalogsUseCase
    extends UseCase<ApiResponse<List<CatalogModel>>, NoParams> {
  final EaserCatalogRepository? _easerCatalogRepository;

  GetEaserCatalogsUseCase(this._easerCatalogRepository);

  @override
  Future<Either<dynamic, ApiResponse<List<CatalogModel>>>> call(
      NoParams params) {
    return _easerCatalogRepository!.getCatalogs();
  }
}
