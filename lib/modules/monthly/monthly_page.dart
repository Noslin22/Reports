import 'package:flutter/material.dart';
import 'package:relatorios/modules/monthly/pdf/monthly_pdf.dart';
import 'package:relatorios/shared/widgets/relatorio_wrapper.dart';
import '../../shared/variables.dart';
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
  void listener() {
    MonthlyLogic.loadData();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    modeNotifier.addListener(listener);
    MonthlyLogic.loadData();
  }

  @override
  void dispose() {
    modeNotifier.removeListener(listener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RelatorioWrapper(
      model: MonthlyPdf(),
      page: Column(
        children: [
          const MonthlyTitle(),
          const SizedBox(
            height: 16,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: MonthlyTable(),
          ),
          const SizedBox(
            height: 16,
          ),
          const MonthlyChart(),
        ],
      ),
    );
  }
}
