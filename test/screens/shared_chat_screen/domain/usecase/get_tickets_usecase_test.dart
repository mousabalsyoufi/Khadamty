import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/core/api_handler/error_message.dart';
import 'package:faciltateur_de_vies/core/api_handler/response_handler.dart';
import 'package:faciltateur_de_vies/screens/shared_chat_screen/data/model/ticket_model.dart';
import 'package:faciltateur_de_vies/screens/shared_chat_screen/data/repository/shared_chat_repository_imp.dart';
import 'package:faciltateur_de_vies/screens/shared_chat_screen/domain/usecase/get_tickets_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockSharedChatRepositoryImp extends Mock
    implements SharedChatRepositoryImp {}

void main() {
  late MockSharedChatRepositoryImp? mockSharedChatRepositoryImp;
  late GetTicketsUseCase? getTicketsUseCase;

  setUp(() {
    mockSharedChatRepositoryImp = MockSharedChatRepositoryImp();
    getTicketsUseCase = GetTicketsUseCase(mockSharedChatRepositoryImp);
  });
  const tUserId = '1';
  const tEaserId = '2';
  final tTicketsResponse = ApiResponse.completed([
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
  ]);
  final ApiResponse<List<TicketModel>> tErrorResponse =
      ApiResponse.error(ErrorMessages.dioDefault);

  test(
    "should return tickets response when calling get tickets",
    () async {
      // Arrange
      when(
        () => mockSharedChatRepositoryImp!
            .getTickets(userId: tUserId, easerId: tEaserId),
      ).thenAnswer((invocation) async => Right(tTicketsResponse));
      // Act
      final result = await getTicketsUseCase!(
          GetTicketsUseCaseParams(userId: tUserId, easerId: tEaserId));
      // Assert
      expect(result, Right(tTicketsResponse));
      verify(
        () => mockSharedChatRepositoryImp!
            .getTickets(userId: tUserId, easerId: tEaserId),
      );
      verifyNoMoreInteractions(mockSharedChatRepositoryImp);
    },
  );
  test(
    "should return error calling get tickets",
    () async {
      // Arrange
      when(
        () => mockSharedChatRepositoryImp!
            .getTickets(userId: tUserId, easerId: tEaserId),
      ).thenAnswer((invocation) async => Left(tErrorResponse));
      // Act
      final result = await getTicketsUseCase!(
          GetTicketsUseCaseParams(userId: tUserId, easerId: tEaserId));
      // Assert
      expect(result, Left(tErrorResponse));
      verify(
        () => mockSharedChatRepositoryImp!
            .getTickets(userId: tUserId, easerId: tEaserId),
      );
      verifyNoMoreInteractions(mockSharedChatRepositoryImp);
    },
  );
}
