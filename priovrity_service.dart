//
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/scheduler.dart';
// import 'package:task/model_class/priority_class.dart';
//
// class ModelService {
//
//  ///create task
//   Future createModelService(ModelClass model) async {
//     DocumentReference docRef = FirebaseFirestore.instance
//         .collection('ModelCollection')
//         .doc();
//     return await FirebaseFirestore.instance
//         .collection('ModelCollection')
//         .doc(docRef.id)
//         .set(model.toJson(docRef.id));
//   }
//   ///Update Task
//   Future updateModelService(ModelClass model) async {
//     return await FirebaseFirestore.instance
//         .collection('ModelCollection')
//         .doc(model.docId)
//         .update({"title": model.name, "description": model.docId});
//   }
//
//   ///Delete Task
//   Future deleteModelService(String modelClassID) async {
//     return await FirebaseFirestore.instance
//         .collection('ModelCollection')
//         .doc(modelClassID)
//         .delete();
//   }
//   Stream<List<ModelClass>> getAllModelService() {
//     return FirebaseFirestore.instance
//         .collection('ModelCollection')
//         .snapshots()
//         .map(
//           (modelClassList) => modelClassList.docs
//           .map((modelClassJson) => ModelClass.fromJson(modelClassJson.data()))
//           .toList(),
//     );
//
//   }
//   ///Get Priority Task
//   Stream<List<Priority>> getPriority(String priorityID) {
//     return FirebaseFirestore.instance
//         .collection('priorityCollection')
//         .where('priorityID', isEqualTo: priorityID)
//         .snapshots()
//         .map(
//           (priorityList) => priorityList.docs
//           .map((modelJson) => ModelClass.fromJson(modelJson.data()))
//           .toList(),
//     );
//
//
// }}