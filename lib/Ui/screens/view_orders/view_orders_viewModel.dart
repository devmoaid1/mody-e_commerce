import 'package:mody_ecommerce/app/app.router.dart';
import 'package:mody_ecommerce/app/constants/constants.dart';
import 'package:mody_ecommerce/models/order.dart';
import 'package:mody_ecommerce/models/product.dart';
import 'package:rxdart/rxdart.dart';
import 'package:stacked/stacked.dart';

class ViewOrdersViewModel extends BaseViewModel {
  BehaviorSubject<List<Order>> _orders = BehaviorSubject();
  Stream<List<Order>> get orders => _orders.stream;

  void navigateToOrderDetails({String? id}) {
    navigationService.navigateTo(Routes.orderDetailsView,
        arguments: OrderDetailsViewArguments(docId: id));
  }

  void getAllOrders() {
    setBusy(true);

    try {
      Stream<List<Order>> listOrders = orderService.getAllOrders();

      listOrders.forEach((orders) => _orders.sink.add(orders));
      setBusy(false);
    } catch (err) {
      setBusy(false);
      logger.e(err.toString());
    }
  }
}
