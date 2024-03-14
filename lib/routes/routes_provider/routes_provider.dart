import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// This class have all routing function encapsulated when you need to make route
/// use one of these function otherwise if you don't found it useful add your a new function here
class RoutingProvider {
  // global key to manage all route statements
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  /// go back to previous screen
  static void goBack() {
    if (canPop()) {
      return navigatorKey.currentState!.pop();
    } else {
      if (Platform.isAndroid) {
        SystemNavigator.pop();
      } else if (Platform.isIOS) {
        exit(0);
      }
    }
  }

  /// go back to previous screen with data
  static void goBackWithResult(var result) {
    return navigatorKey.currentState!.pop(result);
  }

  /// check if possible to pop
  static bool canPop() {
    return navigatorKey.currentState!.canPop();
  }

  /// push named screen route to the navigator stack
  static Future<dynamic> pushNamed({String? routeName, dynamic arguments}) {
    return navigatorKey.currentState!
        .pushNamed(routeName!, arguments: arguments);
  }

  /// push named screen route to the navigator stack and remove all previous screens
  static Future<dynamic> pushNamedAndRemoveAllBack(
      {String? routeName, dynamic arguments}) {
    return navigatorKey.currentState!.pushNamedAndRemoveUntil(
        routeName!, (route) => false,
        arguments: arguments);
  }
 /// push named screen route and remove until specific screen
  static Future<dynamic> pushNamedAndRemoveUntil(
      {required String routeName,
      required String stopRoute,
      dynamic arguments}) {
    return navigatorKey.currentState!.pushNamedAndRemoveUntil(
        routeName, ModalRoute.withName(stopRoute),
        arguments: arguments);
  }
}
