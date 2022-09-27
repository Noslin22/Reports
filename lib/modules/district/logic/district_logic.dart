import 'package:relatorios/modules/district/model/chart_dis_model.dart';
import 'package:relatorios/modules/district/model/dis_model.dart';
import 'package:relatorios/modules/district/variables.dart';
import '../../../shared/models/entry_model.dart';
import '../../../shared/variables.dart';

class DistrictLogic {
  static void loadData(String district) {
    List<List<EntryModel>> local = [[], []];
    entries[3].forEach(local[0].add);
    entries[4].forEach(local[1].add);

    local[0].retainWhere((element) => element.distrito == district);
    local[1].retainWhere((element) => element.distrito == district);

    List<DisModel> models = [];

    for (var church in local[1]) {
      EntryModel other =
          local[0].where((e) => church.codigo == e.codigo).isEmpty
              ? EntryModel.empty()
              : local[0].where((e) => church.codigo == e.codigo).single;
      models.add(DisModel(
        cod: church.codigo.toString(),
        name: church.nome,
        firstYear: other.total,
        secondYear: church.total,
        percent: (church.total - other.total) /
            (other.total != 0 ? other.total : church.total),
      ));
    }

    double total = 0;
    for (var church in local[1]) {
      total += church.total;
    }
    discSeries = local[1]
        .map((e) => ChartDisModel(x: e.nome, y: e.total / total))
        .toList();

    churchs = models;
  }
}
