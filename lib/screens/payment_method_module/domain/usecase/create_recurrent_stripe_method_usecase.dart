import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/screens/payment_method_module/data/models/stripe_recurrent_model.dart';
import '../../../../core/api_handler/response_handler.dart';
import '../../../../core/generic_usecase/usecase.dart';
import '../repository/payment_repository.dart';

// This is class for create recurrent stripe useCase use payment from repository
class CreateRecurrentStripeUseCase
    extends UseCase<ApiResponse<bool>, CreateRecurrentStripeUseCaseParams> {
  final PaymentMethodRepository? _paymentMethodRepository;

  CreateRecurrentStripeUseCase(this._paymentMethodRepository);

  @override
  Future<Either<dynamic, ApiResponse<bool>>> call(
      CreateRecurrentStripeUseCaseParams params) {
    return _paymentMethodRepository!.createRecurrentStripePaymentMethod(stripeRequestRecurrentModel: params.stripeRequestRecurrentModel);
  }
}

class CreateRecurrentStripeUseCaseParams {
  final StripeRequestRecurrentModel stripeRequestRecurrentModel;
  CreateRecurrentStripeUseCaseParams({required this.stripeRequestRecurrentModel});
}
