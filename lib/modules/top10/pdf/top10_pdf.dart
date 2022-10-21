import 'dart:typed_data';
import 'package:pdf/widgets.dart';
import 'package:relatorios/shared/models/pdf_model.dart';
import 'package:relatorios/shared/variables.dart';

import '../variables.dart';

class Top10Pdf implements PdfModel {
  @override
  final String filename = "top 10 - ${currentMode.toLowerCase()}.pdf";

  @override
  Future<Uint8List> generate() async {
    final chartBytes = await screenshotChart.capture();

    final tableBytes = await screenshotTable.capture(pixelRatio: 1.5);

    final doc = Document();
    doc.addPage(
      Page(
        build: (context) => Column(
          children: [
            Text(
              "Top 10 - $currentMode",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Image(
                  MemoryImage(tableBytes!),
                ),
              ),
            ),
            Image(
              MemoryImage(chartBytes!),
            ),
          ],
        ),
      ),
    );
    return doc.save();
  }
}
