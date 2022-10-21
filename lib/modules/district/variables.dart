import 'package:flutter/material.dart';
import 'package:relatorios/modules/district/model/chart_dis_model.dart';
import 'package:relatorios/modules/district/model/dis_model.dart';
import 'package:screenshot/screenshot.dart';

import '../../shared/variables.dart';

final ValueNotifier<List<ChartDisModel>> discSeriesNotifier = ValueNotifier([]);
final ValueNotifier<List<DisModel>> churchsNotifier = ValueNotifier([]);
List<DisModel> get churchs => churchsNotifier.value;

set churchs(List<DisModel> churchs) => churchsNotifier.value = churchs;

List<ChartDisModel> get discSeries => discSeriesNotifier.value;

set discSeries(List<ChartDisModel> series) => discSeriesNotifier.value = series;

String district = districtNames[0];

final ScreenshotController screenshotChart = ScreenshotController();
final ScreenshotController screenshotTitle = ScreenshotController();

final List<String> columns = [
  "Cod",
  "Igreja",
  "2021",
  "2022",
  "%",
];

Color getColor(double value) {
  if (value > 0) {
    return Colors.green[100]!;
  } else {
    return Colors.red[100]!;
  }
}

double fTotal = 0;
double sTotal = 0;
