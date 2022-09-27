import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../shared/variables.dart';
import '../model/chart_comp_model.dart';
import '../variables.dart';

class ComparisionLogic {
  static void loadData() {
    List<List<double>> sums = [];
    for (var i = 0; i < entries.length; i++) {
      List<double> fileSums = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
      for (var entry in entries[i]) {
        for (var i = 0; i < entry.valores.length; i++) {
          fileSums[i] += entry.valores[i];
        }
      }
      sums.add(fileSums);
    }
    List<ChartCompModel> charts = List.generate(
      12,
      (i) => ChartCompModel(
        x: entries.first.first.labels[i],
        firstYear: sums[0][i],
        secondYear: sums[1][i],
        thirdYear: sums[2][i],
        forthYear: sums[3][i],
        fifthYear: sums[4][i],
      ),
    );

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
        yValueMapper: (ChartCompModel data, _) => data.forthYear,
        name: '2021',
      ),
      ColumnSeries<ChartCompModel, String>(
        dataSource: charts,
        width: 0.6,
        spacing: 0.2,
        color: Colors.deepOrange,
        xValueMapper: (ChartCompModel data, _) => data.x,
        yValueMapper: (ChartCompModel data, _) => data.fifthYear,
        name: '2022',
      ),
    ];
  }
}
