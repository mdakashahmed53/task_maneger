class TaskModel {
  final String id;
  final String title;
  final String description;
  final String createdDate;
  final String status; // যেমন: 'Pending', 'Completed'

  TaskModel({
    required this.id,
    required this.title,
    required this.description,
    required this.createdDate,
    required this.status,
  });

  // JSON থেকে ডেটা মডেলে কনভার্ট করার জন্য
  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['_id'],
      title: json['title'],
      description: json['description'],
      createdDate: json['createdDate'] ?? '',
      status: json['status'],
    );
  }

  // মডেল থেকে JSON-এ কনভার্ট করার জন্য
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'createdDate': createdDate,
      'status': status,
    };
  }
}
