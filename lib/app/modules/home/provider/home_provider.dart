import 'dart:convert';

import 'package:get/get.dart';

import '../post_aktivitas.dart';

class HomeProvider extends GetConnect {
  final url = "https://logbook-ebc66-default-rtdb.firebaseio.com/";

  Future<Postaktivitas> addAktivitas(String target, String category,
      String reality, String time, String note) async {
    final body = json.encode({
      "timestamp": DateTime.now().toString(),
      "logs": [
        {
          "target": target,
          "category": category,
          "reality": reality,
          "time": time,
          "note": note,
          "is_done": false
        },
      ]
    });
    final response = await post(url + 'logs.json', body);
    if (response.status.hasError) {
      return Future.error(response.statusText.toString());
    } else {
      print(response);
      return postaktivitasFromJson(response.bodyString.toString());
    }
  }
}
