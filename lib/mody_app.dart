import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:mody_ecommerce/app/app.router.dart';

import 'package:stacked_services/stacked_services.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: DevicePreview.appBuilder,
      title: 'Flutter Demo',
      navigatorKey: StackedService.navigatorKey,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      localizationsDelegates: const [
        FormBuilderLocalizations.delegate,
      ],
      onGenerateRoute: StackedRouter().onGenerateRoute,
    );
  }
}
