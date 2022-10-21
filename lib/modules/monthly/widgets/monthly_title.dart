import 'package:flutter/material.dart';
import 'package:relatorios/modules/monthly/logic/monthly_logic.dart';
import 'package:screenshot/screenshot.dart';

import '../../../shared/variables.dart';
import '../variables.dart';

class MonthlyTitle extends StatefulWidget {
  const MonthlyTitle({Key? key}) : super(key: key);

  @override
  State<MonthlyTitle> createState() => _MonthlyTitleState();
}

class _MonthlyTitleState extends State<MonthlyTitle> {
  @override
  Widget build(BuildContext context) {
    return Screenshot(
      controller: screenshotTitle,
      child: Wrap(
        spacing: 16,
        runSpacing: 10,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          ValueListenableBuilder(
              valueListenable: modeNotifier,
              builder: (_, __, ___) {
                return Text(
                  "Crescimento Mensal - $currentMode",
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.w600),
                );
              }),
          DropdownButton<String>(
            items: districtNames
                .map((e) => DropdownMenuItem(
                      value: e,
                      child: Text(e),
                    ))
                .toList(),
            onChanged: (value) => setState(() {
              district = value!;
              MonthlyLogic.loadData();
            }),
            value: district,
          ),
        ],
      ),
    );
  }
}
