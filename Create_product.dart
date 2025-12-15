// import 'package:flutter/material.dart';
// import 'package:task/model_class/priority_class.dart';
// import 'package:task/model_class/product_class.dart';
// import 'package:task/services/product_service.dart';
// import 'package:task/view/get_all_product.dart';
// import 'package:task/view/get_all_task.dart';
//
// import '../model_class/task_class.dart';
// import '../services/task_service.dart';
//
// class ProductCreate extends StatefulWidget {
//   const ProductCreate({super.key,});
//
//   @override
//   State<ProductCreate > createState() => _CreateProduct();
// }
//
// class _CreateProduct extends State<ProductCreate > {
//   TextEditingController titleController = TextEditingController();
//
//   TextEditingController productController = TextEditingController();
//
//   bool isLoading = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Create product")),
//       body: Column(
//         children: [
//           TextField(controller: titleController),
//           TextField(controller: productController),
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
//               if (productController.text.isEmpty) {
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(content: Text("Description cannot be empty.")),
//                 );
//                 return;
//               }
//               try {
//                 isLoading = true;
//                 setState(() {});
//                 await ProductService()
//                     .createProductService(
//                   ProductModel(
//                     name: titleController.text.toString(),
//                     product: productController.text.toString(),
//                     createAt: DateTime.now().millisecondsSinceEpoch,
//                   )
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
//                           "product has been created successfully",
//                         ),
//                         actions: [
//                           TextButton(
//                             onPressed: () {
//
//                               Navigator.push(context, MaterialPageRoute(builder: (context)=>GetAllProductView()));
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
//             child: Text("Create Product"),
//           ),
//         ],
//       ),
//     );
//   }
// }