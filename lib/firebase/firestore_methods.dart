import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:uuid/uuid.dart';

class FirestoreMethods {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  // a function to upload a task

  Future<String> uploadTask(String description, String uid, String taskName) async {
    String res = "some error occurred";
    try {
      String taskId = const Uuid().v1();

      TaskModel taskModel = TaskModel(taskName: taskName,
        description: description,
        taskId: taskId,
        datePublished: DateTime.now(),);

      firestore.collection('tasks').doc(taskId).set(taskModel.toJson());

      res = "success";
    } catch (e) {
      res =e.toString();
    }
    return res;
  }

  Future<void> deleteTask(String taskId) async {
    try {
      await firestore.collection("tasks").doc(taskId).delete();
    } catch (e) {
      print(e.toString());
    }
  }

}