import 'package:flutter/material.dart';
import 'package:buscappme/screen/index_screens.dart';


class MyRoutes {
  static const String rLOGIN = '/login';
  static const String rVERIFY = '/verify';
  static const String rHOME = '/home';


  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case ('/login'):
        return MaterialPageRoute(builder: (_) => const TabLoginScreen());

      case ('/verify'):
        return MaterialPageRoute(builder: (_) => const VerifyAuthScreen());

      case ('/home'):
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      
      default:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
    }
  }
}
