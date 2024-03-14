// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TicketModel {
  String id;
  String subject;
  String message;
  String datec;
  String dateRead;
  String dateClose;
  String dateCreation;
  String dateModification;
  String socId;
  String fkSoc;
  String fkUserAssign;
  String fkStatus;
  String trackId;
  TicketModel({
    required this.id,
    required this.subject,
    required this.message,
    required this.datec,
    required this.dateRead,
    required this.dateClose,
    required this.dateCreation,
    required this.dateModification,
    required this.socId,
    required this.fkSoc,
    required this.fkUserAssign,
    required this.fkStatus,
    required this.trackId,
  });

  TicketModel copyWith({
    String? id,
    String? subject,
    String? message,
    String? datec,
    String? dateRead,
    String? dateClose,
    String? dateCreation,
    String? dateModification,
    String? socId,
    String? fkSoc,
    String? fkUserAssign,
    String? fkStatus,
    String? trackId,
  }) {
    return TicketModel(
      id: id ?? this.id,
      subject: subject ?? this.subject,
      message: message ?? this.message,
      datec: datec ?? this.datec,
      dateRead: dateRead ?? this.dateRead,
      dateClose: dateClose ?? this.dateClose,
      dateCreation: dateCreation ?? this.dateCreation,
      dateModification: dateModification ?? this.dateModification,
      socId: socId ?? this.socId,
      fkSoc: fkSoc ?? this.fkSoc,
      fkUserAssign: fkUserAssign ?? this.fkUserAssign,
      fkStatus: fkStatus ?? this.fkStatus,
      trackId: trackId ?? this.trackId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'subject': subject,
      'message': message,
      'datec': datec,
      'dateRead': dateRead,
      'dateClose': dateClose,
      'dateCreation': dateCreation,
      'dateModification': dateModification,
      'socId': socId,
      'fkSoc': fkSoc,
      'fkUserAssign': fkUserAssign,
      'fkStatus': fkStatus,
      'trackId': trackId,
    };
  }

  factory TicketModel.fromMap(Map<String, dynamic> map) {
    return TicketModel(
      id: map['id'] as String,
      subject: map['subject'] as String,
      message: map['message'] as String,
      datec: map['datec'].toString(),
      dateRead: map['date_read'].toString(),
      dateClose: map['date_close'].toString(),
      dateCreation: map['date_creation'].toString(),
      dateModification: map['date_modification'].toString(),
      socId: map['socid'] as String,
      fkSoc: map['fk_soc'] as String,
      fkUserAssign: map['fk_user_assign'] as String,
      fkStatus: map['fk_statut'] as String,
      trackId: map['track_id'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory TicketModel.fromJson(String source) => TicketModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TicketModel(id: $id, subject: $subject, message: $message, datec: $datec, dateRead: $dateRead, dateClose: $dateClose, dateCreation: $dateCreation, dateModification: $dateModification, socId: $socId, fkSoc: $fkSoc, fkUserAssign: $fkUserAssign, fkStatus: $fkStatus, trackId: $trackId)';
  }

  @override
  bool operator ==(covariant TicketModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.subject == subject &&
      other.message == message &&
      other.datec == datec &&
      other.dateRead == dateRead &&
      other.dateClose == dateClose &&
      other.dateCreation == dateCreation &&
      other.dateModification == dateModification &&
      other.socId == socId &&
      other.fkSoc == fkSoc &&
      other.fkUserAssign == fkUserAssign &&
      other.fkStatus == fkStatus &&
      other.trackId == trackId;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      subject.hashCode ^
      message.hashCode ^
      datec.hashCode ^
      dateRead.hashCode ^
      dateClose.hashCode ^
      dateCreation.hashCode ^
      dateModification.hashCode ^
      socId.hashCode ^
      fkSoc.hashCode ^
      fkUserAssign.hashCode ^
      fkStatus.hashCode ^
      trackId.hashCode;
  }
}
