import 'package:excel/excel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:relatorios/shared/models/file_model.dart';

import '../models/entry_model.dart';
import '../variables.dart';
import 'package:file_picker/file_picker.dart';

class SharedLogic {
  Future<void> getFile(String year) async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ["xlsx"],
        allowMultiple: false,
        dialogTitle: "Escolha o resumo de entrada",
        withData: true,
      );

      if (result == null) {
        snackbarKey.currentState!.showSnackBar(
          const SnackBar(
            content: Text("Ocorreu um erro ao atualizar os dados"),
          ),
        );
        return;
      }

      Uint8List gistBytes = Uint8List.fromList(database.files[year] ?? []);
      Uint8List fileBytes = result.files.single.bytes!;

      showDialog(
        context: navigatorKey.currentContext!,
        builder: (context) => const Center(
          child: CircularProgressIndicator(),
        ),
      );
      if (Excel.decodeBytes(gistBytes) != Excel.decodeBytes(fileBytes)) {
        await database.editFile(FileModel(year: year, bytes: fileBytes));
      }
      navigatorKey.currentState!.pop();

      loadExcel();
    } catch (e, s) {
      throw "$e on $s";
    }
    snackbarKey.currentState!.showSnackBar(
      const SnackBar(
        content: Text("Dados Atualizados com Sucesso"),
      ),
    );
  }

  void loadExcel() {
    List<FileModel> files = database.getFiles();
    files.sort(
      (a, b) => int.parse(a.year).compareTo(int.parse(b.year)),
    );
    List<Excel> excels =
        List.generate(files.length, (i) => Excel.decodeBytes(files[i].bytes));
    int month = EntryModel.fromRow(
      row: excels.last.tables[excels.last.getDefaultSheet()]!.rows[1],
      year: database.years.last,
    ).valores.where((element) => element != 0).length;

    for (var excel in excels) {
      final rows = excel.tables[excel.getDefaultSheet()]!.rows;
      rows.removeAt(0);

      entries.add(rows
          .map(
            (e) => EntryModel.fromRow(
              row: e,
              year: database.years[excels.indexOf(excel)],
              month: month,
            ),
          )
          .toList());
    }

    Set<String> districSet = {};
    for (var entrie in entries.last) {
      districSet.add(entrie.distrito);
    }
    districtNames = districSet.toList();
    districtNames.sort(
      (a, b) => a.toLowerCase().compareTo(b.toLowerCase()),
    );
  }
}
