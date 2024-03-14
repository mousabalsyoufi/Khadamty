import 'package:faciltateur_de_vies/screens/shared_help_form_screen/business_logic/provider/shared_help_form_provider.dart';
import 'package:faciltateur_de_vies/screens/shared_help_form_screen/domain/usecase/help_ticket_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockHelpTicketUseCase extends Mock
    implements HelpTicketUseCase {}

void main() async {
  late MockHelpTicketUseCase? mockHelpTicketUseCase;
  late SharedHelpFormProvider? sharedHelpFormProvider;
  setUp(() {
    mockHelpTicketUseCase = MockHelpTicketUseCase();
    sharedHelpFormProvider =
        SharedHelpFormProvider(mockHelpTicketUseCase!);
  });

  group('test send help ticket functionality in provider', () {
    test(
      "initial values of provider should be correct",
      () async {
        // Assert
        expect(sharedHelpFormProvider!.isLoading, false);
        expect(sharedHelpFormProvider!.isError, false);
      },
    );
  });
}
