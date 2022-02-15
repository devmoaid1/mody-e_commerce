import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mody_ecommerce/app/constants/constants.dart';
import 'package:mody_ecommerce/models/order.dart';
import 'package:mody_ecommerce/models/product.dart';

class OrderService {
  final FirebaseFirestore _instance = FirebaseFirestore.instance;

  Stream<List<Order>> getAllOrders() => _instance
      .collection(ordersCollection)
      .snapshots()
      .map((querySnapshot) => querySnapshot.docs
          .map((snapShot) => Order(
              orderId: snapShot.id,
              address: snapShot.data()['address'],
              totalPrice: snapShot.data()['totalPrice'] as int?))
          .toList())
      .handleError((err) => logger.e(err.toString()));

  Stream<List<Product>> getOrderDetails({String? docId}) => _instance
      .collection(ordersCollection)
      .doc(docId)
      .collection("orderDetails")
      .snapshots()
      .map((querySnapShots) => querySnapShots.docs
          .map((element) => Product.fromJson(element.data()))
          .toList())
      .handleError((err) => logger.e(err.toString()));

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
