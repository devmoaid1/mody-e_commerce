import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logger/logger.dart';
import 'package:mody_ecommerce/app/constants/constants.dart';
import 'package:mody_ecommerce/models/product.dart';

class StoreService {
  Logger logger = Logger();
  final FirebaseFirestore _instance = FirebaseFirestore.instance;

  void addProduct(Product product) {
    try {
      _instance.collection(productCollection).add(product.toJson());
    } on FirebaseException catch (err) {
      logger.e(err.message, "error in adding product", err.stackTrace);
      throw err.message.toString();
    }
  }
}
