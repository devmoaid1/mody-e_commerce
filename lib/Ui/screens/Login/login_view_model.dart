import 'package:logger/logger.dart';
import 'package:mody_ecommerce/Ui/widgets/setup_custom_dialog.dart';
import 'package:mody_ecommerce/app/app.locator.dart';
import 'package:mody_ecommerce/app/app.router.dart';
import 'package:mody_ecommerce/app/constants/constants.dart';
import 'package:mody_ecommerce/services/auth_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends BaseViewModel {
  Logger log = Logger();

  final String? adminPassword = "admin123";
  bool _isLoading = false; //loading state
  bool _isAdmin = false; // user or admin identifier state

  bool get isAdmin => _isAdmin;
  bool get isLoading => _isLoading;

  void setIsAdmin(bool value) {
    _isAdmin = value;
    notifyListeners();
  }

  void changeLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void navigateToSignUp() => navigationService.navigateTo(Routes.signUpView);

  void login({String? email, String? password}) async {
    setBusy(true);
    changeLoading(true);

    if (_isAdmin) {
      if (password == adminPassword) {
        try {
          final result =
              await authService.login(email: email, password: password);

          setBusy(false);
          changeLoading(false);

          navigationService.navigateTo(Routes.adminHomePage);
        } catch (e) {
          changeLoading(false);
          dialogService.showCustomDialog(
              variant: DialogType.basic,
              title: e.toString(),
              mainButtonTitle: "ok");
        }
      } else {
        changeLoading(false);
        dialogService.showCustomDialog(
            variant: DialogType.basic,
            title: "something went wrong",
            mainButtonTitle: "ok");
      }
    } else {
      if (_isAdmin == false && password == adminPassword) {
        changeLoading(false);
        dialogService.showCustomDialog(
            variant: DialogType.basic,
            title: "something went wrong",
            mainButtonTitle: "ok");
      } else {
        try {
          await authService.login(email: email, password: password);

          setBusy(false);
          changeLoading(false);

          navigationService.navigateTo(Routes.myHomePage);
        } catch (e) {
          changeLoading(false);
          dialogService.showCustomDialog(
              variant: DialogType.basic,
              title: e.toString(),
              mainButtonTitle: "ok");
        }
      }
    }
  }
}
