import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex/core/routes/app_routes.dart';
import 'package:pokedex/core/utils/app_colors.dart';
import 'package:pokedex/core/utils/app_theme.dart';
import 'package:pokedex/ui/screens/splash/splash_screen.dart';

class App extends ConsumerStatefulWidget {
  const App({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AppState();
}

class _AppState extends ConsumerState<App> {

  @override
  void initState() { 
    initConfig();
    super.initState();
  }

  void initConfig() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    if (Platform.isAndroid) {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith());
    }
  }

  @override
  Widget build(BuildContext context) {

    final theme = AppTheme().theme;

    return MaterialApp(
      initialRoute: SplashScreen.route,
      onGenerateRoute: AppRoutes.onGenerateRoute,
      debugShowCheckedModeBanner: false,
      title: 'Pokedex',
      theme: theme.copyWith(
        highlightColor: Colors.transparent,
        colorScheme: theme.colorScheme.copyWith(primary: AppColors.primary)
      ),
      builder: (BuildContext context, child) {
        final MediaQueryData data = MediaQuery.of(context);
        return MediaQuery(
          data: data.copyWith(textScaleFactor: 1, alwaysUse24HourFormat: false),
          child: child!,
        );
      },
    );
  }
}