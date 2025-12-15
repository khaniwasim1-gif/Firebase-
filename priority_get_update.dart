// import 'package:flutter/material.dart';
// import 'package:task/model_class/priority_class.dart';
// import 'package:task/services/priovrity_service.dart';
//
// import '../model_class/task_class.dart';
//
// class CreatePriorityView extends StatefulWidget {
//   final PriorityModel model;
//   final bool isUpdateMode;
//
//   const CreatePriorityView({
//     super.key,
//     required this.model,
//     required this.isUpdateMode,
//   });
//
//   @override
//   State<CreatePriorityView> createState() => _CreatePriorityViewState();
// }
//
// class _CreatePriorityViewState extends State<CreatePriorityView> {
//   TextEditingController nameController = TextEditingController();
//   bool isLoading = false;
//
//   @override
//   void initState() {
//     if (widget.isUpdateMode == true) {
//       nameController = TextEditingController(
//         text: widget.model.title.toString(),
//       );
//     }
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.isUpdateMode ? "Update Task" : "Create Priority"),
//       ),
//       body: Column(
//         children: [
//           TextField(controller: nameController),
//           SizedBox(height: 20),
//           ElevatedButton(
//             onPressed: () async {
//               if (nameController.text.isEmpty) {
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(content: Text("Name cannot be empty.")),
//                 );
//                 return;
//               }
//               try {
//                 isLoading = true;
//                 setState(() {});
//                 if (widget.isUpdateMode) {
//                   await ModelService()
//                       .updateModelService(
//                     ModelClass(
//                       name: nameController.text,
//                       docId: widget.model.docId,
//                     //  createdAt: DateTime.now().millisecondsSinceEpoch,
//                     ),
//                   )
//                       .then((val) {
//                     showDialog(
//                       context: context,
//                       builder: (context) {
//                         return AlertDialog(
//                           title: Text("Message"),
//                           content: Text(
//                             widget.isUpdateMode
//                                 ? "Priority has been updated successfully"
//                                 : "Priority has been created successfully",
//                           ),
//                           actions: [
//                             TextButton(
//                               onPressed: () {
//                                 Navigator.pop(context);
//                                 Navigator.pop(context);
//                               },
//                               child: Text("Okay"),
//                             ),
//                           ],
//                         );
//                       },
//                     );
//                   });
//                 } else {
//                   await ModelService()
//                       .createModelService(
//                     ModelClass(
//                       name: nameController.text,
//                       //createAt: DateTime.now().millisecondsSinceEpoch,
//                     ),
//                   )
//                       .then((val) {
//                     showDialog(
//                       context: context,
//                       builder: (context) {
//                         return AlertDialog(
//                           title: Text("Message"),
//                           content: Text(
//                             widget.isUpdateMode
//                                 ? "Priority has been updated successfully"
//                                 : "Priority has been created successfully",
//                           ),
//                           actions: [
//                             TextButton(
//                               onPressed: () {
//                                 Navigator.pop(context);
//                                 Navigator.pop(context);
//                               },
//                               child: Text("Okay"),
//                             ),
//                           ],
//                         );
//                       },
//                     );
//                   });
//                 }
//               } catch (e) {
//                 isLoading = false;
//                 setState(() {});
//                 ScaffoldMessenger.of(
//                   context,
//                 ).showSnackBar(SnackBar(content: Text(e.toString())));
//               }
//             },
//             child: Text(
//               widget.isUpdateMode == true
//                   ? "Update Priority"
//                   : "Create Priority",
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }