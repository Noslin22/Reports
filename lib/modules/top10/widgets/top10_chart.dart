import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../shared/models/entry_model.dart';
import '../../../shared/variables.dart';
import '../variables.dart';

class Top10Chart extends StatelessWidget {
  const Top10Chart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: top10Notifier,
        builder: (_, value, __) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.blue[50],
              border: Border.all(color: Colors.grey[400]!),
            ),
            child: ClipRRect(
              child: SfCartesianChart(
                margin: const EdgeInsets.all(16),
                primaryXAxis: CategoryAxis(
                  majorGridLines: const MajorGridLines(width: 0),
                  labelRotation: 285,
                  labelAlignment: LabelAlignment.start,
                ),
                primaryYAxis: NumericAxis(
                    majorTickLines: const MajorTickLines(size: 0),
                    axisLine: const AxisLine(width: 0),
                    numberFormat: currency,
                    isVisible: false),
                onTooltipRender: ((tooltipArgs) => tooltipArgs.header = ""),
                series: [
                  ColumnSeries<EntryModel, String>(
                    dataSource: value,
                    xValueMapper: (data, _) => data.nome,
                    yValueMapper: (data, _) =>
                        data.total /
                        data.valores.where((element) => element != 0).length,
                  )
                ],
                tooltipBehavior: TooltipBehavior(
                  enable: true,
                ),
              ),
            ),
          );
        });
  }
}
