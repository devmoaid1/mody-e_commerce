import 'package:mody_ecommerce/app/app.locator.dart';
import 'package:mody_ecommerce/app/app.router.dart';
import 'package:mody_ecommerce/services/auth_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AdminHomeViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _authService = locator<AuthService>();
  final _dialogService = locator<DialogService>();

  void navigateToAddProducts() =>
      _navigationService.navigateTo(Routes.addProductView);

  void navigateToEditProducts() =>
      _navigationService.navigateTo(Routes.editProductView);

  void navigateToViewOrders() =>
      _navigationService.navigateTo(Routes.viewOrdersView);

  void logout() async {
    setBusy(true);
    try {
      await _authService.logout();
      setBusy(false);
      _navigationService.replaceWith(Routes.loginView);
      _dialogService.showDialog(title: "Logout success !");
    } catch (e) {
      setBusy(false);
      _dialogService.showDialog(title: e.toString());
    }
  }
}
