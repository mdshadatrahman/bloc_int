import 'package:flutter/material.dart';
import 'package:flutter_bloc_learning/presentation/screens/forth_screen.dart';
import 'package:flutter_bloc_learning/presentation/screens/home_screen.dart';
import 'package:flutter_bloc_learning/presentation/screens/second_screen.dart';
import 'package:flutter_bloc_learning/presentation/screens/third_screen.dart';

class AppRouter {
  Route? onGenereateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(color: Colors.blue),
        );

      case '/second':
        return MaterialPageRoute(
          builder: (_) => const SecondScreen(color: Colors.red),
        );

      case '/third':
        return MaterialPageRoute(
          builder: (_) => const ThirdScreen(color: Colors.green),
        );

      case '/fourth':
        return MaterialPageRoute(
          builder: (_) => const ForthScreen(color: Colors.yellowAccent),
        );

      default:
        return null;
    }
  }
}
