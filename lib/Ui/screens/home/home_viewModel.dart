import 'package:firebase_auth/firebase_auth.dart';
import 'package:mody_ecommerce/app/app.router.dart';
import 'package:mody_ecommerce/app/constants/constants.dart';
import 'package:mody_ecommerce/models/product.dart';
import 'package:rxdart/rxdart.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  User? _currentUser;
  int _currentTabIndex = 0;
  int _currentBottomIndex = 0;
  BehaviorSubject<List<Product>> _products = BehaviorSubject();

  List<Product>? _allProducts;

  List<Product>? get allProducts => _allProducts;

// getters for state
  User? get currentUser => _currentUser;

  Stream<List<Product>> get products => _products.stream;
  int get currentTabIndex => _currentTabIndex;
  int get currentBottomIndex => _currentBottomIndex;

  void navigateToProductView(Product product) {
    navigationService.navigateTo(Routes.productDetailsView,
        arguments: ProductDetailsViewArguments(product: product));
  }

  void navigateToCartScreen() {
    navigationService.navigateTo(Routes.cartView);
  }

  void setTabIndex(int value) {
    _currentTabIndex = value;
    notifyListeners();
  }

  void setBottomIndex(int value) {
    _currentBottomIndex = value;
    notifyListeners();
  }

  void init() {
    getUser();
    getAllProducts();
  }

  void getAllProducts() {
    setBusy(true);

    try {
      Stream<List<Product>> listProducts = storeService.getAllProducts();
      listProducts.forEach((element) {
        _allProducts = element;
        notifyListeners();
      });
      listProducts.forEach((product) => _products.sink.add(product));
      setBusy(false);
    } catch (err) {
      setBusy(false);
      logger.e(err.toString());
    }
  }

  void getUser() {
    setBusy(true);
    try {
      _currentUser = authService.getCurrentUser();
      setBusy(false);
    } catch (err) {
      setBusy(false);
      logger.e(err.toString());
    }
  }
}
