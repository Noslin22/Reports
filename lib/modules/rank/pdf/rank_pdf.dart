import 'dart:typed_data';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:relatorios/shared/models/pdf_model.dart';

import '../../../shared/variables.dart';
import '../model/rank_model.dart';
import '../variables.dart';

class RankPdf implements PdfModel {
  @override
  final String filename = "rank - ${currentMode.toLowerCase()}.pdf";

  @override
  Future<Uint8List> generate() async {
    final doc = Document();
    final format = PdfPageFormat.a4.copyWith(
      marginBottom: PdfPageFormat.cm * 1.5,
      marginRight: PdfPageFormat.cm * 1.5,
      marginTop: PdfPageFormat.cm * 1.5,
      marginLeft: PdfPageFormat.cm * 1.5,
    );
    doc.addPage(
      MultiPage(
        pageFormat: format,
        build: (context) => [
          Text(
            "Ranking - $currentMode",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 12),
          Table(
            border: TableBorder.all(color: PdfColors.blue700),
            children: [
              TableRow(
                decoration: const BoxDecoration(color: PdfColors.blue800),
                children: List.generate(
                  columns.length,
                  (index) => Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: index == 0 ? 6 : 10,
                      vertical: 6,
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        columns[index],
                        style: const TextStyle(color: PdfColors.white),
                      ),
                    ),
                  ),
                ),
              ),
              ...List.generate(
                districts.length,
                (i) {
                  RankModel district = districts[i];
                  return TableRow(
                    verticalAlignment: TableCellVerticalAlignment.full,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 3,
                          ),
                          child: Text((i + 1).toString()),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 4,
                          ),
                          child: Text(district.name),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 4,
                          ),
                          child: Text(currency.format(district.firstYear)),
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
                            currency.format(district.secondYear),
                          ),
                        ),
                      ),
                      Container(
                        color:
                            PdfColor.fromInt(getColor(district.percent).value),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 4,
                            vertical: 4,
                          ),
                          child: Center(
                            child: Text(
                              percent.format(district.percent),
                              style: TextStyle(
                                color: PdfColors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          )
        ],
      ),
    );
    return doc.save();
  }
}
