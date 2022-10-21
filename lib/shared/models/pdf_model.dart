import 'dart:typed_data';

abstract class PdfModel {
  final String filename = "report.pdf";

  Future<Uint8List> generate() => Future.value(Uint8List(16));
}
