// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UploadPhotoModel {
  String fileName;
  String ref;
  String modulePart;
  String fileContent;
  String fileEncoding;
  UploadPhotoModel({
    required this.fileName,
    required this.ref,
    required this.modulePart,
    required this.fileContent,
    required this.fileEncoding,
  });


  UploadPhotoModel copyWith({
    String? fileName,
    String? ref,
    String? modulePart,
    String? fileContent,
    String? fileEncoding,
  }) {
    return UploadPhotoModel(
      fileName: fileName ?? this.fileName,
      ref: ref ?? this.ref,
      modulePart: modulePart ?? this.modulePart,
      fileContent: fileContent ?? this.fileContent,
      fileEncoding: fileEncoding ?? this.fileEncoding,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'filename': fileName,
      'ref': ref,
      'modulepart': modulePart,
      'filecontent': fileContent,
      'fileencoding': fileEncoding,
    };
  }

  factory UploadPhotoModel.fromMap(Map<String, dynamic> map) {
    return UploadPhotoModel(
      fileName: map['fileName'] as String,
      ref: map['ref'] as String,
      modulePart: map['modulePart'] as String,
      fileContent: map['fileContent'] as String,
      fileEncoding: map['fileEncoding'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UploadPhotoModel.fromJson(String source) => UploadPhotoModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UploadPhotoModel(fileName: $fileName, ref: $ref, modulePart: $modulePart, fileContent: $fileContent, fileEncoding: $fileEncoding)';
  }

  @override
  bool operator ==(covariant UploadPhotoModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.fileName == fileName &&
      other.ref == ref &&
      other.modulePart == modulePart &&
      other.fileContent == fileContent &&
      other.fileEncoding == fileEncoding;
  }

  @override
  int get hashCode {
    return fileName.hashCode ^
      ref.hashCode ^
      modulePart.hashCode ^
      fileContent.hashCode ^
      fileEncoding.hashCode;
  }
}
