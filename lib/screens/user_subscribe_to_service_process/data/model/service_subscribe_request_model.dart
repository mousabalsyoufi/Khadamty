// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class ServiceSubscribeRequestModel {
  String socid;
  String date;
  int type;
  String instructions;
  String contactId;
  PaymentInfo extraInfoForPayment;
  bool subscriptionType;
  List<LineProduct> lines;
  ServiceSubscribeRequestModel({
    required this.socid,
    required this.date,
    required this.type,
    required this.instructions,
    required this.contactId,
    required this.extraInfoForPayment,
    this.subscriptionType = true,
    required this.lines,
  });

  ServiceSubscribeRequestModel copyWith({
    String? socid,
    String? date,
    int? type,
    String? instructions,
    String? contactId,
    PaymentInfo? extraInfoForPayment,
    List<LineProduct>? lines,
  }) {
    return ServiceSubscribeRequestModel(
      socid: socid ?? this.socid,
      date: date ?? this.date,
      type: type ?? this.type,
      instructions: instructions ?? this.instructions,
      contactId: contactId ?? this.contactId,
      extraInfoForPayment: extraInfoForPayment ?? this.extraInfoForPayment,
      lines: lines ?? this.lines,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'socid': socid,
      'date': date,
      'type': type,
      'note_public': instructions,
      'contactId': contactId,
      'subscriptionType': subscriptionType,
      'extraInfoForPayment': extraInfoForPayment.toMap(),
      'lines': lines.map((x) => x.toMap()).toList(),
    };
  }

  factory ServiceSubscribeRequestModel.fromMap(Map<String, dynamic> map) {
    return ServiceSubscribeRequestModel(
      socid: map['socid'] as String,
      date: map['date'] as String,
      type: map['type'] as int,
      instructions: map['note_public'] as String,
      contactId: map['contactId'] as String,
      extraInfoForPayment: PaymentInfo.fromMap(
          map['extraInfoForPayment'] as Map<String, dynamic>),
      lines: List<LineProduct>.from(
        (map['lines'] as List<int>).map<LineProduct>(
          (x) => LineProduct.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory ServiceSubscribeRequestModel.fromJson(String source) =>
      ServiceSubscribeRequestModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ServiceSubscribeRequestModel(socid: $socid, date: $date, type: $type, extraInfoForPayment: $extraInfoForPayment, lines: $lines)';
  }

  @override
  bool operator ==(covariant ServiceSubscribeRequestModel other) {
    if (identical(this, other)) return true;

    return other.socid == socid &&
        other.date == date &&
        other.type == type &&
        other.extraInfoForPayment == extraInfoForPayment &&
        listEquals(other.lines, lines);
  }

  @override
  int get hashCode {
    return socid.hashCode ^
        date.hashCode ^
        type.hashCode ^
        extraInfoForPayment.hashCode ^
        lines.hashCode;
  }
}

class PaymentInfo {
  int datepaye;
  String closepaidinvoices;
  String accountid;
  String paymentid;
  String numPayment;
  String comment;
  PaymentInfo({
    required this.datepaye,
    required this.closepaidinvoices,
    required this.accountid,
    required this.paymentid,
    required this.numPayment,
    required this.comment,
  });

  PaymentInfo copyWith({
    int? datepaye,
    String? closepaidinvoices,
    String? accountid,
    String? paymentid,
    String? numPayment,
    String? comment,
  }) {
    return PaymentInfo(
      datepaye: datepaye ?? this.datepaye,
      closepaidinvoices: closepaidinvoices ?? this.closepaidinvoices,
      accountid: accountid ?? this.accountid,
      paymentid: paymentid ?? this.paymentid,
      numPayment: numPayment ?? this.numPayment,
      comment: comment ?? this.comment,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'datepaye': datepaye,
      'closepaidinvoices': closepaidinvoices,
      'accountid': accountid,
      'paymentid': paymentid,
      'num_payment': numPayment,
      'comment': comment,
    };
  }

  factory PaymentInfo.fromMap(Map<String, dynamic> map) {
    return PaymentInfo(
      datepaye: map['datepaye'] as int,
      closepaidinvoices: map['closepaidinvoices'] as String,
      accountid: map['accountid'] as String,
      paymentid: map['paymentid'] as String,
      numPayment: map['num_payment'] as String,
      comment: map['comment'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PaymentInfo.fromJson(String source) =>
      PaymentInfo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PaymentInfo(datepaye: $datepaye, closepaidinvoices: $closepaidinvoices, accountid: $accountid, paymentid: $paymentid, numPayment: $numPayment, comment: $comment)';
  }

  @override
  bool operator ==(covariant PaymentInfo other) {
    if (identical(this, other)) return true;

    return other.datepaye == datepaye &&
        other.closepaidinvoices == closepaidinvoices &&
        other.accountid == accountid &&
        other.paymentid == paymentid &&
        other.numPayment == numPayment &&
        other.comment == comment;
  }

  @override
  int get hashCode {
    return datepaye.hashCode ^
        closepaidinvoices.hashCode ^
        accountid.hashCode ^
        paymentid.hashCode ^
        numPayment.hashCode ^
        comment.hashCode;
  }
}

// the product to be stored as row sales in dollibar
class LineProduct {
  String productId;
  String qty;
  String tvaTx;
  String subprice;
  String dateStart;
  String dateEnd;
  // description of the tasks included in the service combined in a string
  String desc;
  // the tasks selected in the service IDs seperated by /
  String arrayOptions;
  LineProduct({
    required this.productId,
    required this.qty,
    required this.tvaTx,
    required this.subprice,
    required this.dateStart,
    required this.dateEnd,
    required this.desc,
    required this.arrayOptions,
  });

  LineProduct copyWith({
    String? productId,
    String? qty,
    String? tvaTx,
    String? subprice,
    String? dateStart,
    String? dateEnd,
    String? desc,
    String? arrayOptions,
  }) {
    return LineProduct(
      productId: productId ?? this.productId,
      qty: qty ?? this.qty,
      tvaTx: tvaTx ?? this.tvaTx,
      subprice: subprice ?? this.subprice,
      dateStart: dateStart ?? this.dateStart,
      dateEnd: dateEnd ?? this.dateEnd,
      desc: desc ?? this.desc,
      arrayOptions: arrayOptions ?? this.arrayOptions,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'productId': productId,
      'qty': qty,
      'tva_tx': tvaTx,
      'subprice': subprice,
      'dateStart': dateStart,
      'dateEnd': dateEnd,
      'desc': desc,
      'arrayOptions': arrayOptions,
    };
  }

  factory LineProduct.fromMap(Map<String, dynamic> map) {
    return LineProduct(
      productId: map['productId'] as String,
      qty: map['qty'] as String,
      tvaTx: map['tva_tx'] as String,
      subprice: map['subprice'] as String,
      dateStart: map['dateStart'] as String,
      dateEnd: map['dateEnd'] as String,
      desc: map['desc'] as String,
      arrayOptions: map['arrayOptions'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory LineProduct.fromJson(String source) =>
      LineProduct.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'LineProduct(productId: $productId, qty: $qty, tvaTx: $tvaTx, subprice: $subprice, dateStart: $dateStart, dateEnd: $dateEnd, desc: $desc, arrayOptions: $arrayOptions)';
  }

  @override
  bool operator ==(covariant LineProduct other) {
    if (identical(this, other)) return true;

    return other.productId == productId &&
        other.qty == qty &&
        other.tvaTx == tvaTx &&
        other.subprice == subprice &&
        other.dateStart == dateStart &&
        other.dateEnd == dateEnd &&
        other.desc == desc &&
        other.arrayOptions == arrayOptions;
  }

  @override
  int get hashCode {
    return productId.hashCode ^
        qty.hashCode ^
        tvaTx.hashCode ^
        subprice.hashCode ^
        dateStart.hashCode ^
        dateEnd.hashCode ^
        desc.hashCode ^
        arrayOptions.hashCode;
  }
}
