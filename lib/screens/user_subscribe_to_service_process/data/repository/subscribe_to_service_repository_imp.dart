import 'package:faciltateur_de_vies/screens/user_subscribe_to_service_process/data/data_source/save_service_provider/save_service_api_imp.dart';
import 'package:faciltateur_de_vies/screens/user_subscribe_to_service_process/data/data_source/subscribe_to_service_provider/subscribe_to_service_api_imp.dart';
import 'package:faciltateur_de_vies/screens/user_subscribe_to_service_process/data/model/service_subscribe_request_model.dart';
import 'package:faciltateur_de_vies/core/api_handler/response_handler.dart';
import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/screens/user_subscribe_to_service_process/domain/repository/subscribe_to_service_repository.dart';

import '../../../../constants/enums/response_enum.dart';
import '../data_source/subscribe_with_subscription_provider/subscribe_with_subscription_api_imp.dart';

// implementation Subscribe To Service repository
class SubscribeToServiceRepositoryImp implements SubscribeToServiceRepository {
  final SubscribeToServiceApiImp _subscribeToServiceApiImp;
  final SaveServiceApiImp _saveServiceApiImp;
  final SubscribeWithSubscriptionApiImp _subscribeWithSubscriptionApiImp;

  SubscribeToServiceRepositoryImp(this._subscribeToServiceApiImp,
      this._saveServiceApiImp, this._subscribeWithSubscriptionApiImp);

  @override
  Future<Either<dynamic, ApiResponse<int>>> subscribeToService(
      {required ServiceSubscribeRequestModel subscribeModel}) async {
    ApiResponse<int> result;
    try {
      result = await _subscribeToServiceApiImp.subscribeToService(
          subscribeModel: subscribeModel);
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
  Future<Either<dynamic, ApiResponse<int>>> saveService(
      {required ServiceSubscribeRequestModel subscribeModel,
      required int serviceId}) async {
    ApiResponse<int> result;
    try {
      result = await _saveServiceApiImp.saveService(
          subscribeModel: subscribeModel, serviceId: serviceId);
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
  Future<Either<dynamic, ApiResponse<int>>> subscribeWithSubscription(
      {required ServiceSubscribeRequestModel subscribeModel}) async {
    ApiResponse<int> result;
    try {
      result = await _subscribeWithSubscriptionApiImp.subscribeWithSubscription(
          subscribeModel: subscribeModel);
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
