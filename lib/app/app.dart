@StackedApp(
  routes: [
    CupertinoRoute(page: SplashScreen, initial: true),
    CupertinoRoute(page: LoginView),
    CupertinoRoute(page: MyHomePage),
    CupertinoRoute(page: SignUpView),
    CupertinoRoute(page: AdminHomePage),
    CupertinoRoute(page: AddProductView),
    CupertinoRoute(page: ManageProductView),
    CupertinoRoute(page: EditProductView),
    CupertinoRoute(page: ViewOrdersView),
    CupertinoRoute(page: ProductDetailsView),
    CupertinoRoute(page: CartView),
    CupertinoRoute(page: OrderDetailsView)
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: AuthService),
    LazySingleton(classType: StoreService),
    LazySingleton(classType: OrderService),
  ],
  logger: StackedLogger(),
)

// flutter pub run build_runner build --delete-conflicting-outputs
import 'package:mody_ecommerce/Ui/screens/Login/login_view.dart';
import 'package:mody_ecommerce/Ui/screens/Sign_up/sign_up_view.dart';
import 'package:mody_ecommerce/Ui/screens/add_product/add_product_view.dart';
import 'package:mody_ecommerce/Ui/screens/admin_home/admin_home_view.dart';
import 'package:mody_ecommerce/Ui/screens/cart/cart_view.dart';
import 'package:mody_ecommerce/Ui/screens/edit_product/edit_product_view.dart';

import 'package:mody_ecommerce/Ui/screens/home/home_view.dart';
import 'package:mody_ecommerce/Ui/screens/manage_product/manage_product_view.dart';
import 'package:mody_ecommerce/Ui/screens/order_details/order_details_view.dart';
import 'package:mody_ecommerce/Ui/screens/product_details/product_details_view.dart';
import 'package:mody_ecommerce/Ui/screens/splash/splash_view.dart';
import 'package:mody_ecommerce/Ui/screens/view_orders/view_orders_view.dart';
import 'package:mody_ecommerce/services/auth_service.dart';
import 'package:mody_ecommerce/services/orders_Service.dart';
import 'package:mody_ecommerce/services/store_service.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
