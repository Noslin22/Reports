import 'package:flutter/material.dart';
import 'package:relatorios/modules/comparision/model/chart_comp_model.dart';
import 'package:relatorios/modules/comparision/model/comp_model.dart';
import 'package:screenshot/screenshot.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

final List<ChartCompModel> charts = [];
final ValueNotifier<List<ColumnSeries>> columnSeriesNotifier =
    ValueNotifier([]);

List<ColumnSeries> get columnSeries => columnSeriesNotifier.value;
set columnSeries(List<ColumnSeries> series) =>
    columnSeriesNotifier.value = series;

final List<CompModel> months = [];

final ScreenshotController screenshotChart = ScreenshotController();
final ScreenshotController screenshotTable = ScreenshotController();
