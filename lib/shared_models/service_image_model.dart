// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ServiceImageModel {
  String id;
  String label;
  String filePath;
  String fullPath;
  String description;
  String share;
  ServiceImageModel({
    required this.id,
    required this.label,
    required this.filePath,
    required this.fullPath,
    required this.description,
    required this.share,
  });

  ServiceImageModel copyWith({
    String? id,
    String? label,
    String? filePath,
    String? fullPath,
    String? description,
    String? share,
  }) {
    return ServiceImageModel(
      id: id ?? this.id,
      label: label ?? this.label,
      filePath: filePath ?? this.filePath,
      fullPath: fullPath ?? this.fullPath,
      description: description ?? this.description,
      share: share ?? this.share,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'label': label,
      'filepath': filePath,
      'fullpath_orig': fullPath,
      'description': description,
      'share': share,
    };
  }

  factory ServiceImageModel.fromMap(Map<String, dynamic> map) {
    return ServiceImageModel(
      id: map['id'] as String,
      label: map['label'] as String,
      filePath: map['filepath'] as String,
      fullPath: map['fullpath_orig'] as String,
      description: map['description'] as String,
      share: map['share'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ServiceImageModel.fromJson(String source) => ServiceImageModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ServiceImageModel(id: $id, label: $label, filePath: $filePath, fullPath: $fullPath, description: $description, share: $share)';
  }

  @override
  bool operator ==(covariant ServiceImageModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.label == label &&
      other.filePath == filePath &&
      other.fullPath == fullPath &&
      other.description == description &&
      other.share == share;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      label.hashCode ^
      filePath.hashCode ^
      fullPath.hashCode ^
      description.hashCode ^
      share.hashCode;
  }
}
