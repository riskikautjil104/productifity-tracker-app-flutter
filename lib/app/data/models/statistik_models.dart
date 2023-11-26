class StatistikJson {
  final int code;
  final StatistikData data;

  StatistikJson({required this.code, required this.data});

  factory StatistikJson.fromJson(Map<String, dynamic> json) {
    return StatistikJson(
      code: json['code'] ?? 0,
      data: StatistikData.fromJson(json['data'] ?? {}),
    );
  }
}

class StatistikData {
  final String name;
  final String description;
  final String pmName;
  final dynamic progress;
  final DateTime createdAt;
  final DateTime startDate;
  final DateTime endDate;
  final bool status;

  StatistikData({
    required this.name,
    required this.description,
    required this.pmName,
    dynamic progress,
    required this.createdAt,
    required this.startDate,
    required this.endDate,
    required this.status,
  }): progress = progress;

  factory StatistikData.fromJson(Map<String, dynamic> json) {
    return StatistikData(
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      pmName: json['pmName'] ?? '',
      createdAt: DateTime.parse(json['createdAt'] ?? ''),
      startDate: DateTime.parse(json['startDate'] ?? ''),
      endDate: DateTime.parse(json['endDate'] ?? ''),
      progress: json['progress'],
      status: json['status'] ?? false,
    );
  }
}
