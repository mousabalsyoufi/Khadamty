// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TaskModel {
  String id;
  String label;
  String description;
  String color;
  bool isSelected;
  TaskModel({
    required this.id,
    required this.label,
    required this.description,
    required this.color,
    this.isSelected = false,
  });

  TaskModel copyWith({
    String? id,
    String? label,
    String? description,
    String? color,
    bool? isSelected,
  }) {
    return TaskModel(
      id: id ?? this.id,
      label: label ?? this.label,
      description: description ?? this.description,
      color: color ?? this.color,
      isSelected: isSelected ?? this.isSelected,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'label': label,
      'description': description,
      'color': color,
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      id: map['id'] as String,
      label: map['label'] as String,
      description: map['description'] as String,
      color: map['color'] as String,
      isSelected: false,
    );
  }

  String toJson() => json.encode(toMap());

  factory TaskModel.fromJson(String source) =>
      TaskModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TaskModel(id: $id, label: $label, description: $description, color: $color)';
  }

  @override
  bool operator ==(covariant TaskModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.label == label &&
        other.description == description &&
        other.color == color;
  }

  @override
  int get hashCode {
    return id.hashCode ^ label.hashCode ^ description.hashCode ^ color.hashCode;
  }
}
