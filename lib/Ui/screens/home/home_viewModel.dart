import 'package:firebase_auth/firebase_auth.dart';
import 'package:mody_ecommerce/Ui/widgets/setup_custom_dialog.dart';
import 'package:mody_ecommerce/app/app.router.dart';
import 'package:mody_ecommerce/app/constants/constants.dart';
import 'package:mody_ecommerce/models/category.dart';
import 'package:mody_ecommerce/models/product.dart';
import 'package:rxdart/rxdart.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  User? _currentUser;
  int _currentTabIndex = 0;
  int _currentBottomIndex = 0;
  final BehaviorSubject<List<Product>> _products = BehaviorSubject();

  final List<Category> _categories = [
    Category(name: "Jackets", index: 0),
    Category(name: "Shoes", index: 1),
    Category(name: "T-Shirts", index: 2),
    Category(name: "Trousers", index: 3)
  ];
  List<Product>? _allProducts;

  List<Product>? get allProducts => _allProducts;

// getters for state
  User? get currentUser => _currentUser;

  Stream<List<Product>> get products => _products.stream;
  int get currentTabIndex => _currentTabIndex;
  int get currentBottomIndex => _currentBottomIndex;
  List<Category> get categories => _categories;

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

  void logout() async {
    setBusy(true);
    try {
      await authService.logout();
      setBusy(false);
      navigationService.replaceWith(Routes.loginView);
    } catch (e) {
      setBusy(false);
      await dialogService.showCustomDialog(
          variant: DialogType.basic,
          title: e.toString(),
          mainButtonTitle: "ok");
    }
  }
}
