import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/screens/payment_method_module/data/models/stripe_response_model.dart';
import '../../../../core/api_handler/response_handler.dart';
import '../../../../core/generic_usecase/usecase.dart';
import '../repository/payment_repository.dart';

// This class to confirm stripe use repo
class ConfirmStripeUseCase
    extends UseCase<ApiResponse<StripeResponseModel>, ConfirmStripeUseCaseParams> {
  final PaymentMethodRepository? _paymentMethodRepository;

  ConfirmStripeUseCase(this._paymentMethodRepository);

  @override
  Future<Either<dynamic, ApiResponse<StripeResponseModel>>> call(ConfirmStripeUseCaseParams params) {
    return _paymentMethodRepository!.confirmStripePaymentMethod(paymentIntentId: params.paymentIntentId);
  }
}

class ConfirmStripeUseCaseParams {
  final String paymentIntentId;
  ConfirmStripeUseCaseParams({required this.paymentIntentId});
}
