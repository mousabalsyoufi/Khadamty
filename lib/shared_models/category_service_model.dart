// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:faciltateur_de_vies/shared_models/service_image_model.dart';
import 'package:flutter/foundation.dart';

import 'package:faciltateur_de_vies/shared_models/file_model.dart';

import 'multiprice_model.dart';

class CategoryServiceModel {
  String id;
  String label;
  String description;
  String price;
  String priceMin;
  String priceIcludesTax;
  MultiPrice multiprices;
  MultiPrice multipricesIncludesTax;
  MultiPrice multipricesTaxRate;
  List<FileModel> photo;
  List<ServiceImageModel> images;
  CategoryServiceModel({
    required this.id,
    required this.label,
    required this.description,
    required this.price,
    required this.priceMin,
    required this.priceIcludesTax,
    required this.multiprices,
    required this.multipricesIncludesTax,
    required this.multipricesTaxRate,
    required this.photo,
    required this.images,
  });

  CategoryServiceModel copyWith({
    String? id,
    String? label,
    String? description,
    String? price,
    String? priceMin,
    String? priceIcludesTax,
    MultiPrice? multiprices,
    MultiPrice? multipricesIncludesTax,
    MultiPrice? multipricesTaxRate,
    List<FileModel>? photo,
    List<ServiceImageModel>? images,
  }) {
    return CategoryServiceModel(
      id: id ?? this.id,
      label: label ?? this.label,
      description: description ?? this.description,
      price: price ?? this.price,
      priceMin: priceMin ?? this.priceMin,
      priceIcludesTax: priceIcludesTax ?? this.priceIcludesTax,
      multiprices: multiprices ?? this.multiprices,
      multipricesIncludesTax:
          multipricesIncludesTax ?? this.multipricesIncludesTax,
      multipricesTaxRate: multipricesTaxRate ?? this.multipricesTaxRate,
      photo: photo ?? this.photo,
      images: images ?? this.images,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'label': label,
      'description': description,
      'price': price,
      'priceMin': priceMin,
      'priceIcludesTax': priceIcludesTax,
      'multiprices': multiprices.toMap(),
      'multipricesIncludesTax': multipricesIncludesTax.toMap(),
      'multipricesTaxRate': multipricesTaxRate.toMap(),
      'photo': photo.map((x) => x.toMap()).toList(),
      'imaegs': images.map((x) => x.toMap()).toList(),
    };
  }

  static String getPriceAttribute(
      Map<String, dynamic> map, String attribute, bool isOffer) {
    var price = isOffer
        ? map['price'] != null
            ? map['price'][attribute]
            : '00.00000'
        : map[attribute];
    return price != null ? price as String : '00.000000';
  }

  static MultiPrice getMultiPriceAttribute(
      Map<String, dynamic> map, String attribute, bool isOffer) {
    var multiPrice = isOffer
        ? map['price'] != null
            ? map['price'][attribute]
            : {'1': '00.0000000', '2': '00.0000000'}
        : map[attribute];
    return MultiPrice.fromMap(multiPrice != null
        ? multiPrice as Map<String, dynamic>
        : {'1': '00.0000000', '2': '00.0000000'});
  }

  factory CategoryServiceModel.fromMap(Map<String, dynamic> map,
      {bool isOffer = false}) {
    return CategoryServiceModel(
      id: map['id'] as String,
      label: map['label'] as String,
      description: map['description'] as String,
      price: getPriceAttribute(map, 'price', isOffer),
      priceMin: getPriceAttribute(map, 'priceMin', isOffer),
      priceIcludesTax: getPriceAttribute(map, 'priceIcludesTax', isOffer),
      multiprices: getMultiPriceAttribute(map, 'multiprices', isOffer),
      multipricesIncludesTax:
          getMultiPriceAttribute(map, 'multipricesIncludesTax', isOffer),
      multipricesTaxRate:
          getMultiPriceAttribute(map, 'multipricesTaxRate', isOffer),
      photo: map['photo'] != null
          ? (map['photo'] as List)
              .map<FileModel>((json) => FileModel.fromMap(json))
              .toList()
          : [],
      images: map['images'] != null
          ? (map['images'] as List)
              .map<ServiceImageModel>((json) => ServiceImageModel.fromMap(json))
              .toList()
          : [],
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryServiceModel.fromJson(String source) =>
      CategoryServiceModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CategoryServiceModel(id: $id, label: $label, description: $description, price: $price, priceMin: $priceMin, priceIcludesTax: $priceIcludesTax, multiprices: $multiprices, multipricesIncludesTax: $multipricesIncludesTax, multipricesTaxRate: $multipricesTaxRate, photo: $photo)';
  }

  @override
  bool operator ==(covariant CategoryServiceModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.label == label &&
        other.description == description &&
        other.price == price &&
        other.priceMin == priceMin &&
        other.priceIcludesTax == priceIcludesTax &&
        other.multiprices == multiprices &&
        other.multipricesIncludesTax == multipricesIncludesTax &&
        other.multipricesTaxRate == multipricesTaxRate &&
        listEquals(other.photo, photo);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        label.hashCode ^
        description.hashCode ^
        price.hashCode ^
        priceMin.hashCode ^
        priceIcludesTax.hashCode ^
        multiprices.hashCode ^
        multipricesIncludesTax.hashCode ^
        multipricesTaxRate.hashCode ^
        photo.hashCode;
  }
}
