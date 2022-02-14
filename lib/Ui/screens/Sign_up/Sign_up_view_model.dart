import 'package:logger/logger.dart';
import 'package:mody_ecommerce/Ui/widgets/setup_custom_dialog.dart';
import 'package:mody_ecommerce/app/app.locator.dart';
import 'package:mody_ecommerce/app/app.router.dart';
import 'package:mody_ecommerce/app/constants/constants.dart';
import 'package:mody_ecommerce/services/auth_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SignUpViewModel extends BaseViewModel {
  Logger log = Logger();

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void changeLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void navigateToLogin() => navigationService.navigateTo(Routes.loginView);

  void signUp({String? email, String? password}) async {
    setBusy(true);
    changeLoading(true);
    try {
      final result = await authService.signUp(
          email: email!.trim(), password: password!.trim());
      setBusy(false);
      changeLoading(false);
      await dialogService.showCustomDialog(
          variant: DialogType.basic,
          title: "Sign Up successfull",
          mainButtonTitle: "ok");
      log.i(
        result.user!.uid,
      );
    } catch (e) {
      changeLoading(false);
      await dialogService.showCustomDialog(
          variant: DialogType.basic,
          title: e.toString(),
          mainButtonTitle: "ok");
    }
  }
}
