// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/screens/shared_chat_screen/data/model/ticket_model.dart';

import '../../../../core/api_handler/response_handler.dart';
import '../../../../core/generic_usecase/usecase.dart';
import '../../data/repository/shared_chat_repository_imp.dart';

// get tickets useCase to link with instance from repository
class GetTicketsUseCase
    extends UseCase<ApiResponse<List<TicketModel>>, GetTicketsUseCaseParams> {
  final SharedChatRepositoryImp? _chatRepositoryImp;

  GetTicketsUseCase(this._chatRepositoryImp);

  @override
  Future<Either<dynamic, ApiResponse<List<TicketModel>>>> call(
      GetTicketsUseCaseParams params) {
    return _chatRepositoryImp!
        .getTickets(userId: params.userId, easerId: params.easerId);
  }
}

class GetTicketsUseCaseParams {
  String userId;
  String easerId;
  GetTicketsUseCaseParams({required this.userId, required this.easerId});
}
