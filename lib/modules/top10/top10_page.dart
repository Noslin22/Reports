import 'package:flutter/material.dart';
import 'package:relatorios/modules/top10/logic/top10_logic.dart';
import 'package:relatorios/modules/top10/widgets/top10_chart.dart';
import 'package:relatorios/modules/top10/widgets/top10_table.dart';
import 'package:relatorios/modules/top10/widgets/top10_title.dart';
import 'package:relatorios/shared/widgets/relatorio_wrapper.dart';
import '../../shared/widgets/relatorio_appbar/relatorio_appbar.dart';

class Top10Page extends StatefulWidget {
  const Top10Page({Key? key}) : super(key: key);

  @override
  State<Top10Page> createState() => _Top10PageState();
}

class _Top10PageState extends State<Top10Page> {
  @override
  void initState() {
    super.initState();
    Top10Logic.loadData();
  }

  @override
  Widget build(BuildContext context) {
    return RelatorioWrapper(
      page: Column(
        children: const [
          Top10Title(),
          SizedBox(
            height: 16,
          ),
          Top10Table(),
          SizedBox(
            height: 16,
          ),
          Top10Chart(),
        ],
      ),
    );
  }
}
