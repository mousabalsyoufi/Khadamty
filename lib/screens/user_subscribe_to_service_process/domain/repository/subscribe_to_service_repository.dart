import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/screens/user_subscribe_to_service_process/data/model/service_subscribe_request_model.dart';
import '../../../../core/api_handler/response_handler.dart';

// abstract class for Subscribe To Service Repository
abstract class SubscribeToServiceRepository {
  Future<Either<dynamic, ApiResponse<int>>> subscribeToService({
    required ServiceSubscribeRequestModel subscribeModel,
  });
  Future<Either<dynamic, ApiResponse<int>>> subscribeWithSubscription({
    required ServiceSubscribeRequestModel subscribeModel,
  });
  Future<Either<dynamic, ApiResponse<int>>> saveService({
    required ServiceSubscribeRequestModel subscribeModel,
    required int serviceId,
  });
}
