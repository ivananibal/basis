import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class Navigate {
  
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Navigate._();
  static final Navigate to = Navigate._();
  factory Navigate() => to;

  Future<void> pushNamed(String routeName, {Object arguments}) async {
    await navigatorKey.currentState?.pushNamed(routeName, arguments: arguments);
  }

  Future<void> pushNamedAndRemoveUntil(String routeName, bool Function(Route<dynamic>) predicate, {Object arguments}) async {
    await navigatorKey.currentState?.pushNamedAndRemoveUntil(routeName, predicate, arguments: arguments);
  }

  Future<void> pushReplacementNamed(String routeName, {Object arguments}) async {
    await navigatorKey.currentState?.pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<void> popAndPushNamed<TO extends Object>(String routeName, {TO result, Object arguments}) async {
    await navigatorKey.currentState?.popAndPushNamed(routeName, result: result, arguments: arguments);
  }

  void pop<TO extends Object>([TO result]) {
    navigatorKey.currentState?.pop(result);
  }

}