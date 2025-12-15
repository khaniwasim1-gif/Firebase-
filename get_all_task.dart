// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:task/view/update_task.dart';
// import '../model_class/task_class.dart';
// import '../services/task_service.dart';
// import 'create_task.dart';
// import 'get_completed_task.dart';
// import 'incompleted_task.dart';
//
// class GetAllTaskView extends StatelessWidget {
//   const GetAllTaskView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Get All Task"),
//         actions: [
//           IconButton(
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => GetInCompletedTaskView(),
//                 ),
//               );
//             },
//             icon: Icon(Icons.incomplete_circle),
//           ),
//           IconButton(
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => GetCompletedTaskView()),
//               );
//             },
//             icon: Icon(Icons.circle),
//           ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => CreateTaskView(isUpdateMode: false,)),
//           );
//         },
//         child: Icon(Icons.add),
//       ),
//       body: StreamProvider.value(
//         value: TaskServices().getAllTask(),
//         initialData: [PriorityModel()],
//         builder: (context, child) {
//           List<PriorityModel> taskList = context.watch<List<PriorityModel>>();
//           return ListView.builder(
//             itemCount: taskList.length,
//             itemBuilder: (context, i) {
//               return ListTile(
//                 leading: Icon(Icons.task),
//                 title: Text(taskList[i].title.toString()),
//                 subtitle: Text(taskList[i].description.toString()),
//                 trailing: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Checkbox(
//                       value: taskList[i].isCompleted,
//                       onChanged: (val) async {
//                         try {
//                           await TaskServices().markTaskAsComplete(
//                             taskList[i].docId.toString(),
//                           );
//                         } catch (e) {
//                           ScaffoldMessenger.of(
//                             context,
//                           ).showSnackBar(SnackBar(content: Text(e.toString())));
//                         }
//                       },
//                     ),//
//
//
//
//
//
//
//                     // delete task
//                     IconButton(
//                       onPressed: () async {
//                         try {
//                           await TaskServices()
//                               .deleteTask(taskList[i].docId.toString())
//                               .then((val) {
//                             ScaffoldMessenger.of(context).showSnackBar(
//                               SnackBar(
//                                 content: Text(
//                                   "Task has been deleted successfully",
//                                 ),
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
// //update task
//                     IconButton(
//                         onPressed: () {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => UpdateTaskView(model: taskList[i],)));
//                         },
//                         icon: Icon(
//                           Icons.edit,
//                           color: Colors.blue,
//                         )),
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