import 'package:flutter/material.dart';
import 'package:relatorios/modules/rank/variables.dart';
import 'package:relatorios/modules/rank/widgets/rank_table.dart';
import 'package:relatorios/shared/widgets/relatorio_wrapper.dart';

import 'logic/rank_logic.dart';

class RankPage extends StatefulWidget {
  const RankPage({Key? key}) : super(key: key);

  @override
  State<RankPage> createState() => _RankPageState();
}

class _RankPageState extends State<RankPage> {
  @override
  void initState() {
    super.initState();
    RankLogic.loadData();
  }

  @override
  void dispose() {
    districts = [];
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RelatorioWrapper(
      page: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Ranking de Crescimento",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 12,
          ),
          RankTable(),
        ],
      ),
    );
  }
}
