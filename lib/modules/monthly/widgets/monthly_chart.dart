import 'package:flutter/material.dart';
import 'package:relatorios/modules/monthly/variables.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../shared/variables.dart';

class MonthlyChart extends StatelessWidget {
  const MonthlyChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: chartSeriesNotifier,
      builder: (_, value, __) {
        return SfCartesianChart(
          margin: const EdgeInsets.all(16),
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
        );
      },
    );
  }
}
