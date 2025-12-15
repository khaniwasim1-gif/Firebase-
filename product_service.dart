

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:task/model_class/priority_class.dart';
import 'package:task/model_class/product_class.dart';

class ProductService {


  Future createProductService(ProductModel model) async {
    DocumentReference docRef = FirebaseFirestore.instance
        .collection('ProductCollection')
        .doc();
    return await FirebaseFirestore.instance
        .collection('ProductCollection')
        .doc(docRef.id)
        .set(model.toJson(docRef.id));
  } ///Mark Task as Complete
  // Future markProduct(ProductModel model) async {
  //   return await FirebaseFirestore.instance
  //       .collection('ProductCollection')
  //       .doc(model.docId)
  //       .update({'isCompleted': true});
  // }
  ///Update Task
  Future updateProductService(ProductModel model) async {
    return await FirebaseFirestore.instance
        .collection('ProductCollection')
        .doc(model.docId)
        .update({"title": model.name, "description": model.docId});
  }

  ///Delete Task
  Future deleteProductService(String productID) async {
    return await FirebaseFirestore.instance
        .collection('ProductCollection')
        .doc(productID)
        .delete();
  }
  Stream<List<ProductModel>> getAllProductService() {
    return FirebaseFirestore.instance
        .collection('ProductCollection')
        .snapshots()
        .map(
          (productList) => productList.docs
          .map((productJson) => ProductModel.fromJson(productJson.data()))
          .toList(),
    );

  }


}