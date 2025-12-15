// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:task/model_class/product_class.dart';
// import 'package:task/services/product_service.dart';
// import 'package:task/view/update_task.dart';
// import 'package:task/view/update_product.dart';
// import '../model_class/task_class.dart';
// import '../services/task_service.dart';
// import 'create_task.dart';
// import 'get_completed_task.dart';
// import 'incompleted_task.dart';
//
// class GetAllProduct extends StatelessWidget {
//   const GetAllProduct({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Get All product"),
//         actions: [
//
//
//           IconButton(
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => GetAllProduct()),
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
//       body:StreamProvider.value(
//         value: ProductService().getAllProductService(),
//         initialData: const <ProductModel>[],
//         builder: (context, child) {
//           List<ProductModel> ProdctClassList = context.watch<List<ProductModel>>();
//           return ListView.builder(
//             itemCount: ProdctClassList.length,
//             itemBuilder: (context, i) {
//               return ListTile(
//                 leading: Icon(Icons.task),
//                 title: Text(ProdctClassList[i].name.toString()),
//                 subtitle: Text(ProdctClassList[i].product.toString()),
//                 trailing:  Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Checkbox(
//                       value: ProdctClassList[i].isCompleted,
//                       onChanged: (val) async {
//                         try {
//                           await TaskServices().markTaskAsComplete(
//                             ProdctClassList[i].docId.toString(),
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
//                           await ProductService()
//                               .deleteProductService(ProdctClassList[i].docId.toString())
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
//                                   builder: (context) => UpdateProduct(model: ProdctClassList[i],)));
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