import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../shared/variables.dart';
import '../model/chart_dis_model.dart';
import '../variables.dart';

class DisChart extends StatelessWidget {
  const DisChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: discSeriesNotifier,
      builder: (_, value, __) => SfCircularChart(
        title: ChartTitle(text: "Participação Distrital"),
        margin: const EdgeInsets.all(16),
        onDataLabelRender: (args) {
          if (args.text == "Others") {
            args.text = "Outros";
          }
        },
        onLegendItemRender: (args) {
          if (args.text == "Others") {
            args.text = "Outros";
          }
        },
        onTooltipRender: (args) {
          if (args.text != null) {
            if (args.text!.contains("Others")) {
              args.text = args.text!.replaceAll("Others", "Outros");
            }
            args.text =
                "${args.text!.split(": ")[0]}: ${args.text!.split(": ")[1].replaceAll(".", ",")}%";
          }
        },
        series: [
          PieSeries<ChartDisModel, String>(
            dataSource: value,
            xValueMapper: (data, _) => data.x,
            yValueMapper: (data, _) => double.parse(percent
                .format(data.y)
                .replaceAll("%", "")
                .replaceAll(",", ".")),
            dataLabelMapper: (data, _) {
              return percent.format(data.y);
            },
            groupTo: 5,
            groupMode: CircularChartGroupMode.value,
            dataLabelSettings: const DataLabelSettings(
                isVisible: true, labelPosition: ChartDataLabelPosition.outside),
          ),
        ],
        legend: Legend(
          isVisible: true,
          position: LegendPosition.right,
        ),
        tooltipBehavior: TooltipBehavior(
          animationDuration: 200,
          duration: 2000,
          enable: true,
        ),
      ),
    );
  }
}
