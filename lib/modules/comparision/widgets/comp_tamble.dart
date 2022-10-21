import 'package:flutter/material.dart';
import 'package:relatorios/shared/variables.dart';
import 'package:screenshot/screenshot.dart';

import '../model/comp_model.dart';
import '../variables.dart';

class CompTable extends StatelessWidget {
  CompTable({super.key});

  final List<String> columns = [
    "Mês",
    "2021",
    "2022",
    "Diferença",
    "%",
    "Diferença Orçamento",
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Screenshot(
        controller: screenshotTable,
        child: ValueListenableBuilder(
            valueListenable: modeNotifier,
            builder: (_, v, __) {
              return DataTable(
                border: TableBorder.all(color: Colors.blue[700]!),
                columnSpacing: 0,
                horizontalMargin: 0,
                headingRowColor: MaterialStateProperty.all(Colors.blue[800]),
                headingTextStyle: const TextStyle(color: Colors.white),
                columns: List<DataColumn>.generate(
                  columns.length,
                  (i) => DataColumn(
                    label: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        columns[i],
                      ),
                    ),
                  ),
                ),
                rows: List.generate(14, (i) {
                  CompModel month = months[i];
                  return DataRow(
                    color: MaterialStateProperty.resolveWith((_) {
                      if (i < 12) {
                        return null;
                      } else if (i == 12) {
                        return Colors.grey[350];
                      } else {
                        return Colors.blue[100];
                      }
                    }),
                    cells: List.generate(
                      month.props.length,
                      (j) => DataCell(
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Align(
                            alignment: j == 0
                                ? Alignment.centerLeft
                                : Alignment.center,
                            child: Text(
                              month.props[j],
                              style: TextStyle(
                                fontWeight: i == 13 ? FontWeight.w600 : null,
                                color: j == 5 || j == 3
                                    ? month.props[j].contains("-")
                                        ? Colors.red
                                        : null
                                    : j == 4
                                        ? month.props[j].contains("-")
                                            ? Colors.red
                                            : Colors.blue
                                        : null,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              );
            }),
      ),
    );
  }
}
