import 'package:flutter/material.dart';

import '../../../shared/variables.dart';
import '../logic/district_logic.dart';
import '../variables.dart';

class DisTitle extends StatelessWidget {
  const DisTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 16,
      runSpacing: 10,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        const Text(
          "Crescimento Distrital",
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

              DistrictLogic.loadData(district);
            }),
            value: district,
          );
        }),
      ],
    );
  }
}
