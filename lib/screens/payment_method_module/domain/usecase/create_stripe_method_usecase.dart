import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/screens/payment_method_module/data/models/stripe_response_model.dart';
import 'package:faciltateur_de_vies/screens/payment_method_module/data/models/stripe_request_model.dart';
import '../../../../core/api_handler/response_handler.dart';
import '../../../../core/generic_usecase/usecase.dart';
import '../repository/payment_repository.dart';

// This is class for create stripe useCase use payment from repository
class CreateStripeUseCase
    extends UseCase<ApiResponse<StripeResponseModel>, CreateStripeUseCaseParams> {
  final PaymentMethodRepository? _paymentMethodRepository;

  CreateStripeUseCase(this._paymentMethodRepository);

  @override
  Future<Either<dynamic, ApiResponse<StripeResponseModel>>> call(
      CreateStripeUseCaseParams params) {
    return _paymentMethodRepository!.createStripePaymentMethod(stripeRequestModel: params.stripeRequestModel);
  }
}

class CreateStripeUseCaseParams {
  final StripeRequestModel stripeRequestModel;
  CreateStripeUseCaseParams({required this.stripeRequestModel});
}
