import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'database/database.dart';
import 'logic/shared_logic.dart';
import 'models/entry_model.dart';

ValueNotifier<Map<String, List<List<EntryModel>>>> entriesSave =
    ValueNotifier({"tithe": [], "offer": []});

set entries(entries) => entriesSave.value = entries;
final GlobalKey<ScaffoldMessengerState> snackbarKey =
    GlobalKey<ScaffoldMessengerState>();

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

List<String> districtNames = [];

Database database = Database();

final NumberFormat currency = NumberFormat.currency(
  locale: "pt_BR",
  symbol: "R\$",
);

void updateFile(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      bool showField = false;
      bool isTithe = true;
      String oldMode = mode.toString();

      return StatefulBuilder(builder: (context, setState) {
        return AlertDialog(
          title: Text("Qual ${showField ? "ano" : "verba"} deseja editar?"),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              DecoratedBox(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[700]!),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      iconDisabledColor: Colors.grey[700],
                      items: const [
                        DropdownMenuItem(
                          value: true,
                          child: Text(
                            "Dízimo",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        DropdownMenuItem(
                          value: false,
                          child: Text(
                            "Oferta",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                      value: isTithe,
                      onChanged: showField
                          ? null
                          : (bool? v) {
                              setState(() {
                                showField = true;
                                isTithe = v!;
                              });
                            },
                    ),
                  ),
                ),
              ),
              showField
                  ? Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: TextField(
                        decoration: const InputDecoration(
                          labelText: "Digite o ano para editar",
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF03425F)),
                          ),
                          floatingLabelStyle:
                              TextStyle(color: Color(0xFF03425F)),
                        ),
                        onSubmitted: (text) async {
                          Navigator.pop(context);
                          if (isTithe) {
                            mode = "tithe";
                          } else {
                            mode = "offer";
                          }
                          await SharedLogic().getFile(text);
                          mode = oldMode;
                        },
                      ),
                    )
                  : Container(),
            ],
          ),
        );
      });
    },
  );
}

final NumberFormat percent = NumberFormat("###.##%", "pt_BR");

ValueNotifier<String> modeNotifier = ValueNotifier("tithe");
String get mode => modeNotifier.value;
set mode(String mode) => modeNotifier.value = mode;

String get currentMode => mode == "tithe" ? "Dízimo" : "Oferta";

Map<String, String> monthNames = {
  "Jan": "Janeiro",
  "Fev": "Fevereiro",
  "Mar": "Maço",
  "Abr": "Abril",
  "Maio": "Maio",
  "Jun": "Junho",
  "Jul": "Julho",
  "Ago": "Agosto",
  "Set": "Setembro",
  "Out": "Outubro",
  "Nov": "Novembro",
  "Dez": "Dezembro",
};
