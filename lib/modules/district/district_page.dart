import 'package:flutter/material.dart';
import 'package:relatorios/modules/district/logic/district_logic.dart';
import 'package:relatorios/modules/district/pdf/district_pdf.dart';
import 'package:relatorios/modules/district/variables.dart';
import 'package:relatorios/modules/district/widgets/dis_chart.dart';
import 'package:relatorios/modules/district/widgets/dis_table.dart';
import 'package:relatorios/modules/district/widgets/dis_title.dart';
import 'package:relatorios/shared/widgets/relatorio_wrapper.dart';

import '../../shared/variables.dart';

class DistrictPage extends StatefulWidget {
  const DistrictPage({Key? key}) : super(key: key);

  @override
  State<DistrictPage> createState() => _DistrictPageState();
}

class _DistrictPageState extends State<DistrictPage> {
  void listener() {
    DistrictLogic.loadData(district);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    DistrictLogic.loadData(district);
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
      model: DistrictPdf(),
      page: Column(
        children: [
          const DisTitle(),
          const SizedBox(
            height: 16,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DisTable(),
          ),
          const DisChart(),
        ],
      ),
    );
  }
}
