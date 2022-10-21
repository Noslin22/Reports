import 'dart:convert';

class FileModel {
  final String year;
  final List<int> bytes;
  FileModel({
    required this.year,
    required this.bytes,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'year': year,
      'bytes': bytes,
    };
  }

  factory FileModel.fromMap(Map<String, dynamic> map) {
    return FileModel(
      year: map['year'] as String,
      bytes: List<int>.from((map['bytes'] as List<int>)),
    );
  }

  String toJson() => json.encode(toMap());

  factory FileModel.fromJson(String source) =>
      FileModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
