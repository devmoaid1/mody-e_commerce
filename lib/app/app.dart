@StackedApp(routes: [
  CupertinoRoute(page: LoginView, initial: true),
  CupertinoRoute(page: MyHomePage),
  CupertinoRoute(page: SignUpView),
  CupertinoRoute(page: AdminHomePage),
], dependencies: [
  LazySingleton(classType: NavigationService),
  LazySingleton(classType: DialogService),
  LazySingleton(classType: AuthService),
], logger: StackedLogger())

// flutter pub run build_runner build --delete-conflicting-outputs
import 'package:mody_ecommerce/Ui/screens/Login/login_view.dart';
import 'package:mody_ecommerce/Ui/screens/Sign_up/sign_up_view.dart';
import 'package:mody_ecommerce/Ui/screens/admin_home/admin_home_view.dart';
import 'package:mody_ecommerce/Ui/screens/home/home_view.dart';
import 'package:mody_ecommerce/services/auth_service.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
