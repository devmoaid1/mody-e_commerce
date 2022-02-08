import 'package:mody_ecommerce/app/constants/constants.dart';
import 'package:mody_ecommerce/models/product.dart';
import 'package:stacked/stacked.dart';

class EditProductViewModel extends BaseViewModel {
  void update({String? id, Product? product}) {
    setBusy(true);

    try {
      storeService.editProduct(id: id, product: product);
      setBusy(false);
      dialogService.showDialog(title: "Updated Product Successfully");
    } catch (err) {
      dialogService.showDialog(title: err.toString());
    }
  }
}
