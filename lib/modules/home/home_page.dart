import 'package:flutter/material.dart';
import 'package:relatorios/modules/comparision/comparision_page.dart';
import 'package:relatorios/modules/district/district_page.dart';
import 'package:relatorios/modules/home/widgets/module_tile.dart';
import 'package:relatorios/modules/monthly/monthly_page.dart';
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
    if (entries.isEmpty) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Qual ano deseja editar?"),
          content: TextField(
            decoration: const InputDecoration(
              labelText: "Digite o ano para editar",
            ),
            onSubmitted: SharedLogic().getFile,
          ),
        ),
      );
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
      entries = [];
      SharedLogic().loadExcel();
    });
  }

  @override
  void dispose() {
    database.dataNotifier.dispose();
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
            label: "Comparativo de Entradas",
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
    //  SafeArea(
    //   child: Scaffold(
    //     appBar: const RelatorioAppbar(),
    //     body: Padding(
    //       padding: const EdgeInsets.all(8.0),
    //       child: LayoutBuilder(builder: (context, constraints) {
    //         bool computer = constraints.biggest.width >= 900;
    //         return Row(
    //           children: [
    //             Flexible(
    //               flex: computer ? 1 : 0,
    //               child: Container(),
    //             ),
    //             Flexible(
    //               flex: computer ? 2 : 1,
    //               child: ListView(
    //                 children: [
    //                   ModuleTile(
    //                     computer: computer,
    //                     icon: Icons.sync_alt,
    //                     label: "Comparativo de Entradas",
    //                     onTap: () {
    //                       openPage(const ComparisionPage());
    //                     },
    //                   ),
    //                   const Divider(),
    //                   ModuleTile(
    //                     computer: computer,
    //                     icon: Icons.equalizer,
    //                     label: "Crescimento Distrital",
    //                     onTap: () {
    //                       openPage(const DistrictPage());
    //                     },
    //                   ),
    //                   const Divider(),
    //                   ModuleTile(
    //                     computer: computer,
    //                     icon: Icons.stacked_line_chart,
    //                     label: "Ranking de Crescimento",
    //                     onTap: () {
    //                       openPage(const RankPage());
    //                     },
    //                   ),
    //                   const Divider(),
    //                   ModuleTile(
    //                     computer: computer,
    //                     icon: Icons.stacked_bar_chart,
    //                     label: "Top 10 - Igrejas",
    //                     onTap: () {
    //                       openPage(const Top10Page());
    //                     },
    //                   ),
    //                   const Divider(),
    //                   ModuleTile(
    //                     computer: computer,
    //                     icon: Icons.church,
    //                     label: "Crescimento Mensal",
    //                     onTap: () {
    //                       openPage(const MonthlyPage());
    //                     },
    //                   ),
    //                 ],
    //               ),
    //             ),
    //             Flexible(
    //               flex: computer ? 1 : 0,
    //               child: Container(),
    //             ),
    //           ],
    //         );
    //       }),
    //     ),
    //   ),
    // );
  }
}
