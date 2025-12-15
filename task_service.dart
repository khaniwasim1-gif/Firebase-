import 'package:cloud_firestore/cloud_firestore.dart';

import '../model_class/task_class.dart';


class TaskServices {
  ///Create Task
  Future createTask(PriorityModel model) async {
    DocumentReference docRef = FirebaseFirestore.instance
        .collection('taskCollection')
        .doc();
    return await FirebaseFirestore.instance
        .collection('taskCollection')
        .doc(docRef.id)
        .set(model.toJson(docRef.id));
  }

  ///Update Task
  Future updateTask(PriorityModel model) async {
    return await FirebaseFirestore.instance
        .collection('taskCollection')
        .doc(model.docId)
        .update({"title": model.title, "description": model.description});
  }

  ///Delete Task
  Future deleteTask(String taskID) async {
    return await FirebaseFirestore.instance
        .collection('taskCollection')
        .doc(taskID)
        .delete();
  }

  ///Mark Task as Complete
  Future markTaskAsComplete(String taskID) async {
    return await FirebaseFirestore.instance
        .collection('taskCollection')
        .doc(taskID)
        .update({'isCompleted': true});
  }

  ///Get All Task
  Stream<List<PriorityModel>> getAllTask() {
    return FirebaseFirestore.instance
        .collection('taskCollection')
        .snapshots()
        .map(
          (taskList) => taskList.docs
          .map((taskJson) => PriorityModel.fromJson(taskJson.data()))
          .toList(),
    );
  }

  ///Get Completed Task
  Stream<List<PriorityModel>> getCompletedTask() {
    return FirebaseFirestore.instance
        .collection('taskCollection')
        .where('isCompleted', isEqualTo: true)
        .snapshots()
        .map(
          (taskList) => taskList.docs
          .map((taskJson) => PriorityModel.fromJson(taskJson.data()))
          .toList(),
    );
  }

  ///Get InCompleted Task
  Stream<List<PriorityModel>> getInCompletedTask() {
    return FirebaseFirestore.instance
        .collection('taskCollection')
        .where('isCompleted', isEqualTo: false)
        .snapshots()
        .map(
          (taskList) => taskList.docs
          .map((taskJson) => PriorityModel.fromJson(taskJson.data()))
          .toList(),
    );
  }

  ///Get Priority Task
  Stream<List<PriorityModel>> getPriorityTask(String priorityID) {
    return FirebaseFirestore.instance
        .collection('taskCollection')
        .where('priorityID', isEqualTo: priorityID)
        .snapshots()
        .map(
          (taskList) => taskList.docs
          .map((taskJson) => PriorityModel.fromJson(taskJson.data()))
          .toList(),
    );
  }
}