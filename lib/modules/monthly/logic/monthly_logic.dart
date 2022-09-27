import 'package:flutter/material.dart';
import 'package:relatorios/modules/monthly/models/monthly_model.dart';
import 'package:relatorios/shared/models/entry_model.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../shared/variables.dart';
import '../models/chart_monthly_model.dart';
import '../variables.dart';

class MonthlyLogic {
  static void loadData() {
    List<List<double>> sums = [[], []];
    try {
      List<EntryModel> local = [];

      List<MonthlyModel> models = [];
      double total1 = 0;
      double total2 = 0;

      for (var i = 3; i < 5; i++) {
        local = entries[i]
            .where((element) => element.distrito == district)
            .toList();
        for (var entry in local) {
          for (var j = 0; j < entry.valores.length; j++) {
            if (local.indexOf(entry) == 0) {
              sums[i - 3].add(entry.valores[j]);
            } else {
              sums[i - 3][j] += entry.valores[j];
            }
          }
        }
        sums[i - 3].removeWhere((element) => element == 0);
      }
      int numMonths = sums[1].length;
      List<ChartMonthlyModel> charts = List.generate(
        numMonths,
        (i) => ChartMonthlyModel(
          x: monthNames.keys.elementAt(i),
          y: sums[1][i],
        ),
      );

      for (var sum in sums[0]) {
        total1 += sum;
      }

      for (var sum in sums[1]) {
        total2 += sum;
      }

      for (var i = 0; i < 14; i++) {
        if (i < 12) {
          if (i < numMonths) {
            models.add(
              MonthlyModel(
                month: monthNames.values.elementAt(i),
                firstYear: currency.format(sums[0][i]),
                secondYear: currency.format(sums[1][i]),
                difference: currency.format(sums[1][i] - sums[0][i]),
                percentage: percent.format((sums[1][i] - sums[0][i]) /
                    (sums[0][i] != 0 ? sums[0][i] : sums[1][i])),
              ),
            );
          } else {
            models.add(
              MonthlyModel(
                month: monthNames.values.elementAt(i),
                firstYear: "-",
                secondYear: "-",
                difference: "-",
                percentage: "-",
              ),
            );
          }
        } else if (i == 12) {
          models.add(
            MonthlyModel(
              month: "Totais do Ano",
              firstYear: currency.format(total1),
              secondYear: currency.format(total2),
              difference: currency.format(total2 - total1),
              percentage: percent.format((total2 - total1) / total1),
            ),
          );
        } else {
          double average1 = total1 / numMonths;
          double average2 = total2 / numMonths;
          models.add(
            MonthlyModel(
              month: "Média Acumulada",
              firstYear: currency.format(average1),
              secondYear: currency.format(average2),
              difference: currency.format(average2 - average1),
              percentage: percent.format((average2 - average1) / average1),
            ),
          );
        }
      }

      chartSeries = [
        ColumnSeries<ChartMonthlyModel, String>(
          dataSource: charts,
          width: 0.6,
          spacing: 0.2,
          color: Colors.blue,
          xValueMapper: (ChartMonthlyModel data, _) => data.x,
          yValueMapper: (ChartMonthlyModel data, _) => data.y,
          name: '2022',
        ),
      ];

      months = models;
    } catch (e, s) {
      throw "Error $e in $s, locals: $sums";
    }
  }
}
