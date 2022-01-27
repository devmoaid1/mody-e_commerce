@StackedApp(routes: [
  CupertinoRoute(page: MyHomePage),
  CupertinoRoute(page: LoginView, initial: true)
], dependencies: [
  LazySingleton(classType: NavigationService),
  LazySingleton(classType: DialogService),
], logger: StackedLogger())

// flutter pub run build_runner build --delete-conflicting-outputs
import 'package:mody_ecommerce/Ui/screens/Login/login_view.dart';
import 'package:mody_ecommerce/Ui/screens/home/home_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
