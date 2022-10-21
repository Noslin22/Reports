import 'package:flutter/material.dart';
import 'package:relatorios/modules/rank/pdf/rank_pdf.dart';
import 'package:relatorios/modules/rank/widgets/rank_table.dart';
import 'package:relatorios/shared/variables.dart';
import 'package:relatorios/shared/widgets/relatorio_wrapper.dart';

import 'logic/rank_logic.dart';

class RankPage extends StatefulWidget {
  const RankPage({Key? key}) : super(key: key);

  @override
  State<RankPage> createState() => _RankPageState();
}

class _RankPageState extends State<RankPage> {
  void listener() {
    RankLogic.loadData();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    RankLogic.loadData();
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
      model: RankPdf(),
      page: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Ranking - $currentMode",
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 12,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: RankTable(),
          ),
        ],
      ),
    );
  }
}
