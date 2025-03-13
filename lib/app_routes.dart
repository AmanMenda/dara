import 'package:dara/constants/routes.dart';
import 'package:dara/views/login/login_view.dart';
import 'package:flutter/material.dart';

/// [AppRouter]
/// This the base router to handle routes
class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.login:
        return MaterialPageRoute(builder: (_) => const LoginView());
      default:
        return MaterialPageRoute(builder: (_) => const Placeholder());
    }
  }
}