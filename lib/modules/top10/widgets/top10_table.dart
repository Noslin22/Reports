import 'package:flutter/material.dart';

import '../../../shared/models/entry_model.dart';
import '../../../shared/variables.dart';
import '../variables.dart';

class Top10Table extends StatelessWidget {
  const Top10Table({Key? key}) : super(key: key);

  static const List<String> columns = [
    "Distrito",
    "Igreja",
    "Acumulado 2022",
    "Média 2022"
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: ValueListenableBuilder(
          valueListenable: top10Notifier,
          builder: (_, value, __) {
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
                value.length,
                (i) {
                  EntryModel church = value[i];
                  return DataRow(
                    color: MaterialStatePropertyAll(
                        i.isEven ? Colors.blue[100] : null),
                    cells: [
                      DataCell(
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Text(church.distrito),
                        ),
                      ),
                      DataCell(
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Text(church.nome),
                        ),
                      ),
                      DataCell(
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Text(
                            currency.format(church.total),
                          ),
                        ),
                      ),
                      DataCell(
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Text(
                            currency.format(church.total /
                                church.valores
                                    .where((element) => element != 0)
                                    .length),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            );
          }),
    );
  }
}
