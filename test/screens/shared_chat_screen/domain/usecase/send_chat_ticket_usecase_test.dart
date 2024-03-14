import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/core/api_handler/error_message.dart';
import 'package:faciltateur_de_vies/core/api_handler/response_handler.dart';
import 'package:faciltateur_de_vies/screens/shared_chat_screen/data/repository/shared_chat_repository_imp.dart';
import 'package:faciltateur_de_vies/screens/shared_chat_screen/domain/usecase/send_chat_ticket_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockSharedChatRepositoryImp extends Mock
    implements SharedChatRepositoryImp {}

void main() {
  late MockSharedChatRepositoryImp? mockSharedChatRepositoryImp;
  late SendChatTicketUseCase? sendChatTicketUseCase;

  setUp(() {
    mockSharedChatRepositoryImp = MockSharedChatRepositoryImp();
    sendChatTicketUseCase = SendChatTicketUseCase(mockSharedChatRepositoryImp);
  });
  const tTicketId = '1';
  const tTrackId = '2swqjbf313fbd3j';
  const tMessage = 'Hi';
  final tSendTicketResponse = ApiResponse.completed('1');
  final ApiResponse<String> tErrorResponse =
      ApiResponse.error(ErrorMessages.dioDefault);

  test(
    "should return ticket id response when calling send ticket",
    () async {
      // Arrange
      when(
        () => mockSharedChatRepositoryImp!.sendTicket(
            ticketId: tTicketId, trackId: tTrackId, message: tMessage),
      ).thenAnswer((invocation) async => Right(tSendTicketResponse));
      // Act
      final result = await sendChatTicketUseCase!(SendChatTicketUseCaseParams(
          ticketId: tTicketId, trackId: tTrackId, message: tMessage));
      // Assert
      expect(result, Right(tSendTicketResponse));
      verify(
        () => mockSharedChatRepositoryImp!.sendTicket(
            ticketId: tTicketId, trackId: tTrackId, message: tMessage),
      );
      verifyNoMoreInteractions(mockSharedChatRepositoryImp);
    },
  );
  test(
    "should return error calling send ticket",
    () async {
      // Arrange
      when(
        () => mockSharedChatRepositoryImp!.sendTicket(
            ticketId: tTicketId, trackId: tTrackId, message: tMessage),
      ).thenAnswer((invocation) async => Left(tErrorResponse));
      // Act
      final result = await sendChatTicketUseCase!(SendChatTicketUseCaseParams(
          ticketId: tTicketId, trackId: tTrackId, message: tMessage));
      // Assert
      expect(result, Left(tErrorResponse));
      verify(
        () => mockSharedChatRepositoryImp!.sendTicket(
            ticketId: tTicketId, trackId: tTrackId, message: tMessage),
      );
      verifyNoMoreInteractions(mockSharedChatRepositoryImp);
    },
  );
}
