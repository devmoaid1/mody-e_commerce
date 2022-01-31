// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../Ui/screens/Login/login_view.dart';
import '../Ui/screens/Sign_up/sign_up_view.dart';
import '../Ui/screens/admin_home/admin_home_view.dart';
import '../Ui/screens/home/home_view.dart';

class Routes {
  static const String loginView = '/';
  static const String myHomePage = '/my-home-page';
  static const String signUpView = '/sign-up-view';
  static const String adminHomePage = '/admin-home-page';
  static const all = <String>{
    loginView,
    myHomePage,
    signUpView,
    adminHomePage,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.loginView, page: LoginView),
    RouteDef(Routes.myHomePage, page: MyHomePage),
    RouteDef(Routes.signUpView, page: SignUpView),
    RouteDef(Routes.adminHomePage, page: AdminHomePage),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    LoginView: (data) {
      var args = data.getArgs<LoginViewArguments>(
        orElse: () => LoginViewArguments(),
      );
      return CupertinoPageRoute<dynamic>(
        builder: (context) => LoginView(key: args.key),
        settings: data,
      );
    },
    MyHomePage: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const MyHomePage(),
        settings: data,
      );
    },
    SignUpView: (data) {
      var args = data.getArgs<SignUpViewArguments>(
        orElse: () => SignUpViewArguments(),
      );
      return CupertinoPageRoute<dynamic>(
        builder: (context) => SignUpView(key: args.key),
        settings: data,
      );
    },
    AdminHomePage: (data) {
      var args = data.getArgs<AdminHomePageArguments>(
        orElse: () => AdminHomePageArguments(),
      );
      return CupertinoPageRoute<dynamic>(
        builder: (context) => AdminHomePage(key: args.key),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// LoginView arguments holder class
class LoginViewArguments {
  final Key? key;
  LoginViewArguments({this.key});
}

/// SignUpView arguments holder class
class SignUpViewArguments {
  final Key? key;
  SignUpViewArguments({this.key});
}

/// AdminHomePage arguments holder class
class AdminHomePageArguments {
  final Key? key;
  AdminHomePageArguments({this.key});
}
