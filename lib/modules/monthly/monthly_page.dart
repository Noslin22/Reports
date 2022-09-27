import 'package:flutter/material.dart';

import '../../shared/widgets/relatorio_appbar/relatorio_appbar.dart';
import 'logic/monthly_logic.dart';
import 'widgets/monthly_chart.dart';
import 'widgets/monthly_table.dart';
import 'widgets/monthly_title.dart';

class MonthlyPage extends StatefulWidget {
  const MonthlyPage({Key? key}) : super(key: key);

  @override
  State<MonthlyPage> createState() => _MonthlyPageState();
}

class _MonthlyPageState extends State<MonthlyPage> {
  @override
  void initState() {
    super.initState();
    MonthlyLogic.loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const RelatorioAppbar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: LayoutBuilder(
            builder: (context, constraints) {
              int flex = constraints.biggest.width >= 990 ? 1 : 0;
              return Row(
                children: [
                  Expanded(
                    flex: flex,
                    child: Container(),
                  ),
                  Expanded(
                    flex: flex + 1,
                    child: Column(
                      children: [
                        const MonthlyTitle(),
                        const SizedBox(
                          height: 16,
                        ),
                        MonthlyTable(),
                        const SizedBox(
                          height: 16,
                        ),
                        const MonthlyChart(),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: flex,
                    child: Container(),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
