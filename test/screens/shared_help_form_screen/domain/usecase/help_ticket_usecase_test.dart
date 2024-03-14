import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/constants/consts/consts.dart';
import 'package:faciltateur_de_vies/core/api_handler/error_message.dart';
import 'package:faciltateur_de_vies/core/api_handler/response_handler.dart';
import 'package:faciltateur_de_vies/screens/shared_help_form_screen/data/repository/shared_help_form_repository_imp.dart';
import 'package:faciltateur_de_vies/screens/shared_help_form_screen/domain/usecase/help_ticket_usecase.dart';
import 'package:faciltateur_de_vies/shared_models/shared_help_ticket_request_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockSharedHelpFormRepositoryImp extends Mock
    implements SharedHelpFormRepositoryImp {}

void main() {
  late MockSharedHelpFormRepositoryImp? mockSharedHelpFormRepositoryImp;
  late HelpTicketUseCase? helpTicketUseCase;

  setUp(() {
    mockSharedHelpFormRepositoryImp = MockSharedHelpFormRepositoryImp();
    helpTicketUseCase = HelpTicketUseCase(mockSharedHelpFormRepositoryImp);
  });

  final SharedHelpTicketRequestModel tRequestModel =
      SharedHelpTicketRequestModel(
          fkSoc: '1',
          subject: 'TICKET',
          message: 'become an employee message',
          typeCode: Consts.comTicket,
          categoryCode: Consts.otherCategoryCodeTicket,
          severityCode: Consts.normalSeverityTicket);
  const tHelpTicketResponse = 1;

  // response contains ticket id
  final tHelpTicketResultResponse = ApiResponse.completed(tHelpTicketResponse);
  final ApiResponse<int> tErrorResponse =
      ApiResponse.error(ErrorMessages.dioDefault);

  test(
    "should return ticket id response when calling help ticket usecase",
    () async {
      // Arrange
      when(
        () => mockSharedHelpFormRepositoryImp!
            .sendHelpTicket(requestModel: tRequestModel),
      ).thenAnswer((invocation) async => Right(tHelpTicketResultResponse));
      // Act
      final result = await helpTicketUseCase!(
          HelpTicketUseCaseParams(requestModel: tRequestModel));
      // Assert
      expect(result, Right(tHelpTicketResultResponse));
      verify(
        () => mockSharedHelpFormRepositoryImp!
            .sendHelpTicket(requestModel: tRequestModel),
      );
      verifyNoMoreInteractions(mockSharedHelpFormRepositoryImp);
    },
  );
  test(
    "should return error calling help ticket uscase",
    () async {
      // Arrange
      when(
        () => mockSharedHelpFormRepositoryImp!
            .sendHelpTicket(requestModel: tRequestModel),
      ).thenAnswer((invocation) async => Left(tErrorResponse));
      // Act
      final result = await helpTicketUseCase!(
          HelpTicketUseCaseParams(requestModel: tRequestModel));
      // Assert
      expect(result, Left(tErrorResponse));
      verify(
        () => mockSharedHelpFormRepositoryImp!
            .sendHelpTicket(requestModel: tRequestModel),
      );
      verifyNoMoreInteractions(mockSharedHelpFormRepositoryImp);
    },
  );
}
