import 'package:flutter/material.dart';

import '../../../shared/variables.dart';
import '../model/dis_model.dart';
import '../variables.dart';

class DisTable extends StatelessWidget {
  DisTable({Key? key}) : super(key: key);

  final List<String> columns = [
    "Cod",
    "Igreja",
    "2021",
    "2022",
    "%",
  ];

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: churchsNotifier,
      builder: (_, value, __) {
        fTotal = 0;
        sTotal = 0;
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
          rows: List.generate(value.length + 1, (i) {
            if (value.length != i) {
              DisModel church = value[i];
              fTotal += church.firstYear;
              sTotal += church.secondYear;
              return DataRow(
                color: MaterialStatePropertyAll(
                    i.isEven ? Colors.blue[100] : null),
                cells: [
                  DataCell(
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text(church.cod),
                    ),
                  ),
                  DataCell(
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text(church.name.split(" - ")[0]),
                    ),
                  ),
                  DataCell(
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text(currency.format(church.firstYear)),
                    ),
                  ),
                  DataCell(
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        currency.format(church.secondYear),
                      ),
                    ),
                  ),
                  DataCell(
                    Container(
                      color: getColor(church.percent),
                      child: SizedBox.expand(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Center(
                            child: Text(percent.format(church.percent)),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return DataRow(
                color: MaterialStatePropertyAll(Colors.blue[600]),
                cells: [
                  const DataCell(
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        "0",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const DataCell(
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        "Total",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  DataCell(
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        currency.format(fTotal),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  DataCell(
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        currency.format(sTotal),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  DataCell(
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        percent.format((sTotal - fTotal) /
                            (fTotal != 0 ? fTotal : sTotal)),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              );
            }
          }),
        );
      },
    );
  }
}
