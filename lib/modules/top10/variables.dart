import 'package:flutter/material.dart';

import '../../shared/models/entry_model.dart';

final top10Notifier = ValueNotifier<List<EntryModel>>([]);
List<EntryModel> get top10 => top10Notifier.value;

set top10(List<EntryModel> top10) => top10Notifier.value = top10;
