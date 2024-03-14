// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:faciltateur_de_vies/shared_models/task_model.dart';

import '../../../../shared_models/multiprice_model.dart';

class OfferDetailsModel {
  String id;
  String color;
  String label;
  String description;
  List<OfferProduct> products;
  String condition;
  bool isSelected;
  OfferDetailsModel({
    required this.id,
    required this.color,
    required this.label,
    required this.description,
    required this.products,
    required this.condition,
    required this.isSelected,
  });

  OfferDetailsModel copyWith({
    String? id,
    String? color,
    String? label,
    String? description,
    List<OfferProduct>? products,
    String? condition,
    bool? isSelected,
  }) {
    return OfferDetailsModel(
      id: id ?? this.id,
      color: color ?? this.color,
      label: label ?? this.label,
      description: description ?? this.description,
      products: products ?? this.products,
      condition: condition ?? this.condition,
      isSelected: isSelected ?? this.isSelected,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'color': color,
      'label': label,
      'description': description,
      'products': products.map((x) => x.toMap()).toList(),
      'condition': condition,
    };
  }

  factory OfferDetailsModel.fromMap(Map<String, dynamic> map) {
    return OfferDetailsModel(
      id: map['id'] as String,
      color: map['color'] as String,
      label: map['label'] as String,
      description: map['description'] as String,
      products: map['products'] != null
          ? (map['products'] as List)
              .map<OfferProduct>((json) => OfferProduct.fromMap(json))
              .toList()
          : [],
      condition: map['condition'] ?? 'Conditions',
      isSelected: false,
    );
  }

  String toJson() => json.encode(toMap());

  factory OfferDetailsModel.fromJson(String source) =>
      OfferDetailsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'OfferDetailsModel(id: $id, color: $color, label: $label, description: $description, products: $products, condition: $condition)';
  }

  @override
  bool operator ==(covariant OfferDetailsModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.color == color &&
        other.label == label &&
        other.description == description &&
        listEquals(other.products, products) &&
        other.condition == condition;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        color.hashCode ^
        label.hashCode ^
        description.hashCode ^
        products.hashCode ^
        condition.hashCode;
  }
}

class OfferProduct {
  String id;
  String label;
  String description;
  String price;
  String priceMin;
  String priceIcludesTax;
  MultiPrice multiprices;
  MultiPrice multipricesIncludesTax;
  MultiPrice multipricesTaxRate;
  List<TaskModel> tasks;
  bool isSelected;
  OfferProduct({
    required this.id,
    required this.label,
    required this.description,
    required this.price,
    required this.priceMin,
    required this.priceIcludesTax,
    required this.multiprices,
    required this.multipricesIncludesTax,
    required this.multipricesTaxRate,
    required this.tasks,
    required this.isSelected,
  });

  OfferProduct copyWith({
    String? id,
    String? label,
    String? description,
    String? price,
    String? priceMin,
    String? priceIcludesTax,
    MultiPrice? multiprices,
    MultiPrice? multipricesIncludesTax,
    MultiPrice? multipricesTaxRate,
    List<TaskModel>? tasks,
    List<TaskModel>? selectedTasks,
    bool? isSelected,
  }) {
    return OfferProduct(
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
      tasks: tasks ?? this.tasks,
      isSelected: isSelected ?? this.isSelected,
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
      'tasks': tasks.map((x) => x.toMap()).toList(),
    };
  }

  factory OfferProduct.fromMap(Map<String, dynamic> map) {
    return OfferProduct(
      id: map['id'] as String,
      label: map['label'] as String,
      description: map['description'] as String,
      price: map['price'] as String,
      priceMin: map['priceMin'] as String,
      priceIcludesTax: map['priceIcludesTax'] as String,
      multiprices:
          MultiPrice.fromMap(map['multiprices'] as Map<String, dynamic>),
      multipricesIncludesTax: MultiPrice.fromMap(
          map['multipricesIncludesTax'] as Map<String, dynamic>),
      multipricesTaxRate:
          MultiPrice.fromMap(map['multipricesTaxRate'] as Map<String, dynamic>),
      tasks: map['tasks'] != null
          ? (map['tasks'] as List)
              .map<TaskModel>((json) => TaskModel.fromMap(json))
              .toList()
          : [],
      isSelected: false,
    );
  }

  String toJson() => json.encode(toMap());

  factory OfferProduct.fromJson(String source) =>
      OfferProduct.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'offerProduct(id: $id, label: $label, description: $description, price: $price, priceMin: $priceMin, priceIcludesTax: $priceIcludesTax, multiprices: $multiprices, multipricesIncludesTax: $multipricesIncludesTax, multipricesTaxRate: $multipricesTaxRate, tasks: $tasks)';
  }

  @override
  bool operator ==(covariant OfferProduct other) {
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
        listEquals(other.tasks, tasks);
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
        tasks.hashCode;
  }
}
