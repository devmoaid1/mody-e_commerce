import 'dart:async';

import 'package:mody_ecommerce/app/constants/constants.dart';
import 'package:stacked/stacked.dart';

import '../../../app/app.router.dart';

class SplashViewModel extends BaseViewModel {
  Future<void> init() async {
    Timer(const Duration(seconds: 3), () {
      navigationService.replaceWith(Routes.myHomePage);
    });
  }
}
