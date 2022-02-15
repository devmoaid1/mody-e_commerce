import 'package:mody_ecommerce/Ui/widgets/setup_custom_dialog.dart';
import 'package:mody_ecommerce/app/app.locator.dart';
import 'package:mody_ecommerce/app/app.router.dart';
import 'package:mody_ecommerce/app/constants/constants.dart';
import 'package:mody_ecommerce/services/auth_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AdminHomeViewModel extends BaseViewModel {
  void navigateToAddProducts() =>
      navigationService.navigateTo(Routes.addProductView);

  void navigateToEditProducts() =>
      navigationService.navigateTo(Routes.manageProductView);

  void navigateToViewOrders() =>
      navigationService.navigateTo(Routes.viewOrdersView);

  void logout() async {
    setBusy(true);
    try {
      await authService.logout();
      setBusy(false);
      navigationService.replaceWith(Routes.loginView);
    } catch (e) {
      setBusy(false);
      await dialogService.showCustomDialog(
          variant: DialogType.admin,
          title: e.toString(),
          mainButtonTitle: "ok");
    }
  }
}
