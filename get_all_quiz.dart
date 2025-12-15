// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:task/view/update_quiz.dart';
//
// import '../model_class/quiz_class.dart';
// import '../services/Quiz_service.dart';
// import 'create_quiz.dart';
//
// class GetAllQuizView extends StatelessWidget {
//   const GetAllQuizView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//       appBar: AppBar(title: const Text("Get All Quiz")),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => CreateQuizView()),
//           );
//         },
//         child: const Icon(Icons.add),
//       ),
//       body: StreamProvider.value(
//         value: QuizService().getAllQuiz(),
//         initialData: [QuizModel()],
//         builder: (context, child) {
//           List<QuizModel> quizList = context.watch<List<QuizModel>>();
//           return ListView.builder(
//             itemCount: quizList.length,
//             itemBuilder: (BuildContext context, int index) {
//               return ListTile(
//                 leading: Icon(Icons.task),
//                 title: Text(quizList[index].name.toString()),
//                 subtitle: Text(quizList[index].description.toString()),
//               /*  trailing: Row(
//                   children: [
//                     // delete quiz task
//                     IconButton(
//                       onPressed: () async {
//                         try {
//                           await QuizService()
//                               .deleteQuizTask(quizList[index].docId.toString())
//                               .then((val) {
//                                 ScaffoldMessenger.of(context).showSnackBar(
//                                   SnackBar(
//                                     content: Text(
//                                       "Quiz has been deleted successfully",
//                                     ),
//                                   ),
//                                 );
//                               });
//                         } catch (e) {
//                           ScaffoldMessenger.of(
//                             context,
//                           ).showSnackBar(SnackBar(content: Text(e.toString())));
//                         }
//                       },
//                       icon: Icon(Icons.delete, color: Colors.red),
//                     ),
//                     //update task
//                     IconButton(
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) =>
//                                 UpdateQuizTaskView(model: quizList[index]),
//                           ),
//                         );
//                       },
//                       icon: Icon(Icons.edit, color: Colors.blue),
//                     ),
//                   ],
//                 ),*/
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }
