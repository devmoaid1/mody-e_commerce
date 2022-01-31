import 'package:logger/logger.dart';
import 'package:mody_ecommerce/app/app.locator.dart';
import 'package:mody_ecommerce/app/app.router.dart';
import 'package:mody_ecommerce/services/auth_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends BaseViewModel {
  Logger log = Logger();
  final _navigationService = locator<NavigationService>();
  final _dialogService = locator<DialogService>();
  final _authService = locator<AuthService>();
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

  void navigateToSignUp() => _navigationService.navigateTo(Routes.signUpView);

  void login({String? email, String? password}) async {
    setBusy(true);
    changeLoading(true);

    if (_isAdmin) {
      if (password == adminPassword) {
        try {
          final result =
              await _authService.login(email: email, password: password);

          setBusy(false);
          changeLoading(false);

          _navigationService.navigateTo(Routes.adminHomePage);
        } catch (e) {
          changeLoading(false);
          _dialogService.showDialog(title: e.toString());
        }
      } else {
        changeLoading(false);
        _dialogService.showDialog(title: "Something went wrong");
      }
    } else {
      try {
        final result =
            await _authService.login(email: email, password: password);

        setBusy(false);
        changeLoading(false);

        _navigationService.navigateTo(Routes.myHomePage);
      } catch (e) {
        changeLoading(false);
        _dialogService.showDialog(title: e.toString());
      }
    }
  }
}
