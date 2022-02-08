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
import '../Ui/screens/add_product/add_product_view.dart';
import '../Ui/screens/admin_home/admin_home_view.dart';
import '../Ui/screens/edit_product/edit_product_view.dart';
import '../Ui/screens/home/home_view.dart';
import '../Ui/screens/manage_product/manage_product_view.dart';
import '../Ui/screens/view_orders/view_orders.dart';
import '../models/product.dart';

class Routes {
  static const String loginView = '/';
  static const String myHomePage = '/my-home-page';
  static const String signUpView = '/sign-up-view';
  static const String adminHomePage = '/admin-home-page';
  static const String addProductView = '/add-product-view';
  static const String manageProductView = '/manage-product-view';
  static const String editProductView = '/edit-product-view';
  static const String viewOrdersView = '/view-orders-view';
  static const all = <String>{
    loginView,
    myHomePage,
    signUpView,
    adminHomePage,
    addProductView,
    manageProductView,
    editProductView,
    viewOrdersView,
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
    RouteDef(Routes.addProductView, page: AddProductView),
    RouteDef(Routes.manageProductView, page: ManageProductView),
    RouteDef(Routes.editProductView, page: EditProductView),
    RouteDef(Routes.viewOrdersView, page: ViewOrdersView),
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
    AddProductView: (data) {
      var args = data.getArgs<AddProductViewArguments>(
        orElse: () => AddProductViewArguments(),
      );
      return CupertinoPageRoute<dynamic>(
        builder: (context) => AddProductView(key: args.key),
        settings: data,
      );
    },
    ManageProductView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const ManageProductView(),
        settings: data,
      );
    },
    EditProductView: (data) {
      var args = data.getArgs<EditProductViewArguments>(
        orElse: () => EditProductViewArguments(),
      );
      return CupertinoPageRoute<dynamic>(
        builder: (context) => EditProductView(
          key: args.key,
          product: args.product,
        ),
        settings: data,
      );
    },
    ViewOrdersView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const ViewOrdersView(),
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

/// AddProductView arguments holder class
class AddProductViewArguments {
  final Key? key;
  AddProductViewArguments({this.key});
}

/// EditProductView arguments holder class
class EditProductViewArguments {
  final Key? key;
  final Product? product;
  EditProductViewArguments({this.key, this.product});
}
