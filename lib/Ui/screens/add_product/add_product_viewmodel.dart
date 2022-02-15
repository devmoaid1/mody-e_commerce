import 'package:mody_ecommerce/Ui/widgets/setup_custom_dialog.dart';

import 'package:mody_ecommerce/app/constants/constants.dart';
import 'package:mody_ecommerce/models/product.dart';

import 'package:stacked/stacked.dart';

class AddProductViewModel extends BaseViewModel {
  void addProduct({required Product product}) {
    try {
      storeService.addProduct(product);
      dialogService.showCustomDialog(
          variant: DialogType.admin,
          title: "Product Addded Successfully",
          mainButtonTitle: "ok");
    } catch (err) {
      dialogService.showCustomDialog(
          variant: DialogType.admin,
          title: err.toString(),
          mainButtonTitle: "ok");
    }
  }
}
