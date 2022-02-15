import 'package:mody_ecommerce/app/constants/constants.dart';
import 'package:mody_ecommerce/models/product.dart';
import 'package:rxdart/rxdart.dart';
import 'package:stacked/stacked.dart';

class OrderDetailsViewModel extends BaseViewModel {
  BehaviorSubject<List<Product>> _orderDetails = BehaviorSubject();
  Stream<List<Product>> get orderDetails => _orderDetails.stream;

  void loadOrderDetails({String? docId}) {
    setBusy(true);

    try {
      Stream<List<Product>> listProducts =
          orderService.getOrderDetails(docId: docId);

      listProducts.forEach((product) => _orderDetails.sink.add(product));
      setBusy(false);
    } catch (err) {
      setBusy(false);
      logger.e(err.toString());
    }
  }
}
