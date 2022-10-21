import 'package:flutter/material.dart';
import 'package:relatorios/shared/widgets/relatorio_appbar/left_button.dart';
import 'package:relatorios/shared/widgets/relatorio_appbar/right_button.dart';

import '../../models/pdf_model.dart';
import '../../variables.dart';

class RelatorioAppbar extends StatefulWidget with PreferredSizeWidget {
  const RelatorioAppbar({
    Key? key,
    this.model,
  }) : super(key: key);
  final PdfModel? model;

  @override
  State<RelatorioAppbar> createState() => _RelatorioAppbarState();

  @override
  Size get preferredSize => const Size.fromHeight(72);
}

class _RelatorioAppbarState extends State<RelatorioAppbar> {
  void changeState() {
    setState(() {
      if (mode == "tithe") {
        mode = "offer";
      } else {
        mode = "tithe";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: const Color(0xFF03425F),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          LeftButton(),
          Expanded(
            child: Center(
              child: Image.asset(
                "assets/images/7Rank.png",
                fit: BoxFit.contain,
              ),
            ),
          ),
          RightButton(
            model: widget.model,
            changeState: changeState,
          ),
        ],
      ),
    );
  }
}
