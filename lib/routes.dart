import 'package:flutter/material.dart';
import 'package:starter/screens/slot_detail/slot_detail.dart';
import 'screens/home/home.dart';

enum Routes { home, slotDetail }

typedef Widget RouteBuilder(Map<String, dynamic> params);

class Router {
  static const paths = <String, Routes>{
    "/": Routes.home,
    "/slot": Routes.slotDetail,
  };

  static Map<Routes, RouteBuilder> builders = {
    Routes.home: (args) => Home(),
    Routes.slotDetail: (args) => SlotDetail(args == null ? null : args["slot"]),
  };

  static Widget homePage = Home();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final route = paths[settings.name];
    final builder = builders[route];

    return new MaterialPageRoute(
      settings: settings,
      builder: (context) => builder(settings.arguments),
    );
  }

  final BuildContext _context;

  NavigatorState get _navigator => Navigator.of(_context);

  const Router._(this._context);

  factory Router.of(BuildContext context) => Router._(context);

  void push(Routes route, {Object arguments}) {
    final path = paths.keys.firstWhere((key) => paths[key] == route);

    _navigator.pushNamed(
      path,
      arguments: arguments ?? <String, dynamic>{},
    );
  }

  void pop() => _navigator.pop();
}
