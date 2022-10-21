import 'package:relatorios/modules/top10/variables.dart';
import 'package:relatorios/shared/models/entry_model.dart';
import 'package:relatorios/shared/variables.dart';

class Top10Logic {
  static void loadData() {
    var list = entriesSave.value[mode]!;
    List<EntryModel> local = [...list.last];
    local.removeWhere((element) => element.codigo == 562);
    local.sort(
      (a, b) => b.total.compareTo(a.total),
    );
    local.removeRange(10, local.length);
    top10 = local;
  }
}
