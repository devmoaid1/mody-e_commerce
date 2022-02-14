import 'package:mody_ecommerce/Ui/widgets/setup_custom_dialog.dart';

import '/app/constants/constants.dart';
import '/models/product.dart';
import 'package:stacked/stacked.dart';

class EditProductViewModel extends BaseViewModel {
  void update({String? id, Product? product}) {
    setBusy(true);

    try {
      storeService.editProduct(id: id, product: product);
      setBusy(false);
      dialogService.showCustomDialog(
          variant: DialogType.basic,
          title: "Updated Product !",
          mainButtonTitle: "ok");
    } catch (err) {
      dialogService.showCustomDialog(
          variant: DialogType.basic,
          title: err.toString(),
          mainButtonTitle: "ok");
    }
  }
}
