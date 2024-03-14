// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dartz/dartz.dart';

import '../../../../core/api_handler/response_handler.dart';
import '../../../../core/generic_usecase/usecase.dart';
import '../../data/repository/shared_chat_repository_imp.dart';

// send chat ticket useCase to link with instance from repository
class SendChatTicketUseCase
    extends UseCase<ApiResponse<String>, SendChatTicketUseCaseParams> {
  final SharedChatRepositoryImp? _chatRepositoryImp;

  SendChatTicketUseCase(this._chatRepositoryImp);

  @override
  Future<Either<dynamic, ApiResponse<String>>> call(
      SendChatTicketUseCaseParams params) {
    return _chatRepositoryImp!.sendTicket(
        ticketId: params.ticketId,
        trackId: params.trackId,
        message: params.message);
  }
}

class SendChatTicketUseCaseParams {
  String ticketId;
  String trackId;
  String message;
  SendChatTicketUseCaseParams(
      {required this.ticketId, required this.trackId, required this.message});
}
