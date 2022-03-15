import 'dart:convert';

LogBookModel logBookModelFromJson(String str) =>
    LogBookModel.fromJson(json.decode(str));

String logBookModelToJson(LogBookModel data) => json.encode(data.toJson());

class LogBookModel {
  LogBookModel({
    required this.logs,
    required this.timestamp,
  });

  List<Log> logs;
  String timestamp;

  factory LogBookModel.fromJson(Map<String, dynamic> json) => LogBookModel(
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
