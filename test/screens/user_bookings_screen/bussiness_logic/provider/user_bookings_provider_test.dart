import 'package:faciltateur_de_vies/screens/user_bookings_screen/business_logic/provider/user_bookings_provider.dart';
import 'package:faciltateur_de_vies/screens/user_bookings_screen/domain/usecase/history_orders_usecase.dart';
import 'package:faciltateur_de_vies/screens/user_bookings_screen/domain/usecase/upcoming_orders_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockUpcomingOrdersUseCase extends Mock
    implements UpcomingOrdersUseCase {}

class MockHistoryOrdersUseCase extends Mock
implements HistoryOrdersUseCase {}

void main() async {
  late MockUpcomingOrdersUseCase? mockUpcomingOrdersUseCase;
  late MockHistoryOrdersUseCase? mockHistoryOrdersUseCase;

  late UserBookingsProvider? userBookingsProvider;
  setUp(() {
    mockUpcomingOrdersUseCase = MockUpcomingOrdersUseCase();
    mockHistoryOrdersUseCase =MockHistoryOrdersUseCase();
    userBookingsProvider = UserBookingsProvider(mockUpcomingOrdersUseCase!,mockHistoryOrdersUseCase!);
  });

  group('test history and upcoming orders functionality in provider', () {
    test(
      "initial values of provider should be correct",
          () async {
        // Assert
        expect(userBookingsProvider!.isLoading, false);
        expect(userBookingsProvider!.isError, false);
      },
    );
  });
}
