import 'package:flutter/material.dart';
import 'package:relatorios/modules/comparision/model/comp_model.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../shared/variables.dart';
import '../model/chart_comp_model.dart';
import '../variables.dart';

class ComparisionLogic {
  static void loadData() {
    months.clear();
    List<List<double>> sums = [];
    var list = entriesSave.value[mode]!;
    final num budget = database.budget;
    for (var i = 0; i < list.length; i++) {
      List<double> fileSums = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
      for (var entry in list[i]) {
        for (var i = 0; i < entry.valores.length; i++) {
          fileSums[i] += entry.valores[i];
        }
      }
      fileSums.removeWhere((element) => element == 0);
      sums.add(fileSums);
    }
    List<ChartCompModel> charts = List.generate(
      sums[4].length,
      (i) => ChartCompModel(
        x: monthNames.keys.elementAt(i),
        firstYear: sums[3][i],
        secondYear: sums[4][i],
      ),
    );

    int numMonths = sums[4].length;
    double totalDifBudgets = 0;

    double total1 = 0;
    for (var sum in sums[3]) {
      total1 += sum;
    }

    double total2 = 0;
    for (var sum in sums[4]) {
      total2 += sum;
    }

    for (var i = 0; i < 14; i++) {
      if (i < 12) {
        if (i < numMonths) {
          totalDifBudgets +=
              sums[4][i] - budget == -budget ? 0 : sums[4][i] - budget;
          months.add(
            CompModel(
              month: monthNames.values.elementAt(i),
              firstYear: currency.format(sums[3][i]),
              secondYear: currency.format(sums[4][i]),
              difference: currency.format(sums[4][i] - sums[3][i]),
              percentage: percent.format((sums[4][i] - sums[3][i]) /
                  (sums[3][i] != 0 ? sums[3][i] : sums[4][i])),
              difBudget: currency.format(sums[4][i] - budget),
            ),
          );
        } else {
          months.add(
            CompModel(
              month: monthNames.values.elementAt(i),
              firstYear: "-",
              secondYear: "-",
              difference: "-",
              percentage: "-",
              difBudget: "-",
            ),
          );
        }
      } else if (i == 12) {
        months.add(
          CompModel(
            month: "Total",
            firstYear: currency.format(total1),
            secondYear: currency.format(total2),
            difference: currency.format(total2 - total1),
            percentage: percent.format((total2 - total1) / total1),
            difBudget: currency.format(totalDifBudgets),
          ),
        );
      } else {
        months.add(
          CompModel(
            month: "Média",
            firstYear: currency.format(total1 / numMonths),
            secondYear: currency.format(total2 / numMonths),
            difference:
                currency.format((total2 / numMonths) - (total1 / numMonths)),
            percentage: percent.format((total2 - total1) / total1),
            difBudget: currency.format(totalDifBudgets / numMonths),
          ),
        );
      }
    }

    columnSeries = [
      // ColumnSeries<ChartCompModel, String>(
      //   width: 0.6,
      //   spacing: 0.2,
      //   dataSource: charts,
      //   color: Colors.yellow,
      //   isVisible: false,
      //   xValueMapper: (ChartCompModel data, _) => data.x,
      //   yValueMapper: (ChartCompModel data, _) => data.firstYear,
      //   name: '2018',
      // ),
      // ColumnSeries<ChartCompModel, String>(
      //   dataSource: charts,
      //   width: 0.6,
      //   spacing: 0.2,
      //   color: Colors.teal,
      //   isVisible: false,
      //   xValueMapper: (ChartCompModel data, _) => data.x,
      //   yValueMapper: (ChartCompModel data, _) => data.secondYear,
      //   name: '2019',
      // ),
      // ColumnSeries<ChartCompModel, String>(
      //   width: 0.6,
      //   spacing: 0.2,
      //   dataSource: charts,
      //   color: Colors.blue,
      //   isVisible: false,
      //   xValueMapper: (ChartCompModel data, _) => data.x,
      //   yValueMapper: (ChartCompModel data, _) => data.thirdYear,
      //   name: '2020',
      // ),
      ColumnSeries<ChartCompModel, String>(
        dataSource: charts,
        width: 0.6,
        spacing: 0.2,
        color: Colors.indigo,
        xValueMapper: (ChartCompModel data, _) => data.x,
        yValueMapper: (ChartCompModel data, _) => data.firstYear,
        name: '2021',
      ),
      ColumnSeries<ChartCompModel, String>(
        dataSource: charts,
        width: 0.6,
        spacing: 0.2,
        color: Colors.deepOrange,
        xValueMapper: (ChartCompModel data, _) => data.x,
        yValueMapper: (ChartCompModel data, _) => data.secondYear,
        name: '2022',
      ),
    ];
  }
}
