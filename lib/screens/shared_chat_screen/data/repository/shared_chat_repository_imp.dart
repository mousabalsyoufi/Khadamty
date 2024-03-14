import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/constants/enums/response_enum.dart';
import 'package:faciltateur_de_vies/screens/shared_chat_screen/data/data_source/send_ticket_provider/send_chat_ticket_api_imp.dart';
import 'package:faciltateur_de_vies/screens/shared_chat_screen/data/data_source/tickets_provider/tickets_api_imp.dart';
import 'package:faciltateur_de_vies/screens/shared_chat_screen/data/model/ticket_model.dart';
import '../../../../core/api_handler/response_handler.dart';
import '../../domain/repository/shared_chat_repository.dart';

// implementation shared Chat repository
class SharedChatRepositoryImp implements SharedChatRepository {
  final TicketsApiImp ticketsApiImp;
  final SendChatTicketApiImp sendChatTicketApiImp;

  SharedChatRepositoryImp({
    required this.ticketsApiImp,
    required this.sendChatTicketApiImp,
  });

  @override
  Future<Either<dynamic, ApiResponse<List<TicketModel>>>> getTickets(
      {required String userId, required String easerId}) async {
    ApiResponse<List<TicketModel>> result;
    try {
      result = await ticketsApiImp.getTickets(userId: userId, easerId: easerId);
      if (result.status == Status.completed) {
        return Right(result);
      } else {
        return Left(result);
      }
    } catch (error) {
      return Left(error);
    }
  }

  @override
  Future<Either<dynamic, ApiResponse<String>>> sendTicket(
      {required String ticketId,
      required String trackId,
      required String message}) async {
    ApiResponse<String> result;
    try {
      result = await sendChatTicketApiImp.sendTicket(
          ticketId: ticketId, trackId: trackId, message: message);
      if (result.status == Status.completed) {
        return Right(result);
      } else {
        return Left(result);
      }
    } catch (error) {
      return Left(error);
    }
  }
}
