// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';



class SharedFaqModel {
  String id;
  String label;
  String description;
  SharedFaqModel({
    required this.id,
    required this.label,
    required this.description,
  });
  

  SharedFaqModel copyWith({
    String? id,
    String? label,
    String? description,
  }) {
    return SharedFaqModel(
      id: id ?? this.id,
      label: label ?? this.label,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'label': label,
      'description': description,
    };
  }

  factory SharedFaqModel.fromMap(Map<String, dynamic> map) {
    return SharedFaqModel(
      id: map['id'] as String,
      label: map['label'] as String,
      description: map['description'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SharedFaqModel.fromJson(String source) => SharedFaqModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'SharedFaqModel(id: $id, label: $label, description: $description)';

  @override
  bool operator ==(covariant SharedFaqModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.label == label &&
      other.description == description;
  }

  @override
  int get hashCode => id.hashCode ^ label.hashCode ^ description.hashCode;
}
