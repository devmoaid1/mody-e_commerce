import 'package:flutter/material.dart';
import 'package:mody_ecommerce/app/app.router.dart';

import 'package:stacked_services/stacked_services.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      navigatorKey: StackedService.navigatorKey,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: StackedRouter().onGenerateRoute,
    );
  }
}
