import 'package:mody_ecommerce/Ui/widgets/setup_custom_dialog.dart';
import 'package:mody_ecommerce/app/app.router.dart';
import 'package:mody_ecommerce/app/constants/constants.dart';
import 'package:mody_ecommerce/models/product.dart';
import 'package:rxdart/subjects.dart';
import 'package:stacked/stacked.dart';

class ManageProductViewModel extends BaseViewModel {
  BehaviorSubject<List<Product>> _products = BehaviorSubject();
  bool _isLoading = true;

  Stream<List<Product>> get products => _products.stream;
  bool get loadingState => _isLoading;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void navigateToEditProduct({Product? product}) {
    navigationService.navigateTo(Routes.editProductView,
        arguments: EditProductViewArguments(product: product));
  }

  void getAllProducts() {
    setBusy(true);
    setLoading(true);
    try {
      Stream<List<Product>> listProducts = storeService.getAllProducts();

      listProducts.forEach((product) => _products.sink.add(product));
      setBusy(false);
      setLoading(false);
    } catch (err) {
      setBusy(false);
      logger.e(err.toString());
    }
  }

  void deleteProduct({String? id}) {
    setBusy(true);
    try {
      storeService.deleteProduct(id: id);
      setBusy(false);
      navigationService.back();
      dialogService.showCustomDialog(
          variant: DialogType.admin,
          title: "Deleted Product !",
          mainButtonTitle: "ok");
    } catch (err) {
      setBusy(false);
      logger.e(err.toString());
      dialogService.showCustomDialog(
          variant: DialogType.admin,
          title: err.toString(),
          mainButtonTitle: "ok");
    }
  }
}
