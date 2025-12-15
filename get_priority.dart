// import 'dart:core';
//
// import 'package:flutter/material.dart';
//
// import 'package:provider/provider.dart';
// import 'package:task/model_class/priority_class.dart';
// import 'package:task/services/priovrity_service.dart';
// import 'package:task/view/create_task.dart';
// import 'package:task/view/priority_get_update.dart';
//
// class GetPriorityView extends StatefulWidget {
//   const GetPriorityView({super.key});
//
//   @override
//   State<GetPriorityView> createState() => _GetPriorityViewState();
// }
//
// class _GetPriorityViewState extends State<GetPriorityView> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Get All Priorities")),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => CreateTaskView(
//                // model: ModelClass(),
//                 isUpdateMode: false,
//               ),
//             ),
//           ).then((val) {
//             setState(() {});
//           });
//         },
//         child: Icon(Icons.add),
//       ),
//       body: StreamProvider.value(
//         value: ModelService().getAllModelService(),
//         initialData: [ModelClass()],
//         builder: (context, child) {
//           List<ModelClass> modelClassList = context
//               .watch<List<ModelClass>>();
//           return ListView.builder(
//             itemCount: modelClassList.length,
//             itemBuilder: (context, i) {
//               return ListTile(
//                 leading: Icon(Icons.category),
//                 title: Text(modelClassList[i].name.toString()),
//                 trailing: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     IconButton(
//                       onPressed: () async {
//                         try {
//                           await ModelService()
//                               .deleteModelService(ModelClass() as String)
//                               .then((val) {
//                             setState(() {});
//                             ScaffoldMessenger.of(context).showSnackBar(
//                               SnackBar(
//                                 content: Text("Priority has been deleted."),
//                               ),
//                             );
//                           });
//                         } catch (e) {
//                           ScaffoldMessenger.of(
//                             context,
//                           ).showSnackBar(SnackBar(content: Text(e.toString())));
//                         }
//                       },
//                       icon: Icon(Icons.delete, color: Colors.red),
//                     ),
//                     IconButton(
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) =>CreateTaskView(
//
//                               isUpdateMode: true,
//                             ),
//                           ),
//                         ).then((val) {
//                           setState(() {});
//                         });
//                       },
//                       icon: Icon(Icons.edit),
//                     ),
//                   ],
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }