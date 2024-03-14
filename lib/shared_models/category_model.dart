// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:faciltateur_de_vies/shared_models/file_model.dart';

class CategoryModel {
  String id;
  String color;
  String label;
  String description;
  List<FileModel> photo;
  CategoryModel({
    required this.id,
    required this.color,
    required this.label,
    required this.description,
    required this.photo,
  });

  CategoryModel copyWith({
    String? id,
    String? color,
    String? label,
    String? description,
    List<FileModel>? photo,
  }) {
    return CategoryModel(
      id: id ?? this.id,
      color: color ?? this.color,
      label: label ?? this.label,
      description: description ?? this.description,
      photo: photo ?? this.photo,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'color': color,
      'label': label,
      'description': description,
      'photo': photo.map((x) => x.toMap()).toList(),
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['id'] as String,
      color: map['color'] as String,
      label: map['label'] as String,
      description: map['description'] as String,
      photo: map['photo'] != null
          ? (map['photo'] as List)
              .map<FileModel>((json) => FileModel.fromMap(json))
              .toList()
          : [],
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromJson(String source) =>
      CategoryModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CategoryModel(id: $id, color: $color, label: $label, description: $description, photo: $photo)';
  }

  @override
  bool operator ==(covariant CategoryModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.color == color &&
        other.label == label &&
        other.description == description &&
        listEquals(other.photo, photo);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        color.hashCode ^
        label.hashCode ^
        description.hashCode ^
        photo.hashCode;
  }
}
