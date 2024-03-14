// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:faciltateur_de_vies/shared_models/address_model.dart';

class ServiceReservationDetailsModel {
  int date;
  String totalHt;
  String totalTva;
  String totalLocaltax1;
  String totalLocaltax2;
  String totalTtc;
  String multicurrencyCode;
  String multicurrencyTx;
  String multicurrencyTotalHt;
  String multicurrencyTotalTva;
  String multicurrencyTotalTtc;
  String? instructions;
  // lines are the products which are the services
  List<ServiceProduct> lines;
  AddressModel? contact;
  ServiceReservationDetailsModel({
    required this.date,
    required this.totalHt,
    required this.totalTva,
    required this.totalLocaltax1,
    required this.totalLocaltax2,
    required this.totalTtc,
    required this.multicurrencyCode,
    required this.multicurrencyTx,
    required this.multicurrencyTotalHt,
    required this.multicurrencyTotalTva,
    required this.multicurrencyTotalTtc,
    required this.instructions,
    required this.lines,
    required this.contact,
  });

  ServiceReservationDetailsModel copyWith({
    int? date,
    String? totalHt,
    String? totalTva,
    String? totalLocaltax1,
    String? totalLocaltax2,
    String? totalTtc,
    String? multicurrencyCode,
    String? multicurrencyTx,
    String? multicurrencyTotalHt,
    String? multicurrencyTotalTva,
    String? multicurrencyTotalTtc,
    String? instructions,
    List<ServiceProduct>? lines,
    AddressModel? contact,
  }) {
    return ServiceReservationDetailsModel(
      date: date ?? this.date,
      totalHt: totalHt ?? this.totalHt,
      totalTva: totalTva ?? this.totalTva,
      totalLocaltax1: totalLocaltax1 ?? this.totalLocaltax1,
      totalLocaltax2: totalLocaltax2 ?? this.totalLocaltax2,
      totalTtc: totalTtc ?? this.totalTtc,
      multicurrencyCode: multicurrencyCode ?? this.multicurrencyCode,
      multicurrencyTx: multicurrencyTx ?? this.multicurrencyTx,
      multicurrencyTotalHt: multicurrencyTotalHt ?? this.multicurrencyTotalHt,
      multicurrencyTotalTva:
          multicurrencyTotalTva ?? this.multicurrencyTotalTva,
      multicurrencyTotalTtc:
          multicurrencyTotalTtc ?? this.multicurrencyTotalTtc,
      instructions: instructions ?? this.instructions,
      lines: lines ?? this.lines,
      contact: contact ?? this.contact,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'date': date,
      'totalHt': totalHt,
      'totalTva': totalTva,
      'totalLocaltax1': totalLocaltax1,
      'totalLocaltax2': totalLocaltax2,
      'totalTtc': totalTtc,
      'multicurrencyCode': multicurrencyCode,
      'multicurrencyTx': multicurrencyTx,
      'multicurrencyTotalHt': multicurrencyTotalHt,
      'multicurrencyTotalTva': multicurrencyTotalTva,
      'multicurrencyTotalTtc': multicurrencyTotalTtc,
      'note_public': instructions,
      'lines': lines.map((x) => x.toMap()).toList(),
      'contact': contact!.toMap(),
    };
  }

  factory ServiceReservationDetailsModel.fromMap(Map<String, dynamic> map) {
    return ServiceReservationDetailsModel(
        date: map['date'] as int,
        totalHt: map['total_ht'] as String,
        totalTva: map['total_tva'] as String,
        totalLocaltax1: map['total_localtax1'] as String,
        totalLocaltax2: map['total_localtax2'] as String,
        totalTtc: map['total_ttc'] as String,
        multicurrencyCode: map['multicurrency_code'] as String,
        multicurrencyTx: map['multicurrency_tx'] as String,
        multicurrencyTotalHt: map['multicurrency_total_ht'] as String,
        multicurrencyTotalTva: map['multicurrency_total_tva'] as String,
        multicurrencyTotalTtc: map['multicurrency_total_ttc'] as String,
        instructions: map['note_public'],
        lines: map['lines'] != null
            ? (map['lines'] as List)
                .map<ServiceProduct>((json) => ServiceProduct.fromMap(json))
                .toList()
            : [],
        contact: map['contact'] != null
            ? AddressModel.fromMap(map['contact'])
            : AddressModel(
                id: '',
                email: '',
                lastname: '',
                address: '',
                zip: '',
                town: '',
                arrayOptions:
                    ArrayOptions(surface: '', lat: '0.000', long: '0.000')));
  }

  String toJson() => json.encode(toMap());

  factory ServiceReservationDetailsModel.fromJson(String source) =>
      ServiceReservationDetailsModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ServicereservationDetails(date: $date, totalHt: $totalHt, totalTva: $totalTva, totalLocaltax1: $totalLocaltax1, totalLocaltax2: $totalLocaltax2, totalTtc: $totalTtc, multicurrencyCode: $multicurrencyCode, multicurrencyTx: $multicurrencyTx, multicurrencyTotalHt: $multicurrencyTotalHt, multicurrencyTotalTva: $multicurrencyTotalTva, multicurrencyTotalTtc: $multicurrencyTotalTtc, lines: $lines)';
  }

  @override
  bool operator ==(covariant ServiceReservationDetailsModel other) {
    if (identical(this, other)) return true;

    return other.date == date &&
        other.totalHt == totalHt &&
        other.totalTva == totalTva &&
        other.totalLocaltax1 == totalLocaltax1 &&
        other.totalLocaltax2 == totalLocaltax2 &&
        other.totalTtc == totalTtc &&
        other.multicurrencyCode == multicurrencyCode &&
        other.multicurrencyTx == multicurrencyTx &&
        other.multicurrencyTotalHt == multicurrencyTotalHt &&
        other.multicurrencyTotalTva == multicurrencyTotalTva &&
        other.multicurrencyTotalTtc == multicurrencyTotalTtc &&
        listEquals(other.lines, lines);
  }

  @override
  int get hashCode {
    return date.hashCode ^
        totalHt.hashCode ^
        totalTva.hashCode ^
        totalLocaltax1.hashCode ^
        totalLocaltax2.hashCode ^
        totalTtc.hashCode ^
        multicurrencyCode.hashCode ^
        multicurrencyTx.hashCode ^
        multicurrencyTotalHt.hashCode ^
        multicurrencyTotalTva.hashCode ^
        multicurrencyTotalTtc.hashCode ^
        lines.hashCode;
  }
}

class ServiceProduct {
  String id;
  int dateStart;
  int dateEnd;
  String productLabel;
  String productDesc;
  String price;
  String subPrice;
  String tvaTx;
  String multicurrencySubprice;
  String multicurrencyTotalHt;
  String multicurrencyTotalTva;
  String multicurrencyTotalTtc;
  String totalHt;
  String totalTva;
  String totalLocaltax1;
  String totalLocaltax2;
  String totalTtc;
  OrderArrayOptions? orderArrayOptions;
  ServiceProduct({
    required this.id,
    required this.dateStart,
    required this.dateEnd,
    required this.productLabel,
    required this.productDesc,
    required this.price,
    required this.subPrice,
    required this.tvaTx,
    required this.multicurrencySubprice,
    required this.multicurrencyTotalHt,
    required this.multicurrencyTotalTva,
    required this.multicurrencyTotalTtc,
    required this.totalHt,
    required this.totalTva,
    required this.totalLocaltax1,
    required this.totalLocaltax2,
    required this.totalTtc,
    required this.orderArrayOptions,
  });

  ServiceProduct copyWith({
    String? id,
    int? dateStart,
    int? dateEnd,
    String? productLabel,
    String? productDesc,
    String? price,
    String? subPrice,
    String? tvaTx,
    String? multicurrencySubprice,
    String? multicurrencyTotalHt,
    String? multicurrencyTotalTva,
    String? multicurrencyTotalTtc,
    String? totalHt,
    String? totalTva,
    String? totalLocaltax1,
    String? totalLocaltax2,
    String? totalTtc,
    OrderArrayOptions? orderArrayOptions,
  }) {
    return ServiceProduct(
      id: id ?? this.id,
      dateStart: dateStart ?? this.dateStart,
      dateEnd: dateEnd ?? this.dateEnd,
      productLabel: productLabel ?? this.productLabel,
      productDesc: productDesc ?? this.productDesc,
      price: price ?? this.price,
      subPrice: subPrice ?? this.subPrice,
      tvaTx: tvaTx ?? this.tvaTx,
      multicurrencySubprice:
          multicurrencySubprice ?? this.multicurrencySubprice,
      multicurrencyTotalHt: multicurrencyTotalHt ?? this.multicurrencyTotalHt,
      multicurrencyTotalTva:
          multicurrencyTotalTva ?? this.multicurrencyTotalTva,
      multicurrencyTotalTtc:
          multicurrencyTotalTtc ?? this.multicurrencyTotalTtc,
      totalHt: totalHt ?? this.totalHt,
      totalTva: totalTva ?? this.totalTva,
      totalLocaltax1: totalLocaltax1 ?? this.totalLocaltax1,
      totalLocaltax2: totalLocaltax2 ?? this.totalLocaltax2,
      totalTtc: totalTtc ?? this.totalTtc,
      orderArrayOptions: orderArrayOptions ?? this.orderArrayOptions,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'dateStart': dateStart,
      'dateEnd': dateEnd,
      'productLabel': productLabel,
      'productDesc': productDesc,
      'price': price,
      'subPrice': subPrice,
      'tvaTx': tvaTx,
      'multicurrencySubprice': multicurrencySubprice,
      'multicurrencyTotalHt': multicurrencyTotalHt,
      'multicurrencyTotalTva': multicurrencyTotalTva,
      'multicurrencyTotalTtc': multicurrencyTotalTtc,
      'totalHt': totalHt,
      'totalTva': totalTva,
      'totalLocaltax1': totalLocaltax1,
      'totalLocaltax2': totalLocaltax2,
      'totalTtc': totalTtc,
    };
  }

  factory ServiceProduct.fromMap(Map<String, dynamic> map) {
    return ServiceProduct(
      id: map['id'] as String,
      dateStart: map['date_start'] != '' ? map['date_start'] as int : -3600,
      dateEnd: map['date_end'] != '' ? map['date_end'] as int : -3600,
      productLabel: map['product_label'] as String,
      productDesc: map['product_desc'] as String,
      price: map['price'] as String,
      subPrice: map['subprice'] as String,
      tvaTx: map['tva_tx'] as String,
      multicurrencySubprice: map['multicurrency_subprice'] as String,
      multicurrencyTotalHt: map['multicurrency_total_ht'] as String,
      multicurrencyTotalTva: map['multicurrency_total_tva'] as String,
      multicurrencyTotalTtc: map['multicurrency_total_ttc'] as String,
      totalHt: map['total_ht'] as String,
      totalTva: map['total_tva'] as String,
      totalLocaltax1: map['total_localtax1'] as String,
      totalLocaltax2: map['total_localtax2'] as String,
      totalTtc: map['total_ttc'] as String,
      orderArrayOptions:
          map['array_options'] is List || map['array_options'] == null
              ? OrderArrayOptions()
              : OrderArrayOptions.fromMap(map['array_options']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ServiceProduct.fromJson(String source) =>
      ServiceProduct.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ServiceProduct(id: $id, dateStart: $dateStart, dateEnd: $dateEnd, productLabel: $productLabel, productDesc: $productDesc, price: $price, subPrice: $subPrice, tvaTx: $tvaTx, multicurrencySubprice: $multicurrencySubprice, multicurrencyTotalHt: $multicurrencyTotalHt, multicurrencyTotalTva: $multicurrencyTotalTva, multicurrencyTotalTtc: $multicurrencyTotalTtc, totalHt: $totalHt, totalTva: $totalTva, totalLocaltax1: $totalLocaltax1, totalLocaltax2: $totalLocaltax2, totalTtc: $totalTtc)';
  }

  @override
  bool operator ==(covariant ServiceProduct other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.dateStart == dateStart &&
        other.dateEnd == dateEnd &&
        other.productLabel == productLabel &&
        other.productDesc == productDesc &&
        other.price == price &&
        other.subPrice == subPrice &&
        other.tvaTx == tvaTx &&
        other.multicurrencySubprice == multicurrencySubprice &&
        other.multicurrencyTotalHt == multicurrencyTotalHt &&
        other.multicurrencyTotalTva == multicurrencyTotalTva &&
        other.multicurrencyTotalTtc == multicurrencyTotalTtc &&
        other.totalHt == totalHt &&
        other.totalTva == totalTva &&
        other.totalLocaltax1 == totalLocaltax1 &&
        other.totalLocaltax2 == totalLocaltax2 &&
        other.totalTtc == totalTtc;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        dateStart.hashCode ^
        dateEnd.hashCode ^
        productLabel.hashCode ^
        productDesc.hashCode ^
        price.hashCode ^
        subPrice.hashCode ^
        tvaTx.hashCode ^
        multicurrencySubprice.hashCode ^
        multicurrencyTotalHt.hashCode ^
        multicurrencyTotalTva.hashCode ^
        multicurrencyTotalTtc.hashCode ^
        totalHt.hashCode ^
        totalTva.hashCode ^
        totalLocaltax1.hashCode ^
        totalLocaltax2.hashCode ^
        totalTtc.hashCode;
  }
}

class OrderArrayOptions {
  String? optionsEfficacite;
  String? optionsPonctualite;
  String? optionsPresentation;
  String? optionsAvisgeneral;
  OrderArrayOptions({
    this.optionsEfficacite,
    this.optionsPonctualite,
    this.optionsPresentation,
    this.optionsAvisgeneral,
  });

  OrderArrayOptions copyWith({
    String? optionsEfficacite,
    String? optionsPonctualite,
    String? optionsPresentation,
    String? optionsAvisgeneral,
  }) {
    return OrderArrayOptions(
      optionsEfficacite: optionsEfficacite ?? this.optionsEfficacite,
      optionsPonctualite: optionsPonctualite ?? this.optionsPonctualite,
      optionsPresentation: optionsPresentation ?? this.optionsPresentation,
      optionsAvisgeneral: optionsAvisgeneral ?? this.optionsAvisgeneral,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'options_efficacite': optionsEfficacite,
      'options_ponctualite': optionsPonctualite,
      'options_presentation': optionsPresentation,
      'options_avisgeneral': optionsAvisgeneral,
    };
  }

  factory OrderArrayOptions.fromMap(Map<String, dynamic> map) {
    return OrderArrayOptions(
      optionsEfficacite: map['options_efficacite'] != null
          ? map['options_efficacite'] as String
          : null,
      optionsPonctualite: map['options_ponctualite'] != null
          ? map['options_ponctualite'] as String
          : null,
      optionsPresentation: map['options_presentation'] != null
          ? map['options_presentation'] as String
          : null,
      optionsAvisgeneral: map['options_avisgeneral'] != null
          ? map['options_avisgeneral'] as String
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderArrayOptions.fromJson(String source) =>
      OrderArrayOptions.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'OrderArrayOptions(optionsEfficacite: $optionsEfficacite, optionsPonctualite: $optionsPonctualite, optionsPresentation: $optionsPresentation, optionsAvisgeneral: $optionsAvisgeneral)';
  }

  @override
  bool operator ==(covariant OrderArrayOptions other) {
    if (identical(this, other)) return true;

    return other.optionsEfficacite == optionsEfficacite &&
        other.optionsPonctualite == optionsPonctualite &&
        other.optionsPresentation == optionsPresentation &&
        other.optionsAvisgeneral == optionsAvisgeneral;
  }

  @override
  int get hashCode {
    return optionsEfficacite.hashCode ^
        optionsPonctualite.hashCode ^
        optionsPresentation.hashCode ^
        optionsAvisgeneral.hashCode;
  }
}
