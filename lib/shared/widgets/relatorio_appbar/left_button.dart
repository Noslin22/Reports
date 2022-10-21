import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:relatorios/shared/variables.dart';

class LeftButton extends StatelessWidget {
  LeftButton({Key? key}) : super(key: key);
  final MoneyMaskedTextController controller = MoneyMaskedTextController(
    decimalSeparator: ",",
    precision: 2,
    thousandSeparator: ".",
    leftSymbol: "R\$ ",
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12),
      child: SizedBox.square(
        dimension: 50,
        child: Navigator.of(context).canPop()
            ? BackButton(
                color: Colors.white,
                onPressed: () => Navigator.pop(context),
              )
            : IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      bool showField = false;
                      return StatefulBuilder(builder: (context, setState) {
                        return AlertDialog(
                          title: const Text("Configurar Orçamento"),
                          content: showField
                              ? TextField(
                                  decoration: const InputDecoration(
                                    labelText: "Digite o orçamento",
                                    border: OutlineInputBorder(),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Color(0xFF03425F)),
                                    ),
                                    floatingLabelStyle:
                                        TextStyle(color: Color(0xFF03425F)),
                                  ),
                                  controller: controller,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                  ],
                                  onSubmitted: (_) {
                                    String parsedValue = controller.text
                                        .split(" ")[1]
                                        .replaceAll(".", "")
                                        .replaceAll(",", ".");
                                    database
                                        .editBudget(double.parse(parsedValue))
                                        .whenComplete(
                                            () => Navigator.pop(context));
                                  },
                                )
                              : TextField(
                                  decoration: const InputDecoration(
                                    labelText: "Digite a senha",
                                    border: OutlineInputBorder(),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Color(0xFF03425F)),
                                    ),
                                    floatingLabelStyle:
                                        TextStyle(color: Color(0xFF03425F)),
                                  ),
                                  onSubmitted: (text) {
                                    if (text == "1844") {
                                      setState(() {
                                        showField = true;
                                      });
                                    }
                                  },
                                ),
                        );
                      });
                    },
                  );
                },
                icon: const Icon(
                  Icons.settings,
                  size: 32,
                  color: Colors.white,
                ),
              ),
      ),
    );
  }
}
