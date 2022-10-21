import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';

import '../../../shared/variables.dart';
import '../logic/district_logic.dart';
import '../variables.dart';

class DisTitle extends StatefulWidget {
  const DisTitle({Key? key}) : super(key: key);

  @override
  State<DisTitle> createState() => _DisTitleState();
}

class _DisTitleState extends State<DisTitle> {
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
                  "Crescimento Distrital - $currentMode",
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

              DistrictLogic.loadData(district);
            }),
            value: district,
          ),
        ],
      ),
    );
  }
}
