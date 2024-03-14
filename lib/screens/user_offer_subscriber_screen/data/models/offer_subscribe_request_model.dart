// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class OfferSubscribeRequestModel {
  String socid;
  String date;
  String contactId;
  int type;

  // the main offer
  LineProduct offer;

  // the services in the offer
  List<LineProduct> childs;
  OfferSubscribeRequestModel({
    required this.socid,
    required this.date,
    required this.contactId,
    required this.type,
    required this.offer,
    required this.childs,
  });

  OfferSubscribeRequestModel copyWith({
    String? socid,
    String? date,
    String? contactId,
    int? type,
    LineProduct? offer,
    List<LineProduct>? childs,
  }) {
    return OfferSubscribeRequestModel(
      socid: socid ?? this.socid,
      date: date ?? this.date,
      contactId: contactId ?? this.contactId,
      type: type ?? this.type,
      offer: offer ?? this.offer,
      childs: childs ?? this.childs,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'socid': socid,
      'date': date,
      'contactId': contactId,
      'type': type,
      'offer': offer.toMap(),
      'childs': childs.map((x) => x.toMap()).toList(),
    };
  }

  factory OfferSubscribeRequestModel.fromMap(Map<String, dynamic> map) {
    return OfferSubscribeRequestModel(
      socid: map['socid'] as String,
      date: map['date'] as String,
      contactId: map['contactId'] as String,
      type: map['type'] as int,
      offer: LineProduct.fromMap(map['offer'] as Map<String, dynamic>),
      childs: map['childs'] != null
          ? (map['childs'] as List)
              .map<LineProduct>((json) => LineProduct.fromMap(json))
              .toList()
          : [],
    );
  }

  String toJson() => json.encode(toMap());

  factory OfferSubscribeRequestModel.fromJson(String source) =>
      OfferSubscribeRequestModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'OfferSubscribeRequestModel(socid: $socid, date: $date, type: $type, offer: $offer, childs: $childs)';
  }

  @override
  bool operator ==(covariant OfferSubscribeRequestModel other) {
    if (identical(this, other)) return true;

    return other.socid == socid &&
        other.date == date &&
        other.type == type &&
        other.offer == offer &&
        listEquals(other.childs, childs);
  }

  @override
  int get hashCode {
    return socid.hashCode ^
        date.hashCode ^
        type.hashCode ^
        offer.hashCode ^
        childs.hashCode;
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
  ArrayOptions arrayOptions;
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
    ArrayOptions? arrayOptions,
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
      'arrayOptions': arrayOptions.toMap() ,
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
      arrayOptions: ArrayOptions.fromMap(map['arrayOptions']),
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

class ArrayOptions {
  String optionsIdtasks;
  ArrayOptions({
    required this.optionsIdtasks,
  });

  ArrayOptions copyWith({
    String? optionsIdtasks,
  }) {
    return ArrayOptions(
      optionsIdtasks: optionsIdtasks ?? this.optionsIdtasks,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'optionsIdtasks': optionsIdtasks,
    };
  }

  factory ArrayOptions.fromMap(Map<String, dynamic> map) {
    return ArrayOptions(
      optionsIdtasks: map['optionsIdtasks'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ArrayOptions.fromJson(String source) =>
      ArrayOptions.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ArrayOptions(optionsIdtasks: $optionsIdtasks)';

  @override
  bool operator ==(covariant ArrayOptions other) {
    if (identical(this, other)) return true;

    return other.optionsIdtasks == optionsIdtasks;
  }

  @override
  int get hashCode => optionsIdtasks.hashCode;
}
