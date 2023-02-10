import 'package:cloud_firestore/cloud_firestore.dart';

class TaskModel {
  final String taskName;
  final String description;
  final String taskId;
  final datePublished;

  const TaskModel({
    required this.taskName,
    required this.description,
    required this.taskId,
    required this.datePublished,
  });

  Map<String, dynamic> toJson() => {
        "taskName": taskName,
        "description": description,
        "taskId": taskId,
        "datePublished": datePublished,
      };

  static TaskModel fromSnap(DocumentSnapshot snapshot) {
    var snap = snapshot.data() as Map<String, dynamic>;

    return TaskModel(
      taskName: snapshot["taskName"],
      description: snapshot["description"],
      taskId: snapshot["taskId"],
      datePublished: snapshot["datePublished"],
    );
  }
}
