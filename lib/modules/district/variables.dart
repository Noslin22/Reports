import 'package:flutter/material.dart';
import 'package:relatorios/modules/district/model/chart_dis_model.dart';
import 'package:relatorios/modules/district/model/dis_model.dart';

import '../../shared/variables.dart';

final ValueNotifier<List<ChartDisModel>> discSeriesNotifier = ValueNotifier([]);
final ValueNotifier<List<DisModel>> churchsNotifier = ValueNotifier([]);
List<DisModel> get churchs => churchsNotifier.value;

set churchs(List<DisModel> churchs) => churchsNotifier.value = churchs;

List<ChartDisModel> get discSeries => discSeriesNotifier.value;

set discSeries(List<ChartDisModel> series) => discSeriesNotifier.value = series;

String district = districtNames[0];
