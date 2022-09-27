import 'package:flutter/material.dart';

import 'relatorio_appbar/relatorio_appbar.dart';

class RelatorioWrapper extends StatelessWidget {
  const RelatorioWrapper({
    Key? key,
    required this.page,
    this.spacer = 1,
  }) : super(key: key);
  final Widget page;
  final int spacer;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const RelatorioAppbar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: LayoutBuilder(builder: (context, constraints) {
              int flex = constraints.biggest.width >= 990 ? 1 : 0;
              return Row(
                children: [
                  Expanded(
                    flex: flex,
                    child: Container(),
                  ),
                  Expanded(flex: flex + spacer, child: page),
                  Expanded(
                    flex: flex,
                    child: Container(),
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
