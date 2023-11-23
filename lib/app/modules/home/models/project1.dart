class Project1 {
  final String id;
  final String name;
  final DateTime endDate;
  final bool status;
  final int progress;

  Project1({
    required this.id,
    required this.name,
    required this.endDate,
    required this.status,
    required this.progress,
  });

  factory Project1.fromJson(Map<String, dynamic> json) {
    return Project1(
      id: json['id'],
      name: json['name'],
      endDate: DateTime.parse(json['endDate']),
      status: json['status'],
      progress: json['progress'],
    );
  }
}
