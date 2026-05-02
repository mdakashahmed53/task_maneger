class TaskModel {
  final int id;
  final String title;
  final String description;
  final String date;
  final String status; // যেমন: 'Pending', 'Completed'

  TaskModel({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.status,
  });

  // JSON থেকে ডেটা মডেলে কনভার্ট করার জন্য
  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      date: json['date'],
      status: json['status'],
    );
  }

  // মডেল থেকে JSON-এ কনভার্ট করার জন্য
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'date': date,
      'status': status,
    };
  }
}
