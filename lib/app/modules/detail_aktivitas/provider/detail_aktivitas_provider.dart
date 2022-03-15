import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../home/home_model.dart';
import '../logbook_model.dart';

class AktivitasProvider extends GetConnect with ChangeNotifier {
  String id, tittle;
  bool status;

  AktivitasProvider({
    required this.id,
    required this.tittle,
    this.status = false,
  });

  void toogleStatus() {
    status = !status;
    notifyListeners();
  }
}

class DetailProvider extends GetConnect {
  final url = "https://logbook-ebc66-default-rtdb.firebaseio.com/";

  Future<LogBookModel> editLogBook(String id, String target, String category,
      String reality, String time, String timestamp) async {
    final body = json.encode({
      "timestamp": timestamp,
      "logs": [
        {
          "target": target,
          "category": category,
          "reality": reality,
          "time": time,
          "note": "Write something here",
          "is_done": false
        }
      ]
    });
    print(id);
    final response = await put(url + "/logs/" + id + ".json", body);
    if (response.status.hasError) {
      return Future.error(response.statusText.toString());
    } else {
      print(response);
      return logBookModelFromJson(response.bodyString.toString());
    }
  }

  Future<LogBookModel> showLogBook(String id) async {
    final response = await get(url + "/logs/" + id + ".json");

    if (response.status.hasError) {
      return Future.error(response.statusText.toString());
    } else {
      return logBookModelFromJson(response.bodyString.toString());
    }
  }

  Future<Object> addLogBook(String target, String category, String reality,
      String time, String timestamp) async {
    final body = json.encode({
      "timestamp": timestamp,
      "logs": [
        {
          "target": target,
          "category": category,
          "reality": reality,
          "time": time,
          "note": "note",
          "is_done": false
        }
      ]
    });
    print(body.toString());
    final response = await post(url + '/logs.json', body);
    if (response.status.hasError) {
      return Future.error(response.statusText.toString());
    } else {
      print(response);
      return homepageModelFromJson(response.bodyString.toString());
    }
  }
}
