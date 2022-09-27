import 'package:flutter/material.dart';
import 'package:relatorios/modules/monthly/models/chart_monthly_model.dart';
import 'package:relatorios/modules/monthly/models/monthly_model.dart';
import 'package:relatorios/shared/variables.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

String district = districtNames[0];

final ValueNotifier<List<MonthlyModel>> monthsNotifier = ValueNotifier([]);
List<MonthlyModel> get months => monthsNotifier.value;
set months(List<MonthlyModel> months) => monthsNotifier.value = months;

final ValueNotifier<List<ColumnSeries<ChartMonthlyModel, String>>>
    chartSeriesNotifier = ValueNotifier([]);
List<ColumnSeries<ChartMonthlyModel, String>> get chartSeries =>
    chartSeriesNotifier.value;
set chartSeries(List<ColumnSeries<ChartMonthlyModel, String>> chartSeries) =>
    chartSeriesNotifier.value = chartSeries;
