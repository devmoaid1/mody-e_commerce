import 'package:logger/logger.dart';
import 'package:mody_ecommerce/app/app.locator.dart';
import 'package:mody_ecommerce/app/app.router.dart';
import 'package:mody_ecommerce/services/auth_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SignUpViewModel extends BaseViewModel {
  Logger log = Logger();
  final _navigationService = locator<NavigationService>();
  final _dialogService = locator<DialogService>();
  final _authService = locator<AuthService>();
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void changeLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void navigateToLogin() => _navigationService.navigateTo(Routes.loginView);

  void signUp({String? email, String? password}) async {
    setBusy(true);
    changeLoading(true);
    try {
      final result =
          await _authService.signUp(email: email, password: password);
      setBusy(false);
      changeLoading(false);
      _dialogService.showDialog(title: result.user!.uid);
      log.i(
        result.user!.uid,
      );
    } catch (e) {
      _dialogService.showDialog(title: e.toString());
    }
  }
}
