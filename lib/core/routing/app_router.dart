import 'package:flutter/material.dart';
import 'package:instagram/core/routing/routing.dart';
import 'package:instagram/presentation/views/register/login_screen.dart';
import 'package:instagram/presentation/views/splash/splash_screen.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.login:
        return getPageRoute(const LoginScreen());

      case Routes.splash:
        return getPageRoute(SplashScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}

PageRoute getPageRoute(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}
