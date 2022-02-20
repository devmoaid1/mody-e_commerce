import 'package:device_preview/device_preview.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mody_ecommerce/Ui/widgets/setup_custom_dialog.dart';

import 'app/app.locator.dart';
import 'mody_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupLocator();
  setupDialogUi();

  runApp(const MyApp());
}
