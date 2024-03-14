// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:faciltateur_de_vies/shared_models/file_model.dart';

class CatalogModel {
  String id;
  String label;
  List<FileModel> photo;
  int count;
  CatalogModel({
    required this.id,
    required this.label,
    required this.photo,
    required this.count,
  });

  CatalogModel copyWith({
    String? id,
    String? label,
    List<FileModel>? photo,
    int? count,
  }) {
    return CatalogModel(
      id: id ?? this.id,
      label: label ?? this.label,
      photo: photo ?? this.photo,
      count: count ?? this.count,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'label': label,
      'photo': photo.map((x) => x.toMap()).toList(),
    };
  }

  factory CatalogModel.fromMap(Map<String, dynamic> map) {
    return CatalogModel(
      id: map['id'] as String,
      label: map['label'] as String,
      count: 0,
      photo: map['photo'] != null
          ? (map['photo'] as List)
              .map<FileModel>((json) => FileModel.fromMap(json))
              .toList()
          : [],
    );
  }

  String toJson() => json.encode(toMap());

  factory CatalogModel.fromJson(String source) =>
      CatalogModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CatalogModel(id: $id, label: $label, photo: $photo)';

  @override
  bool operator ==(covariant CatalogModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.label == label &&
        listEquals(other.photo, photo);
  }

  @override
  int get hashCode => id.hashCode ^ label.hashCode ^ photo.hashCode;
}
