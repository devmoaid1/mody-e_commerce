import 'package:mody_ecommerce/Ui/widgets/setup_custom_dialog.dart';
import 'package:mody_ecommerce/app/app.router.dart';
import 'package:mody_ecommerce/app/constants/constants.dart';
import 'package:mody_ecommerce/models/order.dart';
import 'package:mody_ecommerce/models/product.dart';
import 'package:stacked/stacked.dart';

class ProductDetailsViewModel extends BaseViewModel {
  int _quantity = 1;

  int get quantity => _quantity;

  List<Product> _cartItems = [];

  List<Product>? get cartItems => _cartItems;

  void navigateToCartScreen() {
    navigationService.navigateTo(Routes.cartView);
  }

  void resetQuantity() {
    _quantity = 1;
    notifyListeners();
  }

  void addToCart({Product? product, int? quantity}) {
    product!.productQuantity = quantity;

    bool isExist = false;
    try {
      if (_cartItems.contains(product)) {
        isExist = true;
      }

      if (isExist) {
        dialogService.showCustomDialog(
            variant: DialogType.basic,
            title: "Item is Already on cart",
            mainButtonTitle: "ok");
      } else {
        _cartItems.add(product);
        notifyListeners();
        dialogService.showCustomDialog(
            variant: DialogType.basic,
            title: "Item is added to cart",
            mainButtonTitle: "ok");
      }
    } catch (err) {
      logger.e(err.toString());
      dialogService.showCustomDialog(
          variant: DialogType.basic,
          title: "something went wrong",
          mainButtonTitle: "ok");
    }
  }

  void deleteCartItem({Product? product}) {
    try {
      _cartItems.remove(product);
      notifyListeners();
      dialogService.showCustomDialog(
          variant: DialogType.basic,
          title: "Item Deleted from cart",
          mainButtonTitle: "ok");
    } catch (err) {
      logger.e(err.toString());
    }
  }

  void editProduct({Product? product}) {
    try {
      resetQuantity(); // reset quantity to 1 before going back
      navigationService.back();
      _cartItems.remove(product);
      notifyListeners();
      navigationService.navigateTo(Routes.productDetailsView,
          arguments: ProductDetailsViewArguments(product: product));
    } catch (err) {
      logger.e(err.toString());
    }
  }

  int calculateTotalPrice({List<Product>? products}) {
    int total = 0;
    products!.forEach((element) {
      total += element.productQuantity! * element.productPrice!.toInt();
    });
    return total;
  }

  void placeOrder({Order? order, List<Product>? products}) {
    setBusy(true);
    try {
      storeService.storeOrders(order: order, products: products);
      setBusy(false);
      navigationService.back();
      dialogService.showCustomDialog(
          variant: DialogType.basic,
          title: "Order Succes !",
          mainButtonTitle: "ok");
    } catch (e) {
      logger.e(e.toString());
      dialogService.showCustomDialog(
          variant: DialogType.basic,
          title: "something Wrong happened",
          mainButtonTitle: "ok");
    }
  }

  void add() {
    _quantity++;
    notifyListeners();
  }

  void subtract() {
    if (_quantity > 1) {
      _quantity--;
      notifyListeners();
    }
  }
}
