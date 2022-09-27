import 'package:flutter/material.dart';
import 'package:relatorios/shared/widgets/relatorio_appbar/left_button.dart';
import 'package:relatorios/shared/widgets/relatorio_appbar/right_button.dart';

class RelatorioAppbar extends StatefulWidget with PreferredSizeWidget {
  const RelatorioAppbar({Key? key}) : super(key: key);

  @override
  State<RelatorioAppbar> createState() => _RelatorioAppbarState();

  @override
  Size get preferredSize => const Size.fromHeight(72);
}

class _RelatorioAppbarState extends State<RelatorioAppbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: const Color(0xFF03425F),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          LeftButton(),
          Center(
            child: Image.asset(
              "assets/images/7Rank.png",
              fit: BoxFit.contain,
            ),
          ),
          const RightButton(),
        ],
      ),
    );
  }
}
