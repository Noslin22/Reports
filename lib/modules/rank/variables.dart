import 'package:flutter/material.dart';
import 'package:relatorios/modules/rank/model/rank_model.dart';
import 'package:screenshot/screenshot.dart';

List<RankModel> districts = [];

final ScreenshotController screenshotTable = ScreenshotController();

final List<String> columns = [
  "Posição",
  "Distrito",
  "2021",
  "2022",
  "%",
];

Color getColor(double value) {
  if (value >= 0.2) {
    return Colors.green;
  } else if (value >= 0.15) {
    return Colors.blue;
  } else if (value >= 0.0001) {
    return Colors.amber;
  } else {
    return Colors.red;
  }
}
