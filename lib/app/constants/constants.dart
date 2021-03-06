import 'package:logger/logger.dart';
import 'package:mody_ecommerce/Ui/screens/product_details/product_details_viewModel.dart';
import 'package:mody_ecommerce/app/app.locator.dart';
import 'package:mody_ecommerce/services/auth_service.dart';
import 'package:mody_ecommerce/services/orders_Service.dart';
import 'package:mody_ecommerce/services/store_service.dart';
import 'package:stacked_services/stacked_services.dart';

//firestore collections
const String productCollection = "products";
const String ordersCollection = "orders";

//services instances
final navigationService = locator<NavigationService>();
final dialogService = locator<DialogService>();
final authService = locator<AuthService>();
final storeService = locator<StoreService>();
final orderService = locator<OrderService>();

//viewModels

ProductDetailsViewModel productDetailsViewModel = ProductDetailsViewModel();

//logger

final Logger logger = Logger();

const String jacketCategory = "jackets";
const String shoesCategory = "shoes";
const String tShirtsCategory = "T-shirts";
const String trousersCategory = "trousers";
