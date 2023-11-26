class Project1 {
  final String id;
  final String name;
  final DateTime endDate;
  final DateTime startDate;
  final bool status;
  final dynamic progress;
  List<Task> tasks;

  Project1({
    required this.id,
    required this.name,
    required this.endDate,
    required this.startDate,
    required this.status,
    dynamic progress,
    required this.tasks,
  }) : progress = progress;
  bool hasNewTasks() {
    return tasks.any((task) => task.isNew);
  }

  factory Project1.fromJson(Map<String, dynamic> json) {
    return Project1(
      id: json['id'] ?? '', 
      name: json['name'] ?? '', 
      endDate: json['endDate'] != null
          ? DateTime.parse(json['endDate'])
          : DateTime.now(),
      startDate: json['startDate'] != null
          ? DateTime.parse(json['startDate'])
          : DateTime.now(),
      status: json['status'] ??
          false,
          
      progress: json[
          'progress'],
          
      tasks: [], 
      
    );
  }
}

class Task {
  String name;
  bool isNew;

  Task({required this.name, required this.isNew});
}
