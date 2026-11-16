


class TaskModel {
  String? id;
  String title;
  String? description;
  String date;
  String time;
  String priority;
  String category;

  TaskModel({
    this.id,
    required this.title,
    this.description,
    required this.date,
    required this.time,
    required this.priority,
    required this.category,
  });

  // تحويل البيانات إلى Map لكي تفهمها قاعدة البيانات (مثل Firebase)
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'date': date,
      'time': time,
      'priority': priority,
      'category': category,
    };
  }
}