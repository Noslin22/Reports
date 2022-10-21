import 'package:flutter/material.dart';
import 'package:relatorios/modules/comparision/comparision_page.dart';
import 'package:relatorios/modules/district/district_page.dart';
import 'package:relatorios/modules/home/widgets/module_tile.dart';
import 'package:relatorios/modules/monthly/monthly_page.dart';
import 'package:relatorios/modules/monthly/variables.dart';
import 'package:relatorios/shared/logic/shared_logic.dart';
import 'package:relatorios/shared/variables.dart';
import 'package:relatorios/shared/widgets/relatorio_wrapper.dart';

import '../rank/rank_page.dart';
import '../top10/top10_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void openPage(Widget page) async {
    if (!entriesSave.value.keys.contains("tithe") ||
        !entriesSave.value.keys.contains("offer")) {
      updateFile(context);
    }
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => page,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    database.dataNotifier.addListener(() {
      entries = {"tithe": [], "offer": []};
      SharedLogic().loadExcel();
    });
  }

  @override
  void dispose() {
    database.dataNotifier.dispose();
    monthsNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RelatorioWrapper(
      page: ListView(
        shrinkWrap: true,
        children: [
          ModuleTile(
            icon: Icons.sync_alt,
            label: "Comparativo de Entradas ",
            onTap: () {
              openPage(const ComparisionPage());
            },
          ),
          const Divider(),
          ModuleTile(
            icon: Icons.equalizer,
            label: "Crescimento Distrital",
            onTap: () {
              openPage(const DistrictPage());
            },
          ),
          const Divider(),
          ModuleTile(
            icon: Icons.stacked_line_chart,
            label: "Ranking de Crescimento",
            onTap: () {
              openPage(const RankPage());
            },
          ),
          const Divider(),
          ModuleTile(
            icon: Icons.stacked_bar_chart,
            label: "Top 10 - Igrejas",
            onTap: () {
              openPage(const Top10Page());
            },
          ),
          const Divider(),
          ModuleTile(
            icon: Icons.church,
            label: "Crescimento Mensal",
            onTap: () {
              openPage(const MonthlyPage());
            },
          ),
        ],
      ),
    );
  }
}
