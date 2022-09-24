import 'dart:async';

import 'package:mody_ecommerce/app/constants/constants.dart';
import 'package:stacked/stacked.dart';

import '../../../app/app.router.dart';

class SplashViewModel extends BaseViewModel {
  void getUser() {
    setBusy(true);
    try {
      authService.getCurrentUser();
      setBusy(false);
    } catch (err) {
      setBusy(false);
      logger.e(err.toString());
    }
  }

  Future<void> init() async {
    Timer(const Duration(seconds: 4), () {
      getUser();
      navigationService.replaceWith(Routes.myHomePage);
    });
  }
}
