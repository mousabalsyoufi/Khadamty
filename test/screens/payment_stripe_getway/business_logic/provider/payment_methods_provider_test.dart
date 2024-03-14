import 'package:faciltateur_de_vies/screens/payment_method_module/bussiness_logic/provider/payment_methods_provider.dart';
import 'package:faciltateur_de_vies/screens/payment_method_module/domain/usecase/confirm_stripe_method_usecase.dart';
import 'package:faciltateur_de_vies/screens/payment_method_module/domain/usecase/create_recurrent_stripe_method_usecase.dart';
import 'package:faciltateur_de_vies/screens/payment_method_module/domain/usecase/create_stripe_method_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockConfirmStripeUseCase extends Mock implements ConfirmStripeUseCase {}
class MockCreateStripeUseCase extends Mock implements CreateStripeUseCase {}
class MockCreateRecurrentStripeUseCase extends Mock implements CreateRecurrentStripeUseCase {}


void main() async{
  TestWidgetsFlutterBinding.ensureInitialized();
  late PaymentMethodProvider? paymentMethodProvider;
  late MockConfirmStripeUseCase? mockConfirmStripeUseCase;
  late MockCreateStripeUseCase? mockCreateStripeUseCase;
  late MockCreateRecurrentStripeUseCase? mockCreateRecurrentStripeUseCase;

  setUp(() {
    mockConfirmStripeUseCase = MockConfirmStripeUseCase();
    mockCreateStripeUseCase  = MockCreateStripeUseCase();
    mockCreateRecurrentStripeUseCase = MockCreateRecurrentStripeUseCase();
    paymentMethodProvider = PaymentMethodProvider(mockConfirmStripeUseCase!,mockCreateStripeUseCase!,mockCreateRecurrentStripeUseCase!);
  });


  group('test Payment Method Provider functionality in provider', () {
    test(
      "initial values of provider should be correct",
          () async {
        // Assert
        expect(paymentMethodProvider!.isLoading, false);
        expect(paymentMethodProvider!.isError, false);
      },
    );

  });
}
