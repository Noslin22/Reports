import 'package:flutter/material.dart';
import 'package:relatorios/modules/comparision/logic/comparision_logic.dart';
import 'package:relatorios/modules/comparision/variables.dart';
import 'package:relatorios/shared/variables.dart';
import 'package:relatorios/shared/widgets/relatorio_appbar/relatorio_appbar.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ComparisionPage extends StatefulWidget {
  const ComparisionPage({Key? key}) : super(key: key);

  @override
  State<ComparisionPage> createState() => _ComparisionPageState();
}

class _ComparisionPageState extends State<ComparisionPage> {
  @override
  void initState() {
    super.initState();
    ComparisionLogic.loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const RelatorioAppbar(),
      body: Column(
        children: [
          ValueListenableBuilder(
            valueListenable: columnSeriesNotifier,
            builder: (context, value, _) {
              return SfCartesianChart(
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
          ),
        ],
      ),
    );
  }
}
