import 'package:mody_ecommerce/app/app.locator.dart';
import 'package:mody_ecommerce/services/auth_service.dart';
import 'package:mody_ecommerce/services/store_service.dart';
import 'package:stacked_services/stacked_services.dart';

//firestore collections
const String productCollection = "products";

//services instances
final navigationService = locator<NavigationService>();
final dialogService = locator<DialogService>();
final authService = locator<AuthService>();
final storeService = locator<StoreService>();
