import 'package:faciltateur_de_vies/screens/user_subscribe_to_service_process/business_logic/provider/user_service_subscribe_process_provider.dart';
import 'package:faciltateur_de_vies/screens/user_subscribe_to_service_process/domain/usecase/save_service_usecase.dart';
import 'package:faciltateur_de_vies/screens/user_subscribe_to_service_process/domain/usecase/subscribe_to_service_usecase.dart';
import 'package:faciltateur_de_vies/screens/user_subscribe_to_service_process/domain/usecase/subscribe_with_subscription_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockSubscribeToServiceUseCase extends Mock
    implements SubscribeToServiceUseCase {}

class MockSubscribeWithSubscriptionUseCase extends Mock
    implements SubscribeWithSubscriptionUseCase {}

class MockSaveServiceUseCase extends Mock implements SaveServiceUseCase {}

void main() async {
  late MockSubscribeToServiceUseCase? mockSubscribeToServiceUseCase;
  late MockSubscribeWithSubscriptionUseCase?
      mockSubscribeWithSubscriptionUseCase;
  late MockSaveServiceUseCase? mockSaveServiceUseCase;
  late UserServiceSubscribeProcessProvider? userServiceSubscribeProcessProvider;
  setUp(() {
    mockSubscribeToServiceUseCase = MockSubscribeToServiceUseCase();
    mockSubscribeWithSubscriptionUseCase =
        MockSubscribeWithSubscriptionUseCase();
    mockSaveServiceUseCase = MockSaveServiceUseCase();
    userServiceSubscribeProcessProvider = UserServiceSubscribeProcessProvider(
        mockSubscribeToServiceUseCase!,
        mockSaveServiceUseCase!,
        mockSubscribeWithSubscriptionUseCase!);
  });

  group('test subscribe to service functionality in provider', () {
    test(
      "initial values of provider should be correct",
      () async {
        // Assert
        expect(userServiceSubscribeProcessProvider!.isLoading, false);
        expect(userServiceSubscribeProcessProvider!.isError, false);
      },
    );
  });
}
