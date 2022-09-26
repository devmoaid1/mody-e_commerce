import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:mody_ecommerce/app/app.router.dart';

import 'package:stacked_services/stacked_services.dart';

class ModyApp extends StatelessWidget {
  const ModyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mody',
      debugShowCheckedModeBanner: false,
      builder: DevicePreview.appBuilder,
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
