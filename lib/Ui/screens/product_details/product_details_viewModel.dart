import 'package:mody_ecommerce/app/app.router.dart';
import 'package:mody_ecommerce/app/constants/constants.dart';
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
    try {
      _cartItems.add(product);
      notifyListeners();
      dialogService.showDialog(title: "Item Added to cart");
    } catch (err) {
      dialogService.showDialog(title: err.toString());
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
