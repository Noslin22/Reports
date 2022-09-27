import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:relatorios/shared/models/file_model.dart';

class Database {
  final dataNotifier = ValueNotifier({});
  Map get data => dataNotifier.value;
  set data(Map database) => dataNotifier.value = database;

  final Uri apiUrl = Uri.parse(
    "https://api.github.com/gists/6e1323c89eb18802289f2a57eb7ba016",
  );

  Future<void> getDatabase() async {
    http.Response response = await http.get(apiUrl);

    Map<String, dynamic> file =
        jsonDecode(response.body)["files"]["files.json"];

    if (file["truncated"]) {
      http.Response response = await http.get(Uri.parse(file["raw_url"]));
      data = jsonDecode(response.body);
    } else {
      data = jsonDecode(file["content"]);
    }
  }

  Future<void> editFile(FileModel file) async {
    Map updatedData = Map.from(data);
    updatedData["files"][file.year] = file.bytes.toString();
    data = updatedData;

    await http.patch(
      apiUrl,
      headers: {
        "accept": "application/vnd.github+json",
        "Authorization": "Bearer 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"
      },
      body: jsonEncode({
        "files": {
          "files.json": {
            "content": jsonEncode(data),
          }
        }
      }),
    );
  }

  Future<void> editBudget(double value) async {
    Map updatedData = Map.from(data);
    updatedData["budget"] = value;
    data = updatedData;

    http.Response res = await http.patch(
      apiUrl,
      headers: {
        "accept": "application/vnd.github+json",
        "Authorization": "Bearer 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"
      },
      body: jsonEncode({
        "files": {
          "files.json": {
            "content": jsonEncode(data),
          }
        }
      }),
    );
  }

  List<int> get years =>
      data["files"].keys.map<int>((e) => int.parse(e.toString())).toList();

  double get budget => (data["budget"] as double);

  List<FileModel> getFiles() {
    return files.entries
        .map(
          (e) => FileModel(
            year: e.key,
            bytes: e.value,
          ),
        )
        .toList();
  }

  Map<String, List<int>> get files {
    final Map<String, List<int>> map = Map.from(
      data["files"].map<String, List<int>>(
        (String key, value) {
          return MapEntry(
            key.toString(),
            (jsonDecode(value) as List)
                .map((e) => int.parse(e.toString()))
                .toList(),
          );
        },
      ),
    );
    return map;
  }
}
