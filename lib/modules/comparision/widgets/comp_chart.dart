import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../shared/variables.dart';
import '../variables.dart';

class CompChart extends StatelessWidget {
  const CompChart({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: columnSeriesNotifier,
      builder: (_, value, __) {
        return Screenshot(
          controller: screenshotChart,
          child: SfCartesianChart(
            margin: const EdgeInsets.all(16),
            title: ChartTitle(
              text: 'Comparativo de Entradas',
            ),
            primaryXAxis: CategoryAxis(
              majorGridLines: const MajorGridLines(width: 0),
            ),
            primaryYAxis: NumericAxis(
              majorTickLines: const MajorTickLines(size: 0),
              axisLine: const AxisLine(width: 0),
              numberFormat: currency,
              isVisible: false,
            ),
            series: value,
            legend: Legend(
              isVisible: true,
              position: LegendPosition.bottom,
            ),
            tooltipBehavior: TooltipBehavior(
              enable: true,
            ),
          ),
        );
      },
    );
  }
}
