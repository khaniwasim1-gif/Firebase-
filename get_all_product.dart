// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:task/model_class/product_class.dart';
// import 'package:task/view/Create_product.dart';
// import 'package:task/view/update_product.dart';
// import 'package:task/view/update_task.dart';
// import '../model_class/task_class.dart';
// import '../services/product_service.dart';
// import '../services/task_service.dart';
// import 'create_task.dart';
// import 'get_completed_task.dart';
// import 'get_product.dart';
// import 'incompleted_task.dart';
//
// class GetAllProductView extends StatelessWidget {
//   const GetAllProductView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Get All Product"),
//         actions: [
//           IconButton(
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) =>GetInCompletedTaskView(),
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
//             MaterialPageRoute(builder: (context) => ProductCreate()),
//           );
//         },
//         child: Icon(Icons.add),
//       ),
//       body: StreamProvider.value(
//         value: ProductService().getAllProductService(),
//         initialData: [ProductModel()],
//         builder: (context, child) {
//           List<ProductModel> productList = context.watch<List<ProductModel>>();
//           return ListView.builder(
//             itemCount: productList.length,
//             itemBuilder: (context, i) {
//               return ListTile(
//                 leading: Icon(Icons.task),
//                 title: Text(productList[i].name.toString()),
//                 subtitle: Text(productList[i].product.toString()),
//                 trailing: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     // Checkbox(
//                     //   value: productList[i].isCompleted,
//                     //   onChanged: (val) async {
//                     //     try {
//                     //       await ProductService().markProduct(
//                     //         productList[i].docId,
//                     //       );
//                     //     } catch (e) {
//                     //       ScaffoldMessenger.of(
//                     //         context,
//                     //       ).showSnackBar(SnackBar(content: Text(e.toString())));
//                     //     }
//                     //   },
//                     // ),//
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
//                               .deleteProductService(productList[i].docId.toString())
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
//                                   builder: (context) => UpdateProduct(model: productList[i])));
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