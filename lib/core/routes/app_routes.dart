import 'package:flutter/material.dart';
import 'package:pokedex/core/utils/app_arguments.dart';
import 'package:pokedex/ui/screens/details/details_screen.dart';
import 'package:pokedex/ui/screens/home/home_screen.dart';
import 'package:pokedex/ui/screens/splash/splash_screen.dart';

class AppRoutes {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomeScreen.route:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case DetailsScreen.route:
        return MaterialPageRoute(
            settings: settings,
            builder: (_) => DetailsScreen(
                arguments: settings.arguments as DetailsArguments));
      default:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const SplashScreen());
    }
  }
}
