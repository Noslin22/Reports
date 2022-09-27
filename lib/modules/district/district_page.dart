import 'package:flutter/material.dart';
import 'package:relatorios/modules/district/logic/district_logic.dart';
import 'package:relatorios/modules/district/variables.dart';
import 'package:relatorios/modules/district/widgets/dis_chart.dart';
import 'package:relatorios/modules/district/widgets/dis_table.dart';
import 'package:relatorios/modules/district/widgets/dis_title.dart';
import 'package:relatorios/shared/widgets/relatorio_wrapper.dart';

class DistrictPage extends StatefulWidget {
  const DistrictPage({Key? key}) : super(key: key);

  @override
  State<DistrictPage> createState() => _DistrictPageState();
}

class _DistrictPageState extends State<DistrictPage> {
  @override
  void initState() {
    super.initState();
    DistrictLogic.loadData(district);
  }

  @override
  Widget build(BuildContext context) {
    return RelatorioWrapper(
      page: Column(
        children: [
          const DisTitle(),
          const SizedBox(
            height: 16,
          ),
          DisTable(),
          const DisChart(),
        ],
      ),
    );
  }
}
