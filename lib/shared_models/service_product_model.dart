import 'dart:convert';

import 'multiprice_model.dart';

class ServiceProductModel {
  String id;
  String label;
  String description;
  String price;
  String priceMin;
  String priceIcludesTax;
  MultiPrice multiprices;
  MultiPrice multipricesIncludesTax;
  MultiPrice multipricesTaxRate;
  ServiceProductModel({
    required this.id,
    required this.label,
    required this.description,
    required this.price,
    required this.priceMin,
    required this.priceIcludesTax,
    required this.multiprices,
    required this.multipricesIncludesTax,
    required this.multipricesTaxRate,
  });

  ServiceProductModel copyWith({
    String? id,
    String? label,
    String? description,
    String? price,
    String? priceMin,
    String? priceIcludesTax,
    MultiPrice? multiprices,
    MultiPrice? multipricesIncludesTax,
    MultiPrice? multipricesTaxRate,
  }) {
    return ServiceProductModel(
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
    };
  }

  factory ServiceProductModel.fromMap(Map<String, dynamic> map) {
    return ServiceProductModel(
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
    );
  }

  String toJson() => json.encode(toMap());

  factory ServiceProductModel.fromJson(String source) =>
      ServiceProductModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ServiceProduct(id: $id, label: $label, description: $description, price: $price, priceMin: $priceMin, priceIcludesTax: $priceIcludesTax, multiprices: $multiprices, multipricesIncludesTax: $multipricesIncludesTax, multipricesTaxRate: $multipricesTaxRate)';
  }

  @override
  bool operator ==(covariant ServiceProductModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.label == label &&
        other.description == description &&
        other.price == price &&
        other.priceMin == priceMin &&
        other.priceIcludesTax == priceIcludesTax &&
        other.multiprices == multiprices &&
        other.multipricesIncludesTax == multipricesIncludesTax &&
        other.multipricesTaxRate == multipricesTaxRate;
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
        multipricesTaxRate.hashCode;
  }
}
