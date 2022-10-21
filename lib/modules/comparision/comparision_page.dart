import 'package:flutter/material.dart';
import 'package:relatorios/modules/comparision/logic/comparision_logic.dart';
import 'package:relatorios/modules/comparision/pdf/comp_pdf.dart';
import 'package:relatorios/modules/comparision/widgets/comp_chart.dart';
import 'package:relatorios/shared/widgets/relatorio_wrapper.dart';

import '../../shared/variables.dart';
import 'widgets/comp_tamble.dart';

class ComparisionPage extends StatefulWidget {
  const ComparisionPage({Key? key}) : super(key: key);

  @override
  State<ComparisionPage> createState() => _ComparisionPageState();
}

class _ComparisionPageState extends State<ComparisionPage> {
  void listener() {
    ComparisionLogic.loadData();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    ComparisionLogic.loadData();
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
      model: CompPdf(),
      spacer: 2,
      page: Column(
        children: [
          Text(
            "Comparativo de Entradas - $currentMode",
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 16,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: CompTable(),
          ),
          const SizedBox(
            height: 16,
          ),
          const CompChart(),
        ],
      ),
    );
  }
}
