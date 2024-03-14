// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class NotificationsResponseModel {
  int id;
  String name;
  String description;
  String createdAt;
  int type;
  NotificationsResponseModel({
    required this.id,
    required this.name,
    required this.description,
    required this.createdAt,
    required this.type,
  });

  NotificationsResponseModel copyWith({
    int? id,
    String? name,
    String? description,
    String? createdAt,
    int? type,
  }) {
    return NotificationsResponseModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'created_at': createdAt,
      'type': type,
    };
  }

  factory NotificationsResponseModel.fromMap(Map<String, dynamic> map) {
    return NotificationsResponseModel(
      id: map['id'] as int,
      name: map['name'] as String,
      description: map['description'] as String,
      createdAt: map['created_at'] as String,
      type: map['type'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory NotificationsResponseModel.fromJson(String source) =>
      NotificationsResponseModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'NotificationsResponseModel(id: $id, name: $name, description: $description, type: $type)';
  }

  @override
  bool operator ==(covariant NotificationsResponseModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.description == description &&
        other.type == type;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ description.hashCode ^ type.hashCode;
  }
}
