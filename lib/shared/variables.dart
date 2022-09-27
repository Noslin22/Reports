import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'database/database.dart';
import 'models/entry_model.dart';

List<List<EntryModel>> entries = [];
final GlobalKey<ScaffoldMessengerState> snackbarKey =
    GlobalKey<ScaffoldMessengerState>();

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

List<String> districtNames = [];

Database database = Database();

final NumberFormat currency = NumberFormat.currency(
  locale: "pt_BR",
  symbol: "R\$",
);

final NumberFormat percent = NumberFormat("###.##%", "pt_BR");

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
