import 'package:flutter/material.dart';

import '../models/pdf_model.dart';
import 'relatorio_appbar/relatorio_appbar.dart';

class RelatorioWrapper extends StatelessWidget {
  const RelatorioWrapper({
    Key? key,
    required this.page,
    this.spacer = 1,
    this.model,
  }) : super(key: key);
  final Widget page;
  final int spacer;
  final PdfModel? model;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: RelatorioAppbar(
          model: model,
        ),
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
