// To parse this JSON data, do
//
//     final postaktivitas = postaktivitasFromJson(jsonString);

import 'dart:convert';

Postaktivitas postaktivitasFromJson(String str) =>
    Postaktivitas.fromJson(json.decode(str));

String postaktivitasToJson(Postaktivitas data) => json.encode(data.toJson());

class Postaktivitas {
  Postaktivitas({
    required this.name,
  });

  String name;

  factory Postaktivitas.fromJson(Map<String, dynamic> json) => Postaktivitas(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}
