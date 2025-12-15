// import 'package:flutter/material.dart';
// import 'package:task/model_class/priority_class.dart';
// import 'package:task/model_class/product_class.dart';
// import 'package:task/services/product_service.dart';
//
//
// import '../model_class/task_class.dart';
// import '../services/task_service.dart';
//
// class UpdateProduct extends StatefulWidget {
//   final ProductModel model;
//
//   const UpdateProduct({super.key, required this.model});
//
//   @override
//   State<UpdateProduct> createState() => _UpdateProduct();
// }
//
// class _UpdateProduct extends State<UpdateProduct> {
//   TextEditingController titleController = TextEditingController();
//   TextEditingController descriptionController = TextEditingController();
//   bool isLoading = false;
//
//   @override
//   void initState() {
//     titleController = TextEditingController(
//       text: widget.model.name.toString(),
//     );
//     descriptionController = TextEditingController(
//       text: widget.model.product.toString(),
//     );
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Update product")),
//       body: Column(
//         children: [
//           TextField(controller: titleController),
//           TextField(controller: descriptionController),
//
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
//                   SnackBar(content: Text("product cannot be empty.")),
//                 );
//                 return;
//               }
//               try {
//                 isLoading = true;
//                 setState(() {});
//                 await ProductService()
//                     .updateProductService(
//                   ProductModel(
//                     docId: widget.model.docId.toString(),
//                     name: titleController.text,
//                     product: descriptionController.text,
//                   )
//                 )
//                     .then((val) {
//                   showDialog(
//                     context: context,
//                     builder: (context) {
//                       return AlertDialog(
//                         title: Text("Message"),
//                         content: Text(
//                           "Task has been updated successfully",
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
//             child: Text("Update product"),
//           ),
//         ],
//       ),
//     );
//   }
// }