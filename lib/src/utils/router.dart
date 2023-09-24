import 'package:flutter/material.dart';
import 'package:to_do_zen/src/screens/unknown_screen.dart';

class AppRouter {
  final Map<String, WidgetBuilder> routes;

  AppRouter(this.routes);

  Route<dynamic> generateRoute(RouteSettings settings) {
    final name = settings.name;
    final route = routes[name];

    if (route != null) {
      return MaterialPageRoute(
        builder: (context) => route(context),
        settings: settings
      );
    }

    return MaterialPageRoute(builder: (context) => const UnknownScreen());
  }
}
