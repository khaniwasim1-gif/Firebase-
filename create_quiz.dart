// import 'package:flutter/material.dart';
//
//
// import '../model_class/quiz_class.dart';
// import '../services/Quiz_service.dart';
//
//
// class CreateQuizView extends StatefulWidget {
//   CreateQuizView({super.key});
//
//   @override
//   State<CreateQuizView> createState() => _CreateQuizViewState();
// }
//
// class _CreateQuizViewState extends State<CreateQuizView> {
//   TextEditingController titleController = TextEditingController();
//
//   TextEditingController descriptionController = TextEditingController();
//
//   bool isLoading = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Create Quiz View")),
//       body: Column(
//         children: [
//           TextField(controller: titleController),
//           TextField(controller: descriptionController),
//           SizedBox(height: 20),
//           isLoading
//               ? Center(child: CircularProgressIndicator())
//               : ElevatedButton(
//             onPressed: () async {
//               if (titleController.text.isEmpty) {
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(content: Text("Title cannot be empty.")),
//                 );
//                 return;
//               }
//               if (descriptionController.text.isEmpty) {
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(content: Text("Description cannot be empty.")),
//                 );
//                 return;
//               }
//               try {
//                 isLoading = true;
//                 setState(() {});
//                 await QuizService()
//                     .createQuizTask(
//                   QuizModel(
//                     name: titleController.text,
//                     description: descriptionController.text,
//                     createAt: DateTime.now().millisecondsSinceEpoch,
//
//                   ),
//                 )
//                     .then((val) {
//                   isLoading = false;
//                   setState(() {});
//                   showDialog(
//                     context: context,
//                     builder: (context) {
//                       return AlertDialog(
//                         title: Text("Message"),
//                         content: Text(
//                           "Quiz has been created successfully",
//                         ),
//                         actions: [
//                           TextButton(
//                             onPressed: () {
//                               Navigator.pop(context);
//                               Navigator.pop(context);
//                             },
//                             child: Text("Okay"),
//                           ),
//                         ],
//                       );
//                     },
//                   );
//                 });
//               } catch (e) {
//                 isLoading = false;
//                 setState(() {});
//                 ScaffoldMessenger.of(
//                   context,
//                 ).showSnackBar(SnackBar(content: Text(e.toString())));
//               }
//             },
//             child: Text("Create QuizTask"),
//           ),
//         ],
//       ),
//     );
//   }
// }