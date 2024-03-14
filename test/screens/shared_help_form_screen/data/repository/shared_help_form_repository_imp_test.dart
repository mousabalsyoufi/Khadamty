import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/constants/consts/consts.dart';
import 'package:faciltateur_de_vies/core/api_handler/error_message.dart';
import 'package:faciltateur_de_vies/core/api_handler/response_handler.dart';
import 'package:faciltateur_de_vies/screens/shared_help_form_screen/data/data_source/help_ticket_provider/help_ticket_api_imp.dart';
import 'package:faciltateur_de_vies/screens/shared_help_form_screen/data/repository/shared_help_form_repository_imp.dart';
import 'package:faciltateur_de_vies/shared_models/shared_help_ticket_request_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockHelpTicketApiImp extends Mock implements HelpTicketApiImp {}

void main() {
  late MockHelpTicketApiImp? mockHelpTicketApiImp;
  late SharedHelpFormRepositoryImp? sharedHelpFormRepositoryImp;

  setUp(() {
    mockHelpTicketApiImp = MockHelpTicketApiImp();
    sharedHelpFormRepositoryImp =
        SharedHelpFormRepositoryImp(mockHelpTicketApiImp!);
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

  final tresult = ApiResponse.completed(tHelpTicketResponse);
  final ApiResponse<int> tErrorResponse =
      ApiResponse.error(ErrorMessages.dioDefault);

  test(
    "send help ticket should return success ticket id",
    () async {
      // Arrange
      when(() =>
              mockHelpTicketApiImp!.sendHelpTicket(requestModel: tRequestModel))
          .thenAnswer((_) async => tresult);
      // Act
      final result = await sharedHelpFormRepositoryImp!
          .sendHelpTicket(requestModel: tRequestModel);
      // Assert
      expect(result, Right(tresult));
      verify(() =>
          mockHelpTicketApiImp!.sendHelpTicket(requestModel: tRequestModel));
      verifyNoMoreInteractions(mockHelpTicketApiImp);
    },
  );
  test(
    "send help ticketshould return error form become an employee api",
    () async {
      // Arrange
      when(() =>
              mockHelpTicketApiImp!.sendHelpTicket(requestModel: tRequestModel))
          .thenAnswer((_) async => tErrorResponse);
      // Act
      final result = await sharedHelpFormRepositoryImp!
          .sendHelpTicket(requestModel: tRequestModel);
      // Assert
      expect(result, Left(tErrorResponse));
      verify(() =>
          mockHelpTicketApiImp!.sendHelpTicket(requestModel: tRequestModel));
      verifyNoMoreInteractions(mockHelpTicketApiImp);
    },
  );
}
