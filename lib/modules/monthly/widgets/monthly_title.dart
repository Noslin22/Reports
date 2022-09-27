import 'package:flutter/material.dart';
import 'package:relatorios/modules/monthly/logic/monthly_logic.dart';

import '../../../shared/variables.dart';
import '../variables.dart';

class MonthlyTitle extends StatelessWidget {
  const MonthlyTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 16,
      runSpacing: 10,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        const Text(
          "Crescimento Mensal",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
        ),
        StatefulBuilder(builder: (context, setState) {
          return DropdownButton<String>(
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
          );
        }),
      ],
    );
  }
}
