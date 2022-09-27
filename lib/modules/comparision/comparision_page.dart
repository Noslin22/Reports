import 'package:flutter/material.dart';
import 'package:relatorios/modules/comparision/logic/comparision_logic.dart';
import 'package:relatorios/modules/comparision/variables.dart';
import 'package:relatorios/modules/comparision/widgets/comp_chart.dart';
import 'package:relatorios/shared/widgets/relatorio_wrapper.dart';

import 'widgets/comp_tamble.dart';

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
  void dispose() {
    months.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RelatorioWrapper(
      spacer: 2,
      page: Column(
        children: [
          const Text(
            "Comparativo de Entradas",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 16,
          ),
          CompTable(),
          const SizedBox(
            height: 16,
          ),
          const CompChart(),
        ],
      ),
    );
  }
}
