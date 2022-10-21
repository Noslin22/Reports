import 'package:flutter/material.dart';
import 'package:relatorios/modules/top10/logic/top10_logic.dart';
import 'package:relatorios/modules/top10/widgets/top10_chart.dart';
import 'package:relatorios/modules/top10/widgets/top10_table.dart';
import 'package:relatorios/shared/widgets/relatorio_wrapper.dart';

import '../../shared/variables.dart';
import 'pdf/top10_pdf.dart';

class Top10Page extends StatefulWidget {
  const Top10Page({Key? key}) : super(key: key);

  @override
  State<Top10Page> createState() => _Top10PageState();
}

class _Top10PageState extends State<Top10Page> {
  void listener() {
    Top10Logic.loadData();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    Top10Logic.loadData();

    modeNotifier.addListener(listener);
  }

  @override
  void dispose() {
    modeNotifier.removeListener(listener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RelatorioWrapper(
      model: Top10Pdf(),
      page: Column(
        children: [
          Text(
            "Top 10 - $currentMode",
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          const SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Top10Table(),
          ),
          const SizedBox(
            height: 16,
          ),
          const Top10Chart(),
        ],
      ),
    );
  }
}
