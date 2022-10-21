import 'dart:typed_data';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:relatorios/shared/models/pdf_model.dart';

import '../../../shared/variables.dart';
import '../variables.dart';

class MonthlyPdf implements PdfModel {
  @override
  final String filename = "mensal - ${currentMode.toLowerCase()}.pdf";

  @override
  Future<Uint8List> generate() async {
    final titleBytes = await screenshotTitle.capture();
    final chartBytes = await screenshotChart.capture();

    final tableBytes = await screenshotTable.capture(pixelRatio: 1.5);

    final format = PdfPageFormat.a4.copyWith(
      marginBottom: PdfPageFormat.cm,
      marginRight: PdfPageFormat.cm * 1.5,
      marginTop: PdfPageFormat.cm,
      marginLeft: PdfPageFormat.cm * 1.5,
    );

    final doc = Document();
    doc.addPage(
      MultiPage(
        pageFormat: format,
        build: (context) => [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Image(
                MemoryImage(titleBytes!),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 8,
              ),
              child: Image(
                MemoryImage(tableBytes!),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Image(
              MemoryImage(chartBytes!),
            ),
          ),
        ],
      ),
    );
    return doc.save();
  }
}
