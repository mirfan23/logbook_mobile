// To parse this JSON data, do
//
//     final homepage = homepageFromJson(jsonString);

import 'dart:convert';

Homepage homepageFromJson(String str) => Homepage.fromJson(json.decode(str));

String homepageToJson(Homepage data) => json.encode(data.toJson());

class Homepage {
  Homepage({
    required this.id,
    required this.status,
    required this.target,
    required this.realita,
    required this.kategori,
    required this.subaktivitas,
    required this.waktu,
    required this.tanggal,
  });

  String id;
  bool status;
  String target;
  String realita;
  String kategori;
  String subaktivitas;
  String waktu;
  String tanggal;

  factory Homepage.fromJson(Map<String, dynamic> json) => Homepage(
        id: json["id"],
        status: json["status"],
        target: json["target"],
        realita: json["realita"],
        kategori: json["kategori"],
        subaktivitas: json["subaktivitas"],
        waktu: json["waktu"],
        tanggal: json["tanggal"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
        "target": target,
        "realita": realita,
        "kategori": kategori,
        "subaktivitas": subaktivitas,
        "waktu": waktu,
        "tanggal": tanggal,
      };
}
