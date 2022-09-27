import 'package:flutter/material.dart';

import '../../logic/shared_logic.dart';

class RightButton extends StatelessWidget {
  const RightButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: 50,
      child: !Navigator.of(context).canPop()
          ? IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text("Qual ano deseja editar?"),
                    content: TextField(
                      decoration: const InputDecoration(
                        labelText: "Digite o ano para editar",
                      ),
                      onSubmitted: (text) async {
                        Navigator.pop(context);
                        await SharedLogic().getFile(text);
                      },
                    ),
                  ),
                );
              },
              icon: const Icon(
                Icons.replay_outlined,
                color: Colors.white,
                size: 32,
              ))
          : null,
    );
  }
}
