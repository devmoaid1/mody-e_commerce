import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:mody_ecommerce/app/constants/constants.dart';
import 'package:mody_ecommerce/models/order.dart';
import 'package:mody_ecommerce/models/product.dart';

class StoreService {
  final FirebaseFirestore _instance = FirebaseFirestore.instance;

  void addProduct(Product product) {
    try {
      _instance.collection(productCollection).add(product.toJson());
    } on FirebaseException catch (err) {
      logger.e(err.message, "error in adding product", err.stackTrace);
      throw err.message.toString();
    }
  }

  Stream<List<Product>> getAllProducts() => _instance
      .collection(productCollection)
      .snapshots()
      .map((querySnapshot) => querySnapshot.docs
          .map((snapShot) => Product(
                productId: snapShot.id,
                category: snapShot.data()['category'],
                productDescription: snapShot.data()['productDescription'],
                productLocation: snapShot.data()['productLocation'],
                productName: snapShot.data()['productName'],
                productPrice:
                    (snapShot.data()['productPrice'] as num?)?.toDouble(),
              ))
          .toList())
      .handleError((err) => logger.e(err.toString()));

  Stream<List<Order>> getAllOrders() => _instance
      .collection(ordersCollection)
      .snapshots()
      .map((querySnapshot) => querySnapshot.docs
          .map((snapShot) => Order.fromJson(snapShot.data()))
          .toList())
      .handleError((err) => logger.e(err.toString()));

  void deleteProduct({String? id}) =>
      _instance.collection(productCollection).doc(id).delete();

  void editProduct({String? id, Product? product}) => _instance
      .collection(productCollection)
      .doc(id)
      .set(product!.toJson(), SetOptions(merge: true));

  void storeOrders({Order? order, List<Product>? products}) {
    DocumentReference document = _instance.collection(ordersCollection).doc();
    try {
      document.set(order!.toJson());

      products!.forEach((product) {
        document.collection("orderDetails").doc().set(product.toJson());
      });
    } on StateError catch (err) {
      throw err.message;
    }
  }
}
