import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/constants/consts/consts.dart';
import 'package:faciltateur_de_vies/core/api_handler/error_message.dart';
import 'package:faciltateur_de_vies/core/api_handler/response_handler.dart';
import 'package:faciltateur_de_vies/shared_models/shared_help_ticket_request_model.dart';
import 'package:faciltateur_de_vies/screens/user_become_employee_screen/data/repository/become_an_employee_repository_imp.dart';
import 'package:faciltateur_de_vies/screens/user_become_employee_screen/domain/usecase/become_an_employee_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockBecomeAnEmployeeRepositoryImp extends Mock
    implements BecomeAnEmployeeRepositoryImp {}

void main() {
  late MockBecomeAnEmployeeRepositoryImp? mockBecomeAnEmployeeRepositoryImp;
  late BecomeAnEmployeeUseCase? becomeAnEmployeeUseCase;

  setUp(() {
    mockBecomeAnEmployeeRepositoryImp = MockBecomeAnEmployeeRepositoryImp();
    becomeAnEmployeeUseCase =
        BecomeAnEmployeeUseCase(mockBecomeAnEmployeeRepositoryImp);
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

  // response contains ticket id
  final tBecomeEmployeeResultResponse =
      ApiResponse.completed(tBecomeEmployeeResponse);
  final ApiResponse<int> tErrorResponse =
      ApiResponse.error(ErrorMessages.dioDefault);

  test(
    "should return ticket id response when calling become an employee",
    () async {
      // Arrange
      when(
        () => mockBecomeAnEmployeeRepositoryImp!
            .becomeAnEmployee(requestModel: tRequestModel),
      ).thenAnswer((invocation) async => Right(tBecomeEmployeeResultResponse));
      // Act
      final result = await becomeAnEmployeeUseCase!(
          BecomeEmployeeUseCaseParams(requestModel: tRequestModel));
      // Assert
      expect(result, Right(tBecomeEmployeeResultResponse));
      verify(
        () => mockBecomeAnEmployeeRepositoryImp!
            .becomeAnEmployee(requestModel: tRequestModel),
      );
      verifyNoMoreInteractions(mockBecomeAnEmployeeRepositoryImp);
    },
  );
  test(
    "should return error calling become an employee uscase",
    () async {
      // Arrange
      when(
        () => mockBecomeAnEmployeeRepositoryImp!
            .becomeAnEmployee(requestModel: tRequestModel),
      ).thenAnswer((invocation) async => Left(tErrorResponse));
      // Act
      final result = await becomeAnEmployeeUseCase!(
          BecomeEmployeeUseCaseParams(requestModel: tRequestModel));
      // Assert
      expect(result, Left(tErrorResponse));
      verify(
        () => mockBecomeAnEmployeeRepositoryImp!
            .becomeAnEmployee(requestModel: tRequestModel),
      );
      verifyNoMoreInteractions(mockBecomeAnEmployeeRepositoryImp);
    },
  );
}
