import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

final ValueNotifier<List<ColumnSeries>> columnSeriesNotifier =
    ValueNotifier([]);

List<ColumnSeries> get columnSeries => columnSeriesNotifier.value;

set columnSeries(List<ColumnSeries> series) =>
    columnSeriesNotifier.value = series;
