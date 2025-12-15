import 'package:cloud_firestore/cloud_firestore.dart';


import '../model_class/quiz_class.dart';

class QuizService{
//create Quiz task
  Future createQuizTask(QuizModel model) async {
    DocumentReference docRef = FirebaseFirestore.instance
        .collection('QuizCollection')
        .doc();
    return await FirebaseFirestore.instance
        .collection('QuizCollection')
        .doc(docRef.id)
        .set(model.toJson(docRef.id));
  }

  //update quiz
  Future updateQuizTask(QuizModel model)async{
    return await FirebaseFirestore.instance
        .collection("QuizCollection")
        .doc(model.docId)
        .update({'name':model.name});
  }
//delete Quiz
  Future deleteQuizTask(String quizID)async{

    return await FirebaseFirestore.instance
        .collection("QuizCollection")
        .doc(quizID)
        .delete();
  }
  ///Get All Quiz
  Stream<List<QuizModel>> getAllQuiz() {
    return FirebaseFirestore.instance
        .collection('QuizCollection')
        .snapshots()
        .map(
          (quizList) => quizList.docs
          .map((quizJson) => QuizModel.fromJson(quizJson.data()))
          .toList(),
    );
  }
}