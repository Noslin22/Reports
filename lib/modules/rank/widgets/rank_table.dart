import 'package:flutter/material.dart';

import '../../../shared/variables.dart';
import '../model/rank_model.dart';
import '../variables.dart';

class RankTable extends StatelessWidget {
  RankTable({Key? key}) : super(key: key);
  final List<String> columns = [
    "Posição",
    "Distrito",
    "2021",
    "2022",
    "%",
  ];

  Color getColor(double value) {
    if (value >= 0.2) {
      return Colors.green;
    } else if (value >= 0.15) {
      return Colors.blue;
    } else if (value >= 0.0001) {
      return Colors.amber;
    } else {
      return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: modeNotifier,
        builder: (_, __, ___) {
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
                  child: Text(columns[i]),
                ),
              ),
            ),
            rows: List.generate(
              districts.length,
              (i) {
                RankModel district = districts[i];
                return DataRow(
                  cells: [
                    DataCell(
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Text((i + 1).toString()),
                      ),
                    ),
                    DataCell(
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Text(district.name),
                      ),
                    ),
                    DataCell(
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Text(currency.format(district.firstYear)),
                      ),
                    ),
                    DataCell(
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          currency.format(district.secondYear),
                        ),
                      ),
                    ),
                    DataCell(
                      Container(
                        color: getColor(district.percent),
                        child: SizedBox.expand(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Center(
                              child: Text(
                                percent.format(district.percent),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          );
        });
  }
}
