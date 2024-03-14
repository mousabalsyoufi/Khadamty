// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class FileModel {
  String name;
  String path;
  String fullname;
  String type;
  FileModel({
    required this.name,
    required this.path,
    required this.fullname,
    required this.type,
  });

  FileModel copyWith({
    String? name,
    String? path,
    String? fullname,
    String? type,
  }) {
    return FileModel(
      name: name ?? this.name,
      path: path ?? this.path,
      fullname: fullname ?? this.fullname,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'path': path,
      'fullname': fullname,
      'type': type,
    };
  }

  factory FileModel.fromMap(Map<String, dynamic> map) {
    return FileModel(
      name: map['name'] as String,
      path: map['path'] as String,
      fullname: map['fullname'] as String,
      type: map['type'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory FileModel.fromJson(String source) => FileModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'FileModel(name: $name, path: $path, fullname: $fullname, type: $type)';
  }

  @override
  bool operator ==(covariant FileModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.path == path &&
      other.fullname == fullname &&
      other.type == type;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      path.hashCode ^
      fullname.hashCode ^
      type.hashCode;
  }
}
