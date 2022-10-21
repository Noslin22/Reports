// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:excel/excel.dart';

class EntryModel {
  final String distrito;
  final int year;
  final int codigo;
  final String nome;
  final List<double> valores;
  final List<String> labels;
  double total;

  EntryModel({
    required this.distrito,
    required this.year,
    required this.codigo,
    required this.nome,
    required this.valores,
    required this.labels,
    required this.total,
  });

  factory EntryModel.empty() {
    return EntryModel(
      distrito: "",
      year: 0,
      codigo: 0,
      nome: "",
      valores: [],
      labels: [],
      total: 0,
    );
  }

  factory EntryModel.fromRow({
    required List<Data?> row,
    required int year,
    int? month,
  }) {
    List<double> valores = [
      double.parse(row[3]!.value.toString()),
      double.parse(row[5]!.value.toString()),
      double.parse(row[7]!.value.toString()),
      double.parse(row[9]!.value.toString()),
      double.parse(row[11]!.value.toString()),
      double.parse(row[13]!.value.toString()),
      double.parse(row[15]!.value.toString()),
      double.parse(row[17]!.value.toString()),
      double.parse(row[19]!.value.toString()),
      double.parse(row[21]!.value.toString()),
      double.parse(row[23]!.value.toString()),
      double.parse(row[25]!.value.toString()),
    ];
    if (month != null) {
      valores.length = month;
    }

    double total = 0;
    for (var valor in valores) {
      total += valor;
    }
    return EntryModel(
      distrito: row[0]!.value as String,
      codigo: row[1]!.value as int,
      nome: row[2]!.value as String,
      valores: valores,
      labels: [
        row[4]?.value ?? "",
        row[6]?.value ?? "",
        row[8]?.value ?? "",
        row[10]?.value ?? "",
        row[12]?.value ?? "",
        row[14]?.value ?? "",
        row[16]?.value ?? "",
        row[18]?.value ?? "",
        row[20]?.value ?? "",
        row[22]?.value ?? "",
        row[24]?.value ?? "",
        row[26]?.value ?? "",
      ],
      total: total,
      year: year,
    );
  }
}
