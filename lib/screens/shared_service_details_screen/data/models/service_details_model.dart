// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:faciltateur_de_vies/shared_models/task_model.dart';

import '../../../../shared_models/file_model.dart';
import '../../../../shared_models/service_product_model.dart';

class ServiceDetailsModel {
  ServiceProductModel product;
  List<TaskModel> tasks;
  String condition;
  List<FileModel> photo;
  ServiceDetailsModel({
    required this.product,
    required this.tasks,
    required this.condition,
    required this.photo,
  });

  ServiceDetailsModel copyWith({
    ServiceProductModel? product,
    List<TaskModel>? tasks,
    String? condition,
    List<FileModel>? photo,
  }) {
    return ServiceDetailsModel(
      product: product ?? this.product,
      tasks: tasks ?? this.tasks,
      condition: condition ?? this.condition,
      photo: photo ?? this.photo,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'product': product.toMap(),
      'tasks': tasks.map((x) => x.toMap()).toList(),
      'condition': condition,
      'photo': photo.map((x) => x.toMap()).toList(),
    };
  }

  factory ServiceDetailsModel.fromMap(Map<String, dynamic> map) {
    return ServiceDetailsModel(
      product: ServiceProductModel.fromMap(map['product'] as Map<String, dynamic>),
      tasks: map['tasks'] != null
          ? (map['tasks'] as List)
              .map<TaskModel>((json) => TaskModel.fromMap(json))
              .toList()
          : [],
      condition: map['condition'] as String,
      photo: map['photo'] != null
          ? (map['photo'] as List)
              .map<FileModel>((json) => FileModel.fromMap(json))
              .toList()
          : [],
    );
  }

  String toJson() => json.encode(toMap());

  factory ServiceDetailsModel.fromJson(String source) =>
      ServiceDetailsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ServiceDetailsModel(product: $product, tasks: $tasks, condition: $condition, photo: $photo)';
  }

  @override
  bool operator ==(covariant ServiceDetailsModel other) {
    if (identical(this, other)) return true;

    return other.product == product &&
        listEquals(other.tasks, tasks) &&
        other.condition == condition &&
        listEquals(other.photo, photo);
  }

  @override
  int get hashCode {
    return product.hashCode ^
        tasks.hashCode ^
        condition.hashCode ^
        photo.hashCode;
  }
}

