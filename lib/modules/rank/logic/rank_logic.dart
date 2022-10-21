import 'package:relatorios/modules/rank/model/rank_model.dart';
import 'package:relatorios/shared/models/entry_model.dart';

import '../../../shared/variables.dart' as shared;
import '../variables.dart';

class RankLogic {
  static void loadData() {
    districts.clear();
    var list = shared.entriesSave.value[shared.mode]!;
    for (var district in shared.districtNames) {
      List<EntryModel> firstYearChurchs =
          list[3].where((element) => element.distrito == district).toList();
      List<EntryModel> secondYearChurchs =
          list[4].where((element) => element.distrito == district).toList();

      double fTotal = 0;
      double sTotal = 0;

      for (var entry in firstYearChurchs) {
        fTotal += entry.total;
      }
      for (var entry in secondYearChurchs) {
        sTotal += entry.total;
      }
      districts.add(
        RankModel(
          name: secondYearChurchs.first.distrito,
          firstYear: fTotal,
          secondYear: sTotal,
          percent: (sTotal - fTotal) / (fTotal != 0 ? fTotal : sTotal),
        ),
      );
    }
    districts.sort(
      (a, b) => b.percent.compareTo(a.percent),
    );
  }
}
