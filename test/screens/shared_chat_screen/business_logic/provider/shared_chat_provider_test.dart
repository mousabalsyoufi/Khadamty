import 'package:faciltateur_de_vies/screens/shared_chat_screen/business_logic/provider/shared_chat_provider.dart';
import 'package:faciltateur_de_vies/screens/shared_chat_screen/domain/usecase/get_tickets_usecase.dart';
import 'package:faciltateur_de_vies/screens/shared_chat_screen/domain/usecase/send_chat_ticket_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGetTicketsUseCase extends Mock implements GetTicketsUseCase {}

class MockSendChatTicketUseCase extends Mock implements SendChatTicketUseCase {}

void main() async {
  late MockGetTicketsUseCase? mockGetTicketsUseCase;
  late MockSendChatTicketUseCase? mockSendChatTicketUseCase;
  late SharedChatProvider? sharedChatProvider;
  setUp(() {
    mockGetTicketsUseCase = MockGetTicketsUseCase();
    mockSendChatTicketUseCase = MockSendChatTicketUseCase();
    sharedChatProvider =
        SharedChatProvider(mockGetTicketsUseCase!, mockSendChatTicketUseCase!);
  });

  group('test get tickets functionality in provider', () {
    test(
      "initial values of provider should be correct",
      () async {
        // Assert
        expect(sharedChatProvider!.isLoading, false);
        expect(sharedChatProvider!.isError, false);
      },
    );
  });
}
