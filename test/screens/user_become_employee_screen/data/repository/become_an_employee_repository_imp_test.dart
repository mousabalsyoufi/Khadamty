import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/constants/consts/consts.dart';
import 'package:faciltateur_de_vies/core/api_handler/error_message.dart';
import 'package:faciltateur_de_vies/core/api_handler/response_handler.dart';
import 'package:faciltateur_de_vies/screens/user_become_employee_screen/data/data_source/become_an_employee_provider/become_an_employee_api_imp.dart';
import 'package:faciltateur_de_vies/shared_models/shared_help_ticket_request_model.dart';
import 'package:faciltateur_de_vies/screens/user_become_employee_screen/data/repository/become_an_employee_repository_imp.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockBecomeAnEmployeeApiImp extends Mock
    implements BecomeAnEmployeeApiImp {}

void main() {
  late MockBecomeAnEmployeeApiImp? mockBecomeAnEmployeeApiImp;
  late BecomeAnEmployeeRepositoryImp? becomeAnEmployeeRepositoryImp;

  setUp(() {
    mockBecomeAnEmployeeApiImp = MockBecomeAnEmployeeApiImp();
    becomeAnEmployeeRepositoryImp =
        BecomeAnEmployeeRepositoryImp(mockBecomeAnEmployeeApiImp!);
  });

  final SharedHelpTicketRequestModel tRequestModel =
      SharedHelpTicketRequestModel(
          fkSoc: '1',
          subject: 'TICKET',
          message: 'become an employee message',
          typeCode: Consts.comTicket,
          categoryCode: Consts.otherCategoryCodeTicket,
          severityCode: Consts.normalSeverityTicket);
  const tBecomeEmployeeResponse = 1;

  final tresult = ApiResponse.completed(tBecomeEmployeeResponse);
  final ApiResponse<int> tErrorResponse =
      ApiResponse.error(ErrorMessages.dioDefault);

  test(
    "become an employee should return success ticket id",
    () async {
      // Arrange
      when(() => mockBecomeAnEmployeeApiImp!.becomeAnEmployee(
          requestModel: tRequestModel)).thenAnswer((_) async => tresult);
      // Act
      final result = await becomeAnEmployeeRepositoryImp!
          .becomeAnEmployee(requestModel: tRequestModel);
      // Assert
      expect(result, Right(tresult));
      verify(() => mockBecomeAnEmployeeApiImp!
          .becomeAnEmployee(requestModel: tRequestModel));
      verifyNoMoreInteractions(mockBecomeAnEmployeeApiImp);
    },
  );
  test(
    "become an employee should return error form become an employee api",
    () async {
      // Arrange
      when(() => mockBecomeAnEmployeeApiImp!.becomeAnEmployee(
          requestModel: tRequestModel)).thenAnswer((_) async => tErrorResponse);
      // Act
      final result = await becomeAnEmployeeRepositoryImp!
          .becomeAnEmployee(requestModel: tRequestModel);
      // Assert
      expect(result, Left(tErrorResponse));
      verify(() => mockBecomeAnEmployeeApiImp!
          .becomeAnEmployee(requestModel: tRequestModel));
      verifyNoMoreInteractions(mockBecomeAnEmployeeApiImp);
    },
  );
}
