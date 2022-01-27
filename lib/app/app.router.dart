// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../Ui/screens/Login/login_view.dart';
import '../Ui/screens/home/home_view.dart';

class Routes {
  static const String myHomePage = '/my-home-page';
  static const String loginView = '/';
  static const all = <String>{
    myHomePage,
    loginView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.myHomePage, page: MyHomePage),
    RouteDef(Routes.loginView, page: LoginView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    MyHomePage: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const MyHomePage(),
        settings: data,
      );
    },
    LoginView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const LoginView(),
        settings: data,
      );
    },
  };
}
