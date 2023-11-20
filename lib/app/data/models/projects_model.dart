import 'dart:convert';

class Project {
    int code;
    List<Datum> data;

    Project({
        required this.code,
        required this.data,
    });

    factory Project.fromRawJson(String str) => Project.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Project.fromJson(Map<String, dynamic> json) => Project(
        code: json["code"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    String id;
    String name;
    DateTime endDate;
    bool status;
    int progress;

    Datum({
        required this.id,
        required this.name,
        required this.endDate,
        required this.status,
        required this.progress,
    });

    factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        endDate: DateTime.parse(json["endDate"]),
        status: json["status"],
        progress: json["progress"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "endDate": endDate.toIso8601String(),
        "status": status,
        "progress": progress,
    };
}
