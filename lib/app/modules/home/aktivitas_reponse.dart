import 'dart:convert';

Map<String, AktivitasResponse> aktivitasResponseFromJson(String str) =>
    Map.from(json.decode(str)).map((k, v) =>
        MapEntry<String, AktivitasResponse>(k, AktivitasResponse.fromJson(v)));

String aktivitasResponseToJson(Map<String, AktivitasResponse> data) =>
    json.encode(
        Map.from(data).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())));

class AktivitasResponse {
  AktivitasResponse({
    required this.logs,
    required this.timestamp,
  });

  List<Log> logs;
  String timestamp;

  factory AktivitasResponse.fromJson(Map<String, dynamic> json) =>
      AktivitasResponse(
        logs: List<Log>.from(json["logs"].map((x) => Log.fromJson(x))),
        timestamp: json["timestamp"],
      );

  Map<String, dynamic> toJson() => {
        "logs": List<dynamic>.from(logs.map((x) => x.toJson())),
        "timestamp": timestamp,
      };
}

class Log {
  Log({
    required this.category,
    required this.isDone,
    required this.note,
    required this.reality,
    required this.target,
    required this.time,
  });

  String category;
  bool isDone;
  String note;
  String reality;
  String target;
  String time;

  factory Log.fromJson(Map<String, dynamic> json) => Log(
        category: json["category"],
        isDone: json["is_done"],
        note: json["note"],
        reality: json["reality"],
        target: json["target"],
        time: json["time"],
      );

  Map<String, dynamic> toJson() => {
        "category": category,
        "is_done": isDone,
        "note": note,
        "reality": reality,
        "target": target,
        "time": time,
      };
}
