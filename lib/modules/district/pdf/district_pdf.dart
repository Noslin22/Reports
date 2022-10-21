import 'dart:typed_data';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:relatorios/modules/district/model/dis_model.dart';
import 'package:relatorios/shared/models/pdf_model.dart';

import '../../../shared/variables.dart';
import '../variables.dart';

class DistrictPdf implements PdfModel {
  @override
  final String filename = "distrital - ${currentMode.toLowerCase()}.pdf";

  @override
  Future<Uint8List> generate() async {
    final chartBytes = await screenshotChart.capture();

    final titleBytes = await screenshotTitle.capture(pixelRatio: 1.5);

    final doc = Document();

    final List<String> total = [
      "0",
      "Total",
      currency.format(fTotal),
      currency.format(sTotal),
      percent.format((sTotal - fTotal) / (fTotal != 0 ? fTotal : sTotal)),
    ];

    doc.addPage(
      MultiPage(
        build: (context) => [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Image(
                MemoryImage(titleBytes!),
              ),
            ),
          ),
          Table(
            border: TableBorder.all(color: PdfColors.blue700),
            children: [
              TableRow(
                decoration: const BoxDecoration(color: PdfColors.blue800),
                children: List.generate(
                  columns.length,
                  (index) => Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        columns[index],
                        style: TextStyle(
                          color: PdfColors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              ...List.generate(
                churchs.length,
                (i) {
                  DisModel church = churchs[i];
                  return TableRow(
                    verticalAlignment: TableCellVerticalAlignment.full,
                    decoration: i.isEven
                        ? const BoxDecoration(color: PdfColors.blue100)
                        : null,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 3,
                          ),
                          child: Text(church.cod),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 4,
                          ),
                          child: Text(church.name),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 4,
                          ),
                          child: Text(currency.format(church.firstYear)),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 4,
                          ),
                          child: Text(
                            currency.format(church.secondYear),
                          ),
                        ),
                      ),
                      Container(
                        color: PdfColor.fromInt(getColor(church.percent).value),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 4,
                            vertical: 4,
                          ),
                          child: Center(
                            child: Text(
                              percent.format(church.percent),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
              TableRow(
                decoration: const BoxDecoration(color: PdfColors.blue800),
                children: List.generate(
                  total.length,
                  (index) => Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        total[index],
                        style: TextStyle(
                          color: PdfColors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Image(
            MemoryImage(chartBytes!),
          ),
        ],
      ),
    );
    return doc.save();
  }
}
