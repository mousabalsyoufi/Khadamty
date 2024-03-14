import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/core/api_handler/error_message.dart';
import 'package:faciltateur_de_vies/core/api_handler/response_handler.dart';
import 'package:faciltateur_de_vies/screens/shared_chat_screen/data/data_source/send_ticket_provider/send_chat_ticket_api_imp.dart';
import 'package:faciltateur_de_vies/screens/shared_chat_screen/data/data_source/tickets_provider/tickets_api_imp.dart';
import 'package:faciltateur_de_vies/screens/shared_chat_screen/data/model/ticket_model.dart';
import 'package:faciltateur_de_vies/screens/shared_chat_screen/data/repository/shared_chat_repository_imp.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockTicketsApiImp extends Mock implements TicketsApiImp {}

class MockSendChatTicketApiImp extends Mock implements SendChatTicketApiImp {}

void main() {
  late MockTicketsApiImp? mockTicketsApiImp;
  late MockSendChatTicketApiImp? mockSendChatTicketApiImp;
  late SharedChatRepositoryImp? sharedChatRepositoryImp;

  setUp(() {
    mockTicketsApiImp = MockTicketsApiImp();
    mockSendChatTicketApiImp = MockSendChatTicketApiImp();
    sharedChatRepositoryImp = SharedChatRepositoryImp(
        ticketsApiImp: mockTicketsApiImp!,
        sendChatTicketApiImp: mockSendChatTicketApiImp!);
  });

  const tUserId = '1';
  const tEaserId = '2';
  const tTicketId = '1';
  const tTrackId = '2swqjbf313fbd3j';
  const tMessage = 'Hi';
  final tTicketsResponse = [
    TicketModel(
        id: '1',
        subject: 'subject',
        message: 'message',
        datec: '100000000',
        dateRead: '100000000',
        dateClose: '100000000',
        dateCreation: '100000000',
        dateModification: '100000000',
        socId: '1',
        fkSoc: '1',
        fkUserAssign: '2',
        fkStatus: '2',
        trackId: '2swqjbf313fbd3j')
  ];

  // the ticket id is the response
  const tSendTicketResponse = '1';

  final tTicketsResult = ApiResponse.completed(tTicketsResponse);
  final tSendTicketResult = ApiResponse.completed(tSendTicketResponse);
  final ApiResponse<List<TicketModel>> tTicketsErrorResponse =
      ApiResponse.error(ErrorMessages.dioDefault);
  final ApiResponse<String> tSendTicketErrorResponse =
      ApiResponse.error(ErrorMessages.dioDefault);

  group('tickets test group', () {
    test(
      "get tickets should return tickets response model",
      () async {
        // Arrange
        when(() => mockTicketsApiImp!.getTickets(
            userId: tUserId,
            easerId: tEaserId)).thenAnswer((_) async => tTicketsResult);
        // Act
        final result = await sharedChatRepositoryImp!
            .getTickets(userId: tUserId, easerId: tEaserId);
        // Assert
        expect(result, Right(tTicketsResult));
        verify(() =>
            mockTicketsApiImp!.getTickets(userId: tUserId, easerId: tEaserId));
        verifyNoMoreInteractions(mockTicketsApiImp);
      },
    );
    test(
      "get tickets should return error form get tickets api",
      () async {
        // Arrange
        when(() => mockTicketsApiImp!.getTickets(
            userId: tUserId,
            easerId: tEaserId)).thenAnswer((_) async => tTicketsErrorResponse);
        // Act
        final result = await sharedChatRepositoryImp!
            .getTickets(userId: tUserId, easerId: tEaserId);
        // Assert
        expect(result, Left(tTicketsErrorResponse));
        verify(() =>
            mockTicketsApiImp!.getTickets(userId: tUserId, easerId: tEaserId));
        verifyNoMoreInteractions(mockTicketsApiImp);
      },
    );
  });
  group('send ticket test group', () {
    test(
      "send ticket should return ticket id",
      () async {
        // Arrange
        when(() => mockSendChatTicketApiImp!.sendTicket(
            ticketId: tTicketId,
            trackId: tTrackId,
            message: tMessage)).thenAnswer((_) async => tSendTicketResult);
        // Act
        final result = await sharedChatRepositoryImp!.sendTicket(
            ticketId: tTicketId, trackId: tTrackId, message: tMessage);
        // Assert
        expect(result, Right(tSendTicketResult));
        verify(() => mockSendChatTicketApiImp!.sendTicket(
            ticketId: tTicketId, trackId: tTrackId, message: tMessage));
        verifyNoMoreInteractions(mockSendChatTicketApiImp);
      },
    );
    test(
      "send ticket should return error form send ticket api",
      () async {
        // Arrange
        when(() => mockSendChatTicketApiImp!.sendTicket(
                ticketId: tTicketId, trackId: tTrackId, message: tMessage))
            .thenAnswer((_) async => tSendTicketErrorResponse);
        // Act
        final result = await sharedChatRepositoryImp!.sendTicket(
            ticketId: tTicketId, trackId: tTrackId, message: tMessage);
        // Assert
        expect(result, Left(tSendTicketErrorResponse));
        verify(() => mockSendChatTicketApiImp!.sendTicket(
            ticketId: tTicketId, trackId: tTrackId, message: tMessage));
        verifyNoMoreInteractions(mockSendChatTicketApiImp);
      },
    );
  });
}
