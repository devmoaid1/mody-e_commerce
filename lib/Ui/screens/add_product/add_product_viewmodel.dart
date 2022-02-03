import 'package:mody_ecommerce/app/app.locator.dart';
import 'package:mody_ecommerce/app/constants/constants.dart';
import 'package:mody_ecommerce/models/product.dart';

import 'package:stacked/stacked.dart';

class AddProductViewModel extends BaseViewModel {
  void addProduct({required Product product}) {
    try {
      storeService.addProduct(product);
      dialogService.showDialog(title: "Product added successfully");
    } catch (err) {
      dialogService.showDialog(title: err.toString());
    }
  }
}
